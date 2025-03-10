page 52178519 "Fin-Imprest Accounting List"
{
    CardPageID = "FIN-Travel Advance Acc. UP";
    PageType = List;
    InsertAllowed = true;
    DelayedInsert = true;
    SourceTable = "FIN-Imprest Surr. Header";
    SourceTableView = WHERE(Status = FILTER(<> Posted));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = All;
                }

                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                }

                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = All;
                }


                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }


                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }


                field("Imprest Issue Date"; Rec."Imprest Issue Date")
                {
                    ApplicationArea = All;
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = All;
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = All;
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {

                    ApplicationArea = All;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {

                    ApplicationArea = All;
                }


                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Amount Surrendered LCY"; Rec."Amount Surrendered LCY")
                {
                    ApplicationArea = All;
                }


            }
        }
    }

    actions
    {
        area(processing)
        {



            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER(No, Rec.No);
                    REPORT.RUN(Report::"Imprest Surrender", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }
    }

    var
        Rcpt: Record "FIN-Imprest Surr. Header";
        //ApprovalEntries: Page "658";
        RecPayTypes: Record "FIN-Receipts and Payment Types";
        TarriffCodes: Record "FIN-Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "FIN-Cash Office User Template";
        LineNo: Integer;
        NextEntryNo: Integer;
        CommitNo: Integer;
        ImprestDetails: Record "FIN-Imprest Surrender Details";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
        IsImprest: Boolean;
        //ImprestRequestDet: Record "FIN-Payments-Users";
        GenledSetup: Record "FIN-Cash Office Setup";
        ImprestAmt: Decimal;
        DimName1: Text[80];
        DimName2: Text[80];
        CashPaymentLine: Record "FIN-Cash Payment Line q";
        PaymentLine: Record "FIN-Payment Line";
        CurrSurrDocNo: Code[20];
        JournalPostSuccessful: Codeunit "Journal Post Successful";
        Commitments: Record "FIN-Committment";
        BudgetControl: Codeunit "Budgetary Control";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        ImprestReq: Record "FIN-Imprest Header";
        UserMgt: Codeunit "User Setup Management";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        AccountName: Text[100];
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        ReceiptHeader: Record "FIN-Receipts Header";
        ImprestSurrHeader: Record "FIN-Imprest Surr. Header";
        RecLine: Record "FIN-Receipt Line q";
        LastNo: Code[20];
        GenSetUp: Record "FIN-Cash Office Setup";
        "No. Series Line": Record "No. Series Line";
        BankRec: Record "Bank Account";
        [InDataSet]
        "Surrender DateEditable": Boolean;
        [InDataSet]
        "Account No.Editable": Boolean;
        [InDataSet]
        "Imprest Issue Doc. NoEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        ImprestLinesEditable: Boolean;
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINImprestSurrLines: Record "FIN-Imprest Surrender Details";

    local procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Imprest Budget mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINImprestSurrLines.RESET;
        FINImprestSurrLines.SETRANGE("Surrender Doc No.", Rec.No);
        IF FINImprestSurrLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                FINImprestSurrLines.TESTFIELD("Account No:");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINImprestSurrLines."Account No:");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (FINImprestSurrLines.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(FINImprestSurrLines."Account No:", Rec."Surrender Date", '', Rec."Shortcut Dimension 2 Code",
                    FINImprestSurrLines.Amount, FINImprestSurrLines."Account Name", USERID, TODAY, 'IMPREST', Rec."Imprest Issue Doc. No" + FINImprestSurrLines."Account No:", '');
                END;
            END;
            UNTIL FINImprestSurrLines.NEXT = 0;
        END;
    end;



}