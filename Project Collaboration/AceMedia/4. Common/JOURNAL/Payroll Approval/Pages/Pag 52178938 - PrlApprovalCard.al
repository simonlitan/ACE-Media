page 52178938 "Prl-Approval Card"
{
    PageType = Card;
    SourceTable = "Prl-Approval";
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                    Editable = false;
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gross Amount field.';
                    Editable = false;
                }
                field("Total deductions"; Rec."Total deductions")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total deductions field.';
                }
            }
            part("Journal"; "Payroll Journal Lines")
            {
                // Visible = false;
                Editable = false;
                SubPageLink = "Payroll Period" = field("Payroll Period");
                ApplicationArea = all;
            }
            part("Summary"; "Journal Summary")
            {
                Editable = false;
                SubPageLink = "Payroll Period" = field("Payroll Period");
                ApplicationArea = all;
            }


        }
    }

    actions
    {

        area(processing)
        {
            group("Request Approval")
            {
                action(Sendapproval)
                {
                    Caption = 'Send for Approval';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Init Codeunit";
                    begin

                        if ApprovalMgt.IsPrlApprovalEnabled(Rec) = true then begin
                            ApprovalMgt.OnSendPrlApprovalforApproval(Rec);
                            CommitBudget();
                        

                       end else
                         Message('Check Your Approval Workflow');
                    end;
                    // end else
                    //Message('Check Your Approval Workflow');

                }
                action(Cancelapproval)
                {
                    Caption = 'Cancel Request';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Init Codeunit";
                    begin

                        ApprovalMgt.OnCancelPrlApprovalforApproval(Rec);
                        CancelCommitment();
                    end;
                }


                action(Approvals1)
                {
                    Caption = 'Approvals Level';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    RunObject = page "Fin-Approval Entries";
                    RunPageLink = "Document No." = field(code);

                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Approvalentries: Page "Fin-Approval Entries";
                    begin
                        Approvalentries.Setfilters(DATABASE::"Prl-Approval", 16, format(Rec."Payroll Period"));
                        Approvalentries.RUN;
                    end;
                }


            }
            action(payrollvar)
            {
                Visible = true;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = report;
                Caption = 'Payroll Summary variance';
                Image = Aging;
                RunObject = Report "PR Payroll Summary - Variance";
            }
            action("Master Payroll Summary")
            {
                ApplicationArea = all;
                Caption = 'Master Payroll Summary';
                Image = "Report";
                Promoted = true;
                PromotedCategory = report;
                RunObject = Report "Payroll Summary 3";
            }


            action("Deductions Summary")
            {
                ApplicationArea = all;
                Caption = 'Deductions Summary';
                Image = Report;
                Promoted = true;
                PromotedCategory = report;
                RunObject = Report "PRL-Deductions Summary 2 a";
            }
            action("Earnings Summary")
            {
                ApplicationArea = all;
                Caption = 'Earnings Summary';
                Image = DepositSlip;
                Promoted = true;
                PromotedCategory = report;
                RunObject = Report "PRL-Earnings Summary 5";
            }

            action("Third Rule")
            {
                ApplicationArea = all;
                Caption = 'Third Rule';
                Image = AddWatch;
                Promoted = true;
                PromotedCategory = report;
                RunObject = Report "A third Rule Report";

            }

            action("bank Schedule")
            {
                ApplicationArea = all;
                Caption = 'bank Schedule';
                Image = "Report";
                Promoted = true;
                PromotedCategory = report;
                RunObject = Report "PRL-Bank Schedule";
            }
            action("Get Transactions")
            {
                ApplicationArea = all;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.GetAmounts();

                end;
            }
            action("Create Journal")
            {
                ApplicationArea = all;
                Image = TransferToGeneralJournal;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin

                    rec.CreateJnlEntry();
                    //ExpenseBudget();
                end;
            }


        }


    }
    local procedure CommitBudget()
    var
        Bdgt: Code[50];
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        BCSetup: Record "FIN-Budgetary Control Setup";
    begin
        BCSetup.Reset();
        if BCSetup.Find('-') then
            Bdgt := BCSetup."Current Budget Code";
        BCSetup.TESTFIELD("Current Budget Code");
        Jsummary.RESET;
        Jsummary.SETRANGE("Payroll Period", Rec."Payroll Period");
        IF Jsummary.FIND('-') THEN BEGIN
            REPEAT
                // Check if budget exists
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", Jsummary."G/L Account");
                GLAccount.SetRange("Budget Controlled", true);
                IF GLAccount.FIND('-') THEN begin
                    GLAccount.TESTFIELD(Name);
                    FINBudgetEntries.RESET;
                    FINBudgetEntries.SETRANGE("Budget Name", Bdgt);
                    FINBudgetEntries.SETRANGE("G/L Account No.", Jsummary."G/L Account");
                    FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Jsummary."Shortcut Dimension 1 Code");
                    FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Jsummary."Shortcut Dimension 2 Code");
                    FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment, FINBudgetEntries."Transaction Type"::Allocation);
                    FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Today));
                    IF FINBudgetEntries.FIND('-') THEN BEGIN
                        IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                            IF FINBudgetEntries.Amount > 0 THEN BEGIN
                                IF (Jsummary."Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name);
                                // Commit Budget Here
                                PostBudgetEnties.CheckBudgetAvailability(Jsummary."G/L Account", Today, Jsummary."Shortcut Dimension 1 Code", Jsummary."Shortcut Dimension 2 Code",
                                Jsummary."Amount", Jsummary."Posting Description", 'PAYROLL', Jsummary."Transaction Code" + Jsummary."Shortcut Dimension 1 Code" + Jsummary."Shortcut Dimension 2 Code"+format(rec."Period Month"), Jsummary."Posting Description");


                                
                            END ELSE
                                ERROR('No allocation for  Account:' + GLAccount.Name);
                        END;
                    END ELSE
                        ERROR('Missing Budget for  Account:' + GLAccount.Name);
                end;

            UNTIL Jsummary.NEXT = 0;
            Message('Budget Committed');
        END;

    end;

    local procedure ExpenseBudget()
    var
        Bdgt: Code[50];
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        BCSetup: Record "FIN-Budgetary Control Setup";
    begin
        BCSetup.Reset();
        if BCSetup.Find('-') then
            Bdgt := BCSetup."Current Budget Code";
        BCSetup.TESTFIELD("Current Budget Code");
        Jsummary.RESET;
        Jsummary.SETRANGE("Payroll Period", Rec."Payroll Period");
        IF Jsummary.FIND('-') THEN BEGIN
            REPEAT
                // Check if budget exists
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", Jsummary."G/L Account");
                GLAccount.SetRange("Budget Controlled", true);
                IF GLAccount.FIND('-') THEN begin
                    FINBudgetEntries.RESET;
                    FINBudgetEntries.SETRANGE("Budget Name", Bdgt);
                    FINBudgetEntries.SETRANGE("G/L Account No.", Jsummary."G/L Account");
                    FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Jsummary."Shortcut Dimension 1 Code");
                    FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Jsummary."Shortcut Dimension 2 Code");
                    FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment, FINBudgetEntries."Transaction Type"::Allocation);
                    FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Today));
                    IF FINBudgetEntries.FIND('-') THEN BEGIN
                        IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                            IF FINBudgetEntries.Amount > 0 THEN BEGIN
                                IF (Jsummary."Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name);
                                // Commit Budget Here
                                PostBudgetEnties.ExpenseBudget(Jsummary."G/L Account", Today, Jsummary."Shortcut Dimension 1 Code", Jsummary."Shortcut Dimension 2 Code",
                                Jsummary."Amount", Jsummary."Posting Description", Userid, Today, 'PAYROLL', Jsummary."Transaction Code" + Jsummary."Shortcut Dimension 1 Code" + Jsummary."Shortcut Dimension 2 Code" + format(rec."Period Month"), Jsummary."Posting Description");
                            END ELSE
                                ERROR('No allocation for  Account:' + GLAccount.Name);
                        END;
                    END ELSE
                        ERROR('Missing Budget for  Account:' + GLAccount.Name);
                end;
            UNTIL Jsummary.NEXT = 0;
            Message('Budget Expensed');
        END;

    end;

    local procedure CancelCommitment()
    var
        Bdgt: Code[50];
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        BCSetup: Record "FIN-Budgetary Control Setup";
    begin
        BCSetup.Reset();
        if BCSetup.Find('-') then
            Bdgt := BCSetup."Current Budget Code";
        BCSetup.TESTFIELD("Current Budget Code");
        Jsummary.RESET;
        Jsummary.SETRANGE("Payroll Period", Rec."Payroll Period");
        IF Jsummary.FIND('-') THEN BEGIN
            REPEAT
                // Check if budget exists
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", Jsummary."G/L Account");
                GLAccount.SetRange("Budget Controlled", true);
                IF GLAccount.FIND('-') THEN begin
                    FINBudgetEntries.RESET;
                    FINBudgetEntries.SETRANGE("Budget Name", Bdgt);
                    FINBudgetEntries.SETRANGE("G/L Account No.", Jsummary."G/L Account");
                    FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Jsummary."Shortcut Dimension 1 Code");
                    FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Jsummary."Shortcut Dimension 2 Code");
                    FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment, FINBudgetEntries."Transaction Type"::Allocation);
                    FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Jsummary."Payroll Period"));
                    IF FINBudgetEntries.FIND('-') THEN BEGIN
                        IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                            IF FINBudgetEntries.Amount > 0 THEN BEGIN
                                IF (Jsummary."Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name);
                                // Commit Budget Here
                                PostBudgetEnties.CancelBudgetCommitment(Jsummary."G/L Account", Today, Jsummary."Shortcut Dimension 1 Code", Jsummary."Shortcut Dimension 2 Code", '',
                                Jsummary."Amount", Jsummary."Posting Description", Userid, 'PAYROLL', Jsummary."Transaction Code" + Jsummary."Shortcut Dimension 1 Code" + Jsummary."Shortcut Dimension 2 Code", Jsummary."Posting Description");
                            END ELSE
                                ERROR('No allocation for  Account:' + GLAccount.Name);
                        END;
                    ENd;
                end
            // ELSE
            //  ERROR('Missing Budget for  Account:' + GLAccount.Name);
            UNTIL Jsummary.NEXT = 0;
            Message('Budget Cancelled');
        END;

    end;

    var
        Jsummary: Record "Payroll Journal Summary";
        FINBudgetEntries: Record "FIN-Budget Entries";
}
