page 52178744 "FIN-Receipts Line UP"
{
    PageType = ListPart;
    Editable = true;
    SourceTable = "FIN-Receipt Line q";

    layout
    {
        area(content)
        {
            repeater(general)
            {
                field(Type; Rec.Type)
                {
                    // Visible = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        RecPayTypes.RESET;
                        RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Receipt);
                        RecPayTypes.SETRANGE(RecPayTypes.Code, Rec.Type);
                        IF RecPayTypes.FIND('-') THEN BEGIN
                            IF RecPayTypes."Account Type" = RecPayTypes."Account Type"::"G/L Account" THEN BEGIN
                                "Account No.Editable" := FALSE;
                            END
                            ELSE BEGIN
                                "Account No.Editable" := TRUE;
                            END;
                        END;
                    end;
                }
                field(Grouping; Rec.Grouping)
                {

                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    Visible = false;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        PayModeOnAfterValidate;
                    end;
                }

                field("Bank Account"; Rec."Bank Account")
                {
                    Visible = "Bank AccountVisible";
                    ApplicationArea = All;
                }
                field("Cheque/Deposit Slip Bank"; Rec."Cheque/Deposit Slip Bank")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Cheque/Deposit Slip Type"; Rec."Cheque/Deposit Slip Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Cheque/Deposit Slip Date"; Rec."Cheque/Deposit Slip Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Deposit Slip Time"; Rec."Deposit Slip Time")
                {
                    Visible = false;
                    ApplicationArea = All;

                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Cheque/Deposit Slip No"; Rec."Cheque/Deposit Slip No")
                {

                    ApplicationArea = All;
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Teller ID"; Rec."Teller ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {

                    ApplicationArea = All;
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                }

               

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                Caption = 'Post';
                Image = Post;

                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF Rec.Posted THEN
                        ERROR('The transaction has already been posted.');

                    IF Rec."Transaction Name" = '' THEN
                        ERROR('Please enter the transaction description under transaction name.');

                    IF Rec.Amount = 0 THEN
                        ERROR('Please enter amount.');

                    IF Rec.Amount < 0 THEN
                        ERROR('Amount cannot be less than zero.');

                    IF Rec."Global Dimension 1 Code" = '' THEN
                        ERROR('Please enter the Function code');

                    IF Rec."Shortcut Dimension 2 Code" = '' THEN
                        ERROR('Please enter the source of funds.');

                    /*
                    CashierLinks.RESET;
                    CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
                    IF CashierLinks.FIND('-') THEN BEGIN
                    END
                    ELSE BEGIN
                    ERROR('Please link the user/cashier to a collection account before proceeding.');
                    END;
                    */

                    // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", 'CASH RECEI');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", Rec.No);
                    GenJnlLine.DELETEALL;

                    IF DefaultBatch.GET('CASH RECEI', Rec.No) THEN
                        DefaultBatch.DELETE;

                    DefaultBatch.RESET;
                    DefaultBatch."Journal Template Name" := 'CASH RECEI';
                    DefaultBatch.Name := Rec.No;
                    DefaultBatch.INSERT;

                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name" := 'CASH RECEI';
                    GenJnlLine."Journal Batch Name" := Rec.No;
                    GenJnlLine."Line No." := 10000;
                    GenJnlLine."Account Type" := Rec."Account Type";
                    GenJnlLine."Account No." := Rec."Account No.";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Rec.Date;
                    GenJnlLine."Document No." := Rec.No;
                    GenJnlLine."External Document No." := Rec."Cheque/Deposit Slip No";
                    GenJnlLine.Amount := -Rec."Total Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);

                    GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                    GenJnlLine."Applies-to Doc. No." := Rec."Apply to";
                    //GenJnlLine."Bal. Account No.":=CashierLinks."Bank Account No";
                    IF Rec."Bank Code" = '' THEN
                        ERROR('Select the Bank Code');


                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description := Rec."Transaction Name";
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");

                    IF GenJnlLine.Amount <> 0 THEN
                        GenJnlLine.INSERT;


                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name" := 'CASH RECEI';
                    GenJnlLine."Journal Batch Name" := Rec.No;
                    GenJnlLine."Line No." := 10001;
                    GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                    GenJnlLine."Account No." := Rec."Bank Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date" := Rec.Date;
                    GenJnlLine."Document No." := Rec.No;
                    GenJnlLine."External Document No." := Rec."Cheque/Deposit Slip No";
                    GenJnlLine.Amount := Rec."Total Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine.Description := Rec."Transaction Name";
                    GenJnlLine."Shortcut Dimension 1 Code" := Rec."Dest Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Dest Shortcut Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");

                    IF GenJnlLine.Amount <> 0 THEN
                        GenJnlLine.INSERT;

                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", 'CASH RECEI');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", Rec.No);
                    CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);

                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", 'CASH RECEI');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", Rec.No);
                    IF GenJnlLine.FIND('-') THEN
                        EXIT;

                    Rec.Posted := TRUE;
                    Rec."Date Posted" := TODAY;
                    Rec."Time Posted" := TIME;
                    Rec."Posted By" := USERID;
                    Rec.MODIFY;

                end;
            }
            action(Print)
            {
                Caption = 'Print';
                Image = Print;

                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF Rec.Posted = FALSE THEN
                        ERROR('Post the receipt before printing.');
                    Rec.RESET;
                    Rec.SETFILTER(No, Rec.No);
                    REPORT.RUN(52015, TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
            action("Direct Printing")
            {
                Caption = 'Direct Printing';

                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF Rec.Posted = FALSE THEN
                        ERROR('Post the receipt before printing.');
                    Rec.RESET;
                    Rec.SETFILTER(No, Rec.No);
                    REPORT.RUN(52015, FALSE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        "Account No.Editable" := TRUE;
        "Bank AccountVisible" := TRUE;
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        //CashierLinks: Record "61720";
        RecPayTypes: Record "FIN-Receipts and Payment Types";
        DimName1: Text[100];
        rdimname1: Text[100];
        rdimname2: Text[100];
        DImName2: Text[100];
        Custledger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        ApplyEntry: Codeunit "Sales Header Apply";
        AppliedEntries: Record "FIN-CshMgt Application";
        CustEntries: Record "Cust. Ledger Entry";
        LineNo: Integer;
        [InDataSet]
        "Bank AccountVisible": Boolean;
        [InDataSet]
        "Account No.Editable": Boolean;
        LinesUpdate: Codeunit "Header Management";

    local procedure PayModeOnAfterValidate()
    begin
        IF Rec."Pay Mode" = Rec."Pay Mode"::"Deposit Slip" THEN BEGIN
            "Bank AccountVisible" := TRUE;
        END
        ELSE BEGIN
            "Bank AccountVisible" := FALSE;
        END;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        // Rec."Bank Account" := LinesUpdate.GetBankAccount(Rec.No);
        // Rec."Cheque/Deposit Slip No" := LinesUpdate.GetChequeNo(Rec.No);
        // Rec.Amount := LinesUpdate.GetAmount(Rec.No);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        //Rec."Bank Account" := LinesUpdate.GetBankAccount(Rec.No);
        //Rec."Cheque/Deposit Slip No" := LinesUpdate.GetChequeNo(Rec.No);
        //Rec.Amount := LinesUpdate.GetAmount(Rec.No);
    end;
}
