table 52178509 "Advance PettyCash Lines"
{
    LookupPageId = "Petty Cash Advance Lines";
    DrillDownPageId = "Petty Cash Advance Lines";
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Advance Type"; Code[20])
        {
            TableRelation = "FIN-Receipts and Payment Types".Code WHERE(Type = CONST("Petty Cash"));

            trigger OnValidate()
            begin
                PettyCashHeader.RESET;
                PettyCashHeader.SETRANGE(PettyCashHeader."No.", "Document No.");
                IF PettyCashHeader.FIND('-') THEN BEGIN
                    IF (PettyCashHeader.Status <> PettyCashHeader.Status::Pending) THEN
                        ERROR('You Cannot Insert a new record when the status of the document is not Pending');
                END;
                RecPay.RESET;
                RecPay.SETRANGE(RecPay.Code, "Advance Type");
                RecPay.SETRANGE(RecPay.Type, RecPay.Type::"Petty Cash");
                IF RecPay.FIND('-') THEN BEGIN
                    // RecPay.TESTFIELD(RecPay."G/L Account");
                    "Account No." := RecPay."G/L Account";
                    VALIDATE("Account No.");
                END;
            end;
        }
        field(3; "Document No."; Code[20])
        {
            NotBlank = false;
            Editable = false;
        }
        field(4; "Account No."; Code[10])
        {
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                IF GLAcc.GET("Account No.") THEN GLAcc.VALIDATE(GLAcc."No.");
                "Account Name" := GLAcc.Name;
                Pay.SETRANGE(Pay."No.", "Document No.");
                IF Pay.FINDFIRST THEN BEGIN
                    IF Pay."Account No." <> '' THEN
                        "Petty Cash Holder" := Pay."Account No."
                    ELSE
                        ERROR('Please Enter the Customer/Account Number');
                END;
            end;
        }
        field(5; "Account Name"; Text[80])
        {
            Editable = false;
        }
        field(6; "Account Type"; Enum "Gen. Journal Account Type")
        {

        }
        field(8; "Petty Cash Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(12; Purpose; Text[250])
        {
        }
        field(15; Amount; Decimal)
        {


        }
        field(7; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                VendLedgEntry: Record "Vendor Ledger Entry";
                PayToVendorNo: Code[20];
                OK: Boolean;
                Text000: Label 'You must specify %1 or %2.';
                ApplyVendEntries: Page "Apply Vendor Entries 2";
            begin
                //CODEUNIT.RUN(CODEUNIT::"Payment Voucher Apply",Rec);

                IF (Rec."Account Type" <> Rec."Account Type"::Customer) AND (Rec."Account Type" <> Rec."Account Type"::Vendor) THEN
                    ERROR('You cannot apply to %1', "Account Type");
                //Message(Format(rec."Account No."));
                //WITH Rec DO BEGIN
                Amount := 0;
                VALIDATE(Rec.Amount);
                PayToVendorNo := Rec."Account No.";
                VendLedgEntry.SETCURRENTKEY("Vendor No.", Open);
                VendLedgEntry.SETRANGE("Vendor No.", PayToVendorNo);
                //VendLedgEntry.SETRANGE(Open, TRUE);
                if VendLedgEntry.Find('-') then
                    //Message(Format(VendLedgEntry."Vendor No."));
                IF "Applies-to ID" = '' THEN
                        // "Applies-to ID" := "Line No.";
                        IF "Applies-to ID" = '' THEN
                            ERROR(
                              Text000,
                              FIELDCAPTION("Line No."), FIELDCAPTION("Applies-to ID"));
                //ApplyVendEntries."SetPVLine-Delete"(Rec, Rec.FIELDNO("Applies-to ID"));
                //  ApplyVendEntries.SetPVLine(Rec, VendLedgEntry, Rec.FIELDNO("Applies-to ID"));
                ApplyVendEntries.SETRECORD(VendLedgEntry);
                ApplyVendEntries.SETTABLEVIEW(VendLedgEntry);
                ApplyVendEntries.LOOKUPMODE(TRUE);
                OK := ApplyVendEntries.RUNMODAL = ACTION::LookupOK;
                CLEAR(ApplyVendEntries);
                IF NOT OK THEN
                    EXIT;
                VendLedgEntry.RESET;
                VendLedgEntry.SETCURRENTKEY("Vendor No.", Open);
                VendLedgEntry.SETRANGE("Vendor No.", PayToVendorNo);
                VendLedgEntry.SETRANGE(Open, TRUE);
                VendLedgEntry.SETRANGE("Applies-to ID", Rec."Applies-to ID");
                IF VendLedgEntry.FIND('-') THEN BEGIN

                    "Applies-to Doc. Type" := 0;
                    "Applies-to Doc. No." := '';
                END ELSE
                    "Applies-to ID" := '';
                //END;

                //Calculate  Total To Apply
                VendLedgEntry.RESET;
                VendLedgEntry.SETCURRENTKEY("Vendor No.", Open, "Applies-to ID");
                VendLedgEntry.SETRANGE("Vendor No.", PayToVendorNo);
                VendLedgEntry.SETRANGE(Open, TRUE);
                VendLedgEntry.SETRANGE("Applies-to ID", "Applies-to ID");
                IF VendLedgEntry.FIND('-') THEN BEGIN
                    VendLedgEntry.CALCSUMS("Amount to Apply");
                    Amount := ABS(VendLedgEntry."Amount to Apply");
                    VALIDATE(Amount);
                    "Applied Invoice" := VendLedgEntry."Document No.";
                    // "Applied LPO" := VendLedgEntry.
                END;
            end;

            trigger OnValidate()
            begin
                //IF "Applies-to Doc. No." <> '' THEN
                //TESTFIELD("Bal. Account No.",'');

                IF ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") AND (xRec."Applies-to Doc. No." <> '') AND
                   ("Applies-to Doc. No." <> '')
                THEN BEGIN
                    SetAmountToApply("Applies-to Doc. No.", "Account No.");
                    SetAmountToApply(xRec."Applies-to Doc. No.", "Account No.");
                END ELSE
                    IF ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") AND (xRec."Applies-to Doc. No." = '') THEN
                        SetAmountToApply("Applies-to Doc. No.", "Account No.")
                    ELSE
                        IF ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") AND ("Applies-to Doc. No." = '') THEN
                            SetAmountToApply(xRec."Applies-to Doc. No.", "Account No.");
            end;
        }
        field(9; "Applies-to ID"; Code[20])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            var
                TempVendLedgEntry: Record "Vendor Ledger Entry";
            begin
                //IF "Applies-to ID" <> '' THEN
                //  TESTFIELD("Bal. Account No.",'');
                IF ("Applies-to ID" <> xRec."Applies-to ID") AND (xRec."Applies-to ID" <> '') THEN BEGIN
                    VendLedgEntry.SETCURRENTKEY("Vendor No.", Open);
                    VendLedgEntry.SETRANGE("Vendor No.", "Account No.");
                    VendLedgEntry.SETRANGE(Open, TRUE);
                    VendLedgEntry.SETRANGE("Applies-to ID", xRec."Applies-to ID");
                    IF VendLedgEntry.FINDFIRST THEN
                        VendEntrySetApplID.SetApplId(VendLedgEntry, TempVendLedgEntry, '');
                    VendLedgEntry.RESET;
                END;
            end;
        }
        field(10; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;

        }
        field(11; "Applied Invoice"; Code[30])
        {

        }

    }

    keys
    {
        key(Key1; "Document No.", "Account No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }
    procedure SetAmountToApply(AppliesToDocNo: Code[20]; VendorNo: Code[20])
    var
        VendLedgEntry: Record "Vendor Ledger Entry";
    begin
        VendLedgEntry.SETCURRENTKEY("Document No.");
        VendLedgEntry.SETRANGE("Document No.", AppliesToDocNo);
        VendLedgEntry.SETRANGE("Vendor No.", VendorNo);
        VendLedgEntry.SETRANGE(Open, TRUE);
        IF VendLedgEntry.FINDFIRST THEN BEGIN
            IF VendLedgEntry."Amount to Apply" = 0 THEN BEGIN
                VendLedgEntry.CALCFIELDS("Remaining Amount");
                VendLedgEntry."Amount to Apply" := VendLedgEntry."Remaining Amount";
            END ELSE
                VendLedgEntry."Amount to Apply" := 0;
            VendLedgEntry."Accepted Payment Tolerance" := 0;
            VendLedgEntry."Accepted Pmt. Disc. Tolerance" := FALSE;
            CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit", VendLedgEntry);
        END;
    end;


    // fieldgroups
    // {
    // }

    trigger OnDelete()
    begin
        PettyCashHeader.RESET;
        PettyCashHeader.SETRANGE(PettyCashHeader."No.", "Document No.");
        IF PettyCashHeader.FINDFIRST THEN BEGIN
            IF (PettyCashHeader.Status = PettyCashHeader.Status::Approved) OR
            (PettyCashHeader.Status = PettyCashHeader.Status::Posted) OR
            (PettyCashHeader.Status = PettyCashHeader.Status::"Pending Approval") THEN
                IF "Account No." <> '' THEN
                    ERROR('You Cannot Delete this record its status is not Pending');
        END;
    end;

    trigger OnInsert()
    begin
        PettyCashHeader.RESET;
        PettyCashHeader.SETRANGE(PettyCashHeader."No.", "Document No.");
        IF PettyCashHeader.FINDFIRST THEN BEGIN
            PettyCashHeader.TESTFIELD("Responsibility Center");
            PettyCashHeader.TESTFIELD("Global Dimension 1 Code");
            PettyCashHeader.TESTFIELD("Global Dimension 2 Code");
            Rec."Petty Cash Holder" := PettyCashHeader."Account No.";

        END;
    end;

    trigger OnModify()
    begin
        PettyCashHeader.RESET;
        PettyCashHeader.SETRANGE(PettyCashHeader."No.", "Document No.");
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "Advance PettyCash Header";
        PettyCashHeader: Record "Advance PettyCash Header";
        RecPay: Record "FIN-Receipts and Payment Types";
        VendLedgEntry: Record "Vendor Ledger Entry";
        VendEntrySetApplID: Codeunit "Vend. Entry-SetAppl.ID";
}