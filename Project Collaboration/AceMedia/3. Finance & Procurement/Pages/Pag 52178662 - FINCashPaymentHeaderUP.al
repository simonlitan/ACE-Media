page 52178662 "FIN-Cash Payment Header UP"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "FIN-Payments Header";
    SourceTableView = WHERE("Payment Type" = CONST("Petty Cash"), Status = FILTER(<> Cancelled));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;

                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }

                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = All;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Payee; Rec.Payee)
                {
                    Caption = 'Payment to';
                    ApplicationArea = All;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = All;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = All;
                    RowSpan = 5;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    Editable = true;
                    ApplicationArea = All;
                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                    ApplicationArea = All;
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = All;
                }
                field(Cashier; Rec.Cashier)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    Caption = 'Total Net Amount';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }

            }
            part(PVLines; "FIN-Cash Payment Lines UP")
            {
                ApplicationArea = All;
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {

            action("Print/Preview")
            {
                ApplicationArea = All;
                Caption = 'Print/Preview';
                Image = PrintDocument;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(Report::"Petty Cash Report2", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }

            action(sendApproval)
            {
                ApplicationArea = All;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit "Init Code";
                begin

                    if ApprovalMgnt.IsPVSEnabled(Rec) = true then
                        ApprovalMgnt.OnSendPVSforApproval(Rec);
                    CommitBudget();
                end;
            }
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Fin-Approval Entries";
                RunPageLink = "Document No." = field("No.");
            }
            action(cancellsApproval)
            {
                ApplicationArea = All;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Init Code";
                begin
                    CancelCommitment;
                    if ApprovalMgt.IsPVSEnabled(Rec) = true then
                        ApprovalMgt.OnCancelPVSForApproval(Rec);
                end;
            }
            action("Post Payment")
            {
                Caption = 'Post Payment';
                Image = PostDocument;
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    //Post PV Entries
                    //TESTFIELD("Expense Code");
                    CheckPVRequiredItems;
                    PostPaymentVoucher;
                end;
            }

        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Payment Type" := Rec."Payment Type"::"Petty Cash";
        Rec."Pay Mode" := Rec."Pay Mode"::Cash;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //Add dimensions if set by default here
        Rec."Global Dimension 1 Code" := UserMgt.GetSetDimensions(USERID, 1);
        Rec.VALIDATE("Global Dimension 1 Code");
        Rec."Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(USERID, 2);
        Rec.VALIDATE("Shortcut Dimension 2 Code");
        Rec."Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(USERID, 3);
        Rec.VALIDATE("Shortcut Dimension 3 Code");
        Rec."Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(USERID, 4);
        Rec.VALIDATE("Shortcut Dimension 4 Code");
        //OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    begin
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FILTERGROUP(0);
        END;

        UpdateControls;
    end;

    var
        //ApprovalEntries: Page "658";
        PayLine: Record "FIN-Payment Line";
        PVUsers: Record "FIN-CshMgt PV Steps Users";
        strFilter: Text[250];
        IntC: Integer;
        IntCount: Integer;
        Payments: Record "FIN-Payments Header";
        RecPayTypes: Record "FIN-Receipts and Payment Types";
        TarriffCodes: Record "FIN-Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "FIN-Cash Office User Template";
        LineNo: Integer;
        Temp: Record "FIN-Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        //PCheck: Codeunit "50110";
        Post: Boolean;
        strText: Text[100];
        PVHead: Record "FIN-Payments Header";
        BankAcc: Record "Bank Account";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        Commitments: Record "FIN-Committment";
        UserMgt: Codeunit "User Setup Management BR";
        JournlPosted: Codeunit "Journal Post Successful";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        LecturerName: Text[80];
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINPaymentLine: Record "FIN-Payment Line";
        GenSetup: Record "General Ledger Setup";
        Text000: Label 'Void Cheque';
        CheckLedger: Record "Check Ledger Entry";
        CheckManagement: Codeunit CheckManagement;

    //[Scope('Internal')]
    procedure UpdateControls()
    var
        PvUser: Record "FIN-CshMgt PV Steps Users";
    begin
        /* IF Status<>Status::Approved THEN BEGIN
         CurrForm."Payment Release Date".EDITABLE:=FALSE;
         //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
         CurrForm."Currency Code".EDITABLE:=TRUE;
         CurrForm.UPDATECONTROLS();
         END ELSE BEGIN
         CurrForm."Payment Release Date".EDITABLE:=TRUE;
         //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
         CurrForm."Currency Code".EDITABLE:=FALSE;
         CurrForm.UPDATECONTROLS();
         END;

         IF Status=Status::Pending THEN BEGIN
         CurrForm."Global Dimension 1 Code".EDITABLE:=TRUE;
         CurrForm."Shortcut Dimension 2 Code".EDITABLE:=TRUE;
         CurrForm.Payee.EDITABLE:=TRUE;
         CurrForm."Shortcut Dimension 3 Code".EDITABLE:=TRUE;
         CurrForm."Shortcut Dimension 4 Code".EDITABLE:=TRUE;
         CurrForm.Date.EDITABLE:=TRUE;
         CurrForm.UPDATECONTROLS();
         END ELSE BEGIN
         CurrForm."Global Dimension 1 Code".EDITABLE:=FALSE;
         CurrForm."Shortcut Dimension 2 Code".EDITABLE:=FALSE;
         CurrForm.Payee.EDITABLE:=FALSE;
         CurrForm."Shortcut Dimension 3 Code".EDITABLE:=FALSE;
         CurrForm."Shortcut Dimension 4 Code".EDITABLE:=FALSE;
         CurrForm.Date.EDITABLE:=FALSE;
         CurrForm.UPDATECONTROLS();
         END
    */

    end;

    //[Scope('Internal')]
    procedure PostPaymentVoucher()
    begin

        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
        GenJnlLine.RESET;
        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
        IF GenJnlLine.FIND('+') THEN BEGIN
            LineNo := GenJnlLine."Line No." + 1000;
        END
        ELSE BEGIN
            LineNo := 1000;
        END;
        GenJnlLine.DELETEALL;
        GenJnlLine.RESET;

        Payments.RESET;
        Payments.SETRANGE(Payments."No.", Rec."No.");
        IF Payments.FIND('-') THEN BEGIN
            PayLine.RESET;
            PayLine.SETRANGE(PayLine.No, Payments."No.");
            IF PayLine.FIND('-') THEN BEGIN
                REPEAT
                    PostHeader(Payments);
                UNTIL PayLine.NEXT = 0;
            END;

            Post := FALSE;
            Post := JournlPosted.PostedSuccessfully();
            //IF Post THEN  BEGIN
            Rec.Posted := TRUE;
            Rec.Status := Payments.Status::Posted;
            Rec."Posted By" := USERID;
            Rec."Date Posted" := TODAY;
            Rec."Time Posted" := TIME;
            Rec.MODIFY;

            //Post Reversal Entries for Commitments
            Doc_Type := Doc_Type::PettyCash;
            CheckBudgetAvail.ReverseEntries(Doc_Type, Rec."No.");
            // END;
        END;
    end;

    //[Scope('Internal')]
    procedure PostHeader(var Payment: Record "FIN-Payments Header")
    begin

        IF Payments."Pay Mode" = Payments."Pay Mode"::Cheque THEN BEGIN
            IF Payments."Cheque No." = '' THEN BEGIN
                ERROR('Please ensure that the cheque number is inserted');
            END;
        END;

        IF Payments."Pay Mode" = Payments."Pay Mode"::EFT THEN BEGIN
            IF Payments."Cheque No." = '' THEN BEGIN
                ERROR('Please ensure that the EFT number is inserted');
            END;
        END;

        IF Payments."Pay Mode" = Payments."Pay Mode"::"Letter of Credit" THEN BEGIN
            IF Payments."Cheque No." = '' THEN BEGIN
                ERROR('Please ensure that the Letter of Credit ref no. is entered.');
            END;
        END;
        GenJnlLine.RESET;
        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);

        IF GenJnlLine.FIND('+') THEN BEGIN
            LineNo := GenJnlLine."Line No." + 1000;
        END
        ELSE BEGIN
            LineNo := 1000;
        END;


        LineNo := LineNo + 1000;
        GenJnlLine.INIT;
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := Payment."Payment Release Date";
        IF CustomerPayLinesExist THEN
            GenJnlLine."Document Type" := GenJnlLine."Document Type"::" "
        ELSE
            GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;

        GenJnlLine."Document No." := Payments."No.";
        GenJnlLine."External Document No." := Payments."Cheque No.";

        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        GenJnlLine."Account No." := Payments."Paying Bank Account";
        GenJnlLine.VALIDATE(GenJnlLine."Account No.");

        GenJnlLine."Currency Code" := Payments."Currency Code";
        GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
        Payments.CALCFIELDS(Payments."Total Net Amount", Payments."Total VAT Amount");
        GenJnlLine.Amount := -(Payments."Total Net Amount");
        GenJnlLine.VALIDATE(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine."Bal. Account No." := '';

        GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
        GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

        GenJnlLine.Description := COPYSTR('Pay To:' + Payments.Payee, 1, 50);
        GenJnlLine.VALIDATE(GenJnlLine.Description);
        GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::" ";

        IF GenJnlLine.Amount <> 0 THEN
            GenJnlLine.INSERT;

        //Post Other Payment Journal Entries
        PostPV(Payments);
    end;

    //[Scope('Internal')]
    procedure GetAppliedEntries(var LineNo: Integer) InvText: Text[100]
    var
        Appl: Record "FIN-CshMgt Application";
    begin

        InvText := '';
        Appl.RESET;
        Appl.SETRANGE(Appl."Document Type", Appl."Document Type"::PV);
        Appl.SETRANGE(Appl."Document No.", Rec."No.");
        Appl.SETRANGE(Appl."Line No.", LineNo);
        IF Appl.FINDFIRST THEN BEGIN
            REPEAT
                InvText := COPYSTR(InvText + ',' + Appl."Appl. Doc. No", 1, 50);
            UNTIL Appl.NEXT = 0;
        END;
    end;

    //[Scope('Internal')]
    procedure InsertApproval()
    var
        Appl: Record "FIN-CshMgt Approvals";
        LineNo: Integer;
    begin
        LineNo := 0;
        Appl.RESET;
        IF Appl.FINDLAST THEN BEGIN
            LineNo := Appl."Line No.";
        END;

        LineNo := LineNo + 1;

        Appl.RESET;
        Appl.INIT;
        Appl."Line No." := LineNo;
        Appl."Document Type" := Appl."Document Type"::PV;
        Appl."Document No." := Rec."No.";
        Appl."Document Date" := Rec.Date;
        Appl."Process Date" := TODAY;
        Appl."Process Time" := TIME;
        Appl."Process User ID" := USERID;
        Appl."Process Name" := Rec."Current Status";
        //Appl."Process Machine":=ENVIRON('COMPUTERNAME');
        Appl.INSERT;
    end;

    //[Scope('Internal')]
    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCsetup: Record "FIN-Budgetary Control Setup";
    begin
        IF BCsetup.GET() THEN BEGIN
            IF NOT BCsetup.Mandatory THEN BEGIN
                Exists := FALSE;
                EXIT;
            END;
        END ELSE BEGIN
            Exists := FALSE;
            EXIT;
        END;

        Exists := FALSE;
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        PayLine.SETRANGE(PayLine.Committed, FALSE);
        PayLine.SETRANGE(PayLine."Budgetary Control A/C", TRUE);
        IF PayLine.FIND('-') THEN
            Exists := TRUE;
    end;

    //[Scope('Internal')]
    procedure CheckPVRequiredItems()
    begin
        IF Rec.Posted THEN BEGIN
            ERROR('The Document has already been posted');
        END;

        //TESTFIELD(Status,Status::Approved);
        Rec.TESTFIELD("Paying Bank Account");
        Rec.TESTFIELD("Pay Mode");
        Rec.TESTFIELD("Payment Release Date");

        //Confirm whether Bank Has the Cash
        IF Rec."Pay Mode" = Rec."Pay Mode"::Cash THEN
            CheckBudgetAvail.CheckFundsAvailability(Rec);

        /*Check if the user has selected all the relevant fields*/
        Temp.GET(USERID);

        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";

        IF JTemplate = '' THEN BEGIN
            ERROR('Ensure the PV Template is set up in Cash Office Setup');
        END;
        IF JBatch = '' THEN BEGIN
            ERROR('Ensure the PV Batch is set up in the Cash Office Setup')
        END;

    end;

    //[Scope('Internal')]
    procedure PostPV(var Payment: Record "FIN-Payments Header")
    begin

        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Payments."No.");
        IF PayLine.FIND('-') THEN BEGIN

            REPEAT
                strText := GetAppliedEntries(PayLine."Line No.");
                Payment.TESTFIELD(Payment.Payee);
                PayLine.TESTFIELD(PayLine.Amount);
                PayLine.TESTFIELD(PayLine."Global Dimension 1 Code");

                //BANK
                IF PayLine."Pay Mode" = PayLine."Pay Mode"::Cash THEN BEGIN
                    CashierLinks.RESET;
                    CashierLinks.SETRANGE(CashierLinks.UserID, USERID);
                END;

                //CHEQUE
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                GenJnlLine."Document No." := PayLine.No;
                IF PayLine."Account Type" = PayLine."Account Type"::Customer THEN
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" "
                ELSE
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;

                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine.Description := COPYSTR(PayLine."Transaction Name" + ':' + Payment.Payee, 1, 50);
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                GenJnlLine."Currency Factor" := Payments."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");

                IF PayLine."VAT Code" = '' THEN BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                END
                ELSE BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                END;
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."VAT Prod. Posting Group" := PayLine."VAT Prod. Posting Group";
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                IF GenJnlLine.Amount <> 0 THEN GenJnlLine.INSERT;

                //Post VAT to GL[VAT GL]
                TarriffCodes.RESET;
                TarriffCodes.SETRANGE(TarriffCodes.Code, PayLine."VAT Code");
                IF TarriffCodes.FIND('-') THEN BEGIN
                    TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
                    LineNo := LineNo + 1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Payment."Payment Release Date";
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                    GenJnlLine."Document No." := PayLine.No;
                    GenJnlLine."External Document No." := Payments."Cheque No.";
                    GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                    GenJnlLine."Account No." := TarriffCodes."G/L Account";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Currency Code" := Payments."Currency Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                    GenJnlLine.Amount := -PayLine."VAT Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '';
                    GenJnlLine.Description := COPYSTR('VAT:' + FORMAT(PayLine."Account Type") + '::' + FORMAT(PayLine."Account Name"), 1, 50);
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                    GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");

                    IF GenJnlLine.Amount <> 0 THEN GenJnlLine.INSERT;
                END;

                //POST W/TAX to Respective W/TAX GL Account
                TarriffCodes.RESET;
                TarriffCodes.SETRANGE(TarriffCodes.Code, PayLine."Withholding Tax Code");
                IF TarriffCodes.FIND('-') THEN BEGIN
                    TarriffCodes.TESTFIELD(TarriffCodes."G/L Account");
                    LineNo := LineNo + 1000;
                    GenJnlLine.INIT;
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Payment."Payment Release Date";
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                    GenJnlLine."Document No." := PayLine.No;
                    GenJnlLine."External Document No." := Payments."Cheque No.";
                    GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                    GenJnlLine."Account No." := TarriffCodes."G/L Account";
                    GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Currency Code" := Payments."Currency Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                    GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                    GenJnlLine.Amount := -PayLine."Withholding Tax Amount";
                    GenJnlLine.VALIDATE(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '';
                    GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description := COPYSTR('W/Tax:' + FORMAT(PayLine."Account Name") + '::' + strText, 1, 50);
                    GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                    GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");

                    IF GenJnlLine.Amount <> 0 THEN
                        GenJnlLine.INSERT;
                END;

                //Post VAT Balancing Entry Goes to Vendor
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                GenJnlLine."Document No." := PayLine.No;
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                IF PayLine."VAT Code" = '' THEN BEGIN
                    GenJnlLine.Amount := 0;
                END
                ELSE BEGIN
                    GenJnlLine.Amount := PayLine."VAT Amount";
                END;
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := COPYSTR('VAT:' + FORMAT(PayLine."Account Type") + '::' + FORMAT(PayLine."Account Name"), 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;

                //Post W/TAX Balancing Entry Goes to Vendor
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                GenJnlLine."Document No." := PayLine.No;
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.VALIDATE(GenJnlLine."Currency Code");
                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Posting Type");
                GenJnlLine."Gen. Bus. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Bus. Posting Group");
                GenJnlLine."Gen. Prod. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."Gen. Prod. Posting Group");
                GenJnlLine."VAT Bus. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Bus. Posting Group");
                GenJnlLine."VAT Prod. Posting Group" := '';
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine.Amount := PayLine."Withholding Tax Amount";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := COPYSTR('W/Tax:' + strText, 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;


            UNTIL PayLine.NEXT = 0;

            //Post the Journal Lines
            GenJnlLine.RESET;
            GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);

            //Adjust Gen Jnl Exchange Rate Rounding Balances
            AdjustGenJnl.RUN(GenJnlLine);
            //End Adjust Gen Jnl Exchange Rate Rounding Balances

            CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);
            Post := FALSE;
            Post := JournlPosted.PostedSuccessfully();
            IF Post THEN BEGIN
                IF PayLine.FINDFIRST THEN BEGIN
                    REPEAT
                        PayLine."Date Posted" := TODAY;
                        PayLine."Time Posted" := TIME;
                        PayLine."Posted By" := USERID;
                        PayLine.Status := PayLine.Status::Posted;
                        PayLine.MODIFY;
                    UNTIL PayLine.NEXT = 0;
                END;
            END;

        END;
    end;

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "FIN-Payment Line";
    begin
        HasLines := FALSE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines.No, Rec."No.");
        IF PayLines.FIND('-') THEN BEGIN
            HasLines := TRUE;
            EXIT(HasLines);
        END;
    end;

    //[Scope('Internal')]
    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "FIN-Payment Line";
    begin
        AllKeyFieldsEntered := TRUE;
        PayLines.RESET;
        PayLines.SETRANGE(PayLines.No, Rec."No.");
        IF PayLines.FIND('-') THEN BEGIN
            REPEAT
                IF (PayLines."Account No." = '') OR (PayLines.Amount <= 0) THEN
                    AllKeyFieldsEntered := FALSE;
            UNTIL PayLines.NEXT = 0;
            EXIT(AllKeyFieldsEntered);
        END;
    end;

    //[Scope('Internal')]
    procedure CustomerPayLinesExist(): Boolean
    var
        PayLine: Record "FIN-Payment Line";
    begin
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        PayLine.SETRANGE(PayLine."Account Type", PayLine."Account Type"::Customer);
        EXIT(PayLine.FINDFIRST);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;

    local procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        Rec.TestField("Global Dimension 1 Code");
        Rec.TestField("Shortcut Dimension 3 Code");
        //Get Current Lines to loop through
        FINPaymentLine.RESET;
        FINPaymentLine.SETRANGE(No, Rec."No.");
        FINPaymentLine.SETRANGE("Account Type", FINPaymentLine."Account Type"::"G/L Account");
        IF FINPaymentLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                FINPaymentLine.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINPaymentLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Global Dimension 1 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", FINPaymentLine."Account No.");
                FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                FINBudgetEntries.SetRange("Global Dimension 2 Code", rec."Shortcut Dimension 2 Code");
                FINBudgetEntries.SetRange("Budget Dimension 3 Code", rec."Shortcut Dimension 3 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3',
                FINBudgetEntries."Transaction Type"::Expense,
                FINBudgetEntries."Transaction Type"::Commitment,
                FINBudgetEntries."Transaction Type"::Allocation);

                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
                , FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::"Commited/Posted",
                FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Rec.Date));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (FINPaymentLine.Amount > FINBudgetEntries.Amount) THEN
                                ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailability(FINPaymentLine."Account No.",
                            Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code", FINPaymentLine.Amount,
                             FINPaymentLine."Account Name",
                            'PV', Rec."No." + FINPaymentLine."Account No." + '-' + Format(FINPaymentLine."Line No."), Rec.Payee);
                        END
                        ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                    END;
                END ELSE
                    IF PostBudgetEnties.checkBudgetControl(FINPaymentLine."Account No.") THEN ERROR('Missing Budget for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
            END;
            UNTIL FINPaymentLine.NEXT = 0;
        END;



    end;

    local procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        //Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINPaymentLine.SETRANGE(No, Rec."No.");
        FINPaymentLine.SETRANGE("Account Type", FINPaymentLine."Account Type"::"G/L Account");
        IF FINPaymentLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                FINPaymentLine.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINPaymentLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Global Dimension 1 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (FINPaymentLine.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(FINPaymentLine."Account No.", Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code",
                     FINPaymentLine.Amount, FINPaymentLine."Account Name", USERID, TODAY, 'PV',
                     Rec."No." + FINPaymentLine."Account No." + '-' + Format(FINPaymentLine."Line No."), Rec.Payee);
                END;
            END;
            UNTIL FINPaymentLine.NEXT = 0;
        END;
    end;

    local procedure CancelCommitment()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."PV Budget Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINPaymentLine.SETRANGE(No, Rec."No.");
        FINPaymentLine.SETRANGE("Account Type", FINPaymentLine."Account Type"::"G/L Account");
        IF FINPaymentLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                FINPaymentLine.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINPaymentLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (FINPaymentLine.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.CancelBudgetCommitment(FINPaymentLine."Account No.", Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code",
                    Rec."Shortcut Dimension 3 Code", FINPaymentLine.Amount, FINPaymentLine."Account Name", USERID, 'PV',
                     Rec."No." + FINPaymentLine."Account No." + '-' + Format(FINPaymentLine."Line No."), Rec.Payee);
                END;
            END;
            UNTIL FINPaymentLine.NEXT = 0;
        END;
    end;

    //[Scope('Internal')]
    procedure PopulateCheckJournal(var Payment: Record "FIN-Payments Header")
    begin
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, Rec."No.");
        IF PayLine.FIND('-') THEN BEGIN

            REPEAT
                //  strText:=GetAppliedEntries(PayLine."Line No.");
                //Payment.TESTFIELD(Payment.Payee);
                PayLine.TESTFIELD(PayLine.Amount);
                // PayLine.TESTFIELD(PayLine."Global Dimension 1 Code");

                //BANK
                IF PayLine."Pay Mode" <> PayLine."Pay Mode"::Cheque THEN;

                //CHEQUE
                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Rec."Payment Release Date";
                GenJnlLine."Document No." := PayLine.No;
                IF PayLine."Account Type" = PayLine."Account Type"::Customer THEN
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" "
                ELSE
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                GenJnlLine."External Document No." := Rec."Cheque No.";

                GenJnlLine."Currency Code" := Rec."Currency Code";
                GenJnlLine.VALIDATE("Currency Code");
                GenJnlLine."Currency Factor" := Rec."Currency Factor";
                GenJnlLine.VALIDATE("Currency Factor");
                IF PayLine."VAT Code" = '' THEN BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                END
                ELSE BEGIN
                    GenJnlLine.Amount := PayLine."Net Amount";
                END;
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."VAT Prod. Posting Group" := PayLine."VAT Prod. Posting Group";
                GenJnlLine.VALIDATE(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine."Bal. Account No." := Rec."Paying Bank Account";
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::"Computer Check";
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.ValidateShortcutDimCode(3, PayLine."Shortcut Dimension 3 Code");
                GenJnlLine.ValidateShortcutDimCode(4, PayLine."Shortcut Dimension 4 Code");
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Applies-to Doc. No.";
                GenJnlLine.VALIDATE(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := PayLine."Applies-to ID";
                GenJnlLine.Description := Rec.Payee;
                ///GenJnlLine."Received By":=Payee;
                IF GenJnlLine.Amount <> 0 THEN GenJnlLine.INSERT;


            UNTIL PayLine.NEXT = 0;

        END;
    end;
}