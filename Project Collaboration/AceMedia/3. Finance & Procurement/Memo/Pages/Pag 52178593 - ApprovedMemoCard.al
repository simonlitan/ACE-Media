page 52178593 "Approved Memo Card"
{
    PageType = Card;
    Editable = false;
    SourceTable = "FIN-Memo Header";
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")

                {
                    Editable = false;
                    Caption = 'Memo No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';

                }
                field("Date/Time"; Rec."Date/Time")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    NotBlank = true;
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = all;
                    NotBlank = true;
                }
                field(Through; Rec.Through)
                {
                    ApplicationArea = all;
                    NotBlank = true;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = all;
                    Editable = false;
                    NotBlank = true;
                }

                field("REF."; Rec."Title/Ref.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    NotBlank = true;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Grade field.';
                    NotBlank = true;
                }

                field(Title; Rec.Title)
                {
                    Caption = 'Subject';
                    ApplicationArea = all;
                    NotBlank = true;
                }


                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    //  NotBlank = true;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }

                field("Budget Account"; Rec."Budget Account")
                {
                    ApplicationArea = All;
                    //   Editable = false;
                    NotBlank = true;
                }

                field("Memo Used"; Rec."Memo Used")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                }
                field(PRN; Rec.PRN)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        CurrPage.UPDATE;
                        if rec.prn = true then setEditable2 := true else setEditable2 := false;
                    end;
                }


                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    NotBlank = true;
                }
                field("PRN No."; Rec."PRN No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                }

                field("Associated Document No."; Rec."Associated Document No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    visible = false;
                }
                field("Associated Document Type"; Rec."Associated Document Type")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                }
                field("Memo Value"; Rec."Memo Value")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    NotBlank = true;
                }


                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }
                field("Memo Status"; Rec."Memo Status")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;

                    trigger OnValidate()
                    begin
                        if Rec."Memo Status" = Rec."Memo Status"::Approved then begin
                            // Rec.GenerateImprests();
                            Rec."Memo Used" := true;
                        end;
                    end;
                }


            }
            group("Description Of Memo")
            {
                field("Paragraph 1"; Rec."Paragraph 1")
                {
                    ShowCaption = false;
                    ApplicationArea = all;
                    MultiLine = true;
                    Caption = 'Subject Of Memo';
                    NotBlank = true;
                }
                field("Paragraph 2"; Rec."Paragraph 2")
                {
                    ShowCaption = false;
                    ApplicationArea = all;
                    MultiLine = true;
                    Caption = 'Subject Continuation';
                }
            }
            part(part; "Memo PRN Details")
            {
                ApplicationArea = all;
                Editable = setEditable2;
                // Enabled = setEditable2;
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
        /*  area(FactBoxes)
         {
             part("Attached Documents"; "Document Attachment Factbox")
             {
                 ApplicationArea = all;
                 SubPageLink = "Table ID" = CONST(52178771),
                               "No." = FIELD("No.");
             }
         } */
    }

    actions
    {
        area(Creation)
        {
            action(ExpCodes)
            {
                Caption = 'Roles';
                ApplicationArea = All;
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Process;
                Visible = fieldvisible;
                RunObject = Page "FIN-Memo Expense Codes";
                RunPageLink = "Memo No." = FIELD("No.");
            }
            action(MemRep)
            {
                ApplicationArea = All;
                Caption = 'Imprest Memo Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    cashoff: Record "Cash Office Setup";
                begin
                    cashoff.Get();
                    Rec."Budget Name" := cashoff."Current Budget";
                    Rec."Budgeted Amount2" := Rec."Budgeted Amount";
                    Rec."Committed Amount2" := Rec."Committed Amount" * -1;
                    Rec."Expensed Amount2" := Rec."Expensed Amount" * -1;
                    FINMemoHeader.RESET;
                    FINMemoHeader.SETRANGE("No.", Rec."No.");
                    IF FINMemoHeader.FIND('-') THEN BEGIN
                        REPORT.RUN(Report::"FIN-Memo Report", TRUE, FALSE, FINMemoHeader);
                    END;
                end;
            }
            action(MemRep1)
            {
                ApplicationArea = All;
                Caption = 'PRN Memo Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    cashoff: Record "Cash Office Setup";
                begin
                    cashoff.Get();
                    Rec."Budget Name" := cashoff."Current Budget";
                    Rec."Budgeted Amount2" := Rec."Budgeted Amount";
                    Rec."Committed Amount2" := Rec."Committed Amount" * -1;
                    Rec."Expensed Amount2" := Rec."Expensed Amount" * -1;
                    FINMemoHeader.RESET;
                    FINMemoHeader.SETRANGE("No.", Rec."No.");
                    IF FINMemoHeader.FIND('-') THEN BEGIN
                        REPORT.RUN(Report::"PRN Memo Report", TRUE, FALSE, FINMemoHeader);
                    END;
                end;
            }
            /* action("EDMS")
            {
                ApplicationArea = All;

                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange("Document Type", DMS."Document Type"::Memo);
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."No.");
                    end else
                        Message('No Link ' + format(DMS."Document Type"::Memo));
                end;

            } */
            action("File Attachment")
            {
                ApplicationArea = All;

                Image = Attach;
                Promoted = true;
                PromotedCategory = category5;

                trigger OnAction()

                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;


            }

            action(sendApproval)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Category4;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    Rec.CheckDetails();
                    ApprovalMgt.OnSendMemoforApproval(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action(cancellsApproval)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    ApprovalMgt.OnCancelMemoForApproval(Rec);
                end;
            }
            /*  action(MarkPost)
             {
                 ApplicationArea = All;
                 Caption = 'Mark Posted';
                 Image = ActivateDiscounts;
                 Promoted = true;
                 PromotedCategory = Process;

                 trigger OnAction()
                 begin
                     IF Rec."Memo Status" <> Rec."Memo Status"::Approved THEN ERROR('Status must be Approved!');
                     IF CONFIRM('Mark as Posted?', FALSE) = FALSE THEN ERROR('Posting Cancelled!');
                     Rec."Memo Status" := Rec."Memo Status"::Posted;
                 end;
             } */




        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec."Memo Status" = Rec."Memo Status"::Pending THEN setEditable := TRUE ELSE setEditable := FALSE;
        IF Rec.PRN THEN setEditable2 := TRUE ELSE setEditable2 := FALSE;
        if rec."Memo Status" <> rec."Memo Status"::Pending then fieldvisible := false else fieldvisible := true;
    end;

    trigger OnInit()
    begin
        IF Rec."Memo Status" = Rec."Memo Status"::Pending THEN setEditable := TRUE ELSE setEditable := FALSE;
        IF Rec.PRN THEN setEditable2 := TRUE ELSE setEditable2 := FALSE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        IF Rec.PRN THEN setEditable2 := TRUE ELSE setEditable2 := FALSE;
    end;

    var
        DMS: Record EDMS;
        fieldvisible: Boolean;
        FINMemoHeader: Record "FIN-Memo Header";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        DateEquivalent: Date;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Farmer Application",Vehicle_Reg,"Sales Returns","Transfer Order",Payroll,"Casual Payroll",Memo;
        ApprovalEntries: Page "Fin-Approval Entries";
        setEditable: Boolean;
        setEditable2: Boolean;
        FinImprestHeader: Record "FIN-Imprest Header";
        FinImprestLines: Record "FIN-Imprest Lines";
        FinMemoDetails: Record "FIN-Memo Details";
        FinMemoDetails2: Record "FIN-Memo Details";
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        DocAttach: codeunit "DocumentAttachment2";



    local procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        FINMemoDetails: Record "FIN-Memo Details";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Payroll Budget Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD(BCSetup."Current Budget Code");
        Rec.TESTFIELD("Region");
        Rec.TESTFIELD("Global Dimension 1 Code");
        Rec.TESTFIELD("Global Dimension 2 Code");
        Rec.TESTFIELD("Budget Account");

        FINMemoDetails.RESET;
        FINMemoDetails.SETRANGE("Memo No.", Rec."No.");
        IF FINMemoDetails.FIND('-') THEN FINMemoDetails.CALCSUMS(Amount);
        // Check if budget exists
        GLAccount.RESET;
        GLAccount.SETRANGE("No.", Rec."Budget Account");
        IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
        DimensionValue.RESET;
        DimensionValue.SETRANGE(Code, Rec."Global Dimension 1 Code");
        //   DimensionValue.SETRANGE("Global Dimension No.",2);
        IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
        FINBudgetEntries.RESET;
        FINBudgetEntries.SETRANGE(FINBudgetEntries."Budget Name", BCSetup."Current Budget Code");
        FINBudgetEntries.SETRANGE(FINBudgetEntries."G/L Account No.", Rec."Budget Account");
        FINBudgetEntries.SETRANGE(FINBudgetEntries."Global Dimension 1 Code", Rec."Region");
        FINBudgetEntries.SETRANGE(FINBudgetEntries."Global Dimension 2 Code", Rec."Global Dimension 1 Code");
        FINBudgetEntries.SETRANGE(FINBudgetEntries."Budget Dimension 3 Code", Rec."Global Dimension 2 Code");
        FINBudgetEntries.SETFILTER(FINBudgetEntries."Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
        , FINBudgetEntries."Transaction Type"::Allocation);
        FINBudgetEntries.SETFILTER(FINBudgetEntries."Commitment Status", '%1|%2',
        FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
        CLEAR(DateEquivalent);
        IF EVALUATE(DateEquivalent, FORMAT(Rec."Date/Time")) THEN;
        FINBudgetEntries.SETFILTER(FINBudgetEntries.Date, PostBudgetEnties.GetBudgetStartAndEndDates(DateEquivalent));
        IF FINBudgetEntries.FIND('-') THEN BEGIN
            IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                IF FINBudgetEntries.Amount > 0 THEN BEGIN
                    IF (FINMemoDetails.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                    // Commit Budget Here
                    //          PostBudgetEnties.CheckBudgetAvailability(Rec."Budget Account",DateEquivalent,Rec."Programme Code",Rec."Global Dimension 1 Code",Rec."Global Dimension 2 Code",
                    //          FINMemoDetails.Amount,'','MEMO',Rec."No."+Rec."Budget Account",'MEMO');
                    PostBudgetEnties.CheckBudgetAvailability(Rec."Budget Account", DateEquivalent, Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
                    FINMemoDetails.Amount, '', 'MEMO', Rec."No." + Rec."Budget Account", 'MEMO');
                END ELSE
                    ERROR('No allocation for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
            END;
            //END  ELSE ERROR('Missing Budget for  Account:'+GLAccount.Name+', Department:'+DimensionValue.Name);
        END ELSE
            ERROR('Missing Budget for  Account:' + GLAccount.Name + ', For your department');
    end;

    local procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        FINMemoDetails: Record "FIN-Memo Details";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Payroll Budget Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Region");
        Rec.TESTFIELD("Global Dimension 1 Code");
        Rec.TESTFIELD("Global Dimension 2 Code");
        Rec.TESTFIELD("Budget Account");
        //Get Current Lines to loop through
        // Expense Budget Here

        FINMemoDetails.RESET;
        FINMemoDetails.SETRANGE("Memo No.", Rec."No.");
        IF FINMemoDetails.FIND('-') THEN FINMemoDetails.CALCSUMS(Amount);
        GLAccount.RESET;
        GLAccount.SETRANGE("No.", Rec."Budget Account");
        IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
        DimensionValue.RESET;
        DimensionValue.SETRANGE(Code, Rec."Global Dimension 2 Code");
        // DimensionValue.SETRANGE("Global Dimension No.",3);
        IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
        IF (FINMemoDetails.Amount > 0) THEN BEGIN
            // Commit Budget Here
            //     PostBudgetEnties.ExpenseBudget(Rec."Budget Account", DateEquivalent, Rec."Global Dimension 1 Code", Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
            //    FINMemoDetails.Amount, GLAccount.Name, USERID, TODAY, 'MEMO', Rec."No." + Rec."Budget Account", 'MEMO');
            PostBudgetEnties.ExpenseBudget(Rec."Budget Account", DateEquivalent, Rec."Global Dimension 1 Code", Rec."Global Dimension 2 Code",
               FINMemoDetails.Amount, GLAccount.Name, USERID, TODAY, 'MEMO', Rec."No." + Rec."Budget Account", 'MEMO');

        END;
    end;

    local procedure CancelCommitment()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        //PostBudgetEnties: Codeunit "Post Budget Enties";
        FINMemoDetails: Record "FIN-Memo Details";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Payroll Budget Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Region");
        Rec.TESTFIELD("Global Dimension 1 Code");
        Rec.TESTFIELD("Global Dimension 2 Code");
        Rec.TESTFIELD("Budget Account");
        //Get Current Lines to loop through
        // Expense Budget Here

        FINMemoDetails.RESET;
        FINMemoDetails.SETRANGE("Memo No.", Rec."No.");
        IF FINMemoDetails.FIND('-') THEN FINMemoDetails.CALCSUMS(Amount);
        // Expense Budget Here
        GLAccount.RESET;
        GLAccount.SETRANGE("No.", Rec."Budget Account");
        IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
        DimensionValue.RESET;
        DimensionValue.SETRANGE(Code, Rec."Global Dimension 2 Code");
        DimensionValue.SETRANGE("Global Dimension No.", 3);
        IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
        IF (FINMemoDetails.Amount > 0) THEN BEGIN
            // Commit Budget Here
            //          PostBudgetEnties.CancelBudgetCommitment(Rec."Budget Account",DateEquivalent,Rec."Programme Code",Rec."Global Dimension 1 Code",Rec."Global Dimension 2 Code",
            //          FINMemoDetails.Amount,GLAccount.Name,USERID,'MEMO',Rec."No."+Rec."Budget Account",'MEMO');
        END;
    end;
}


