table 52178511 "PettyCash Surrender Details"
{

    fields
    {
        field(1; "Line No."; integer)
        {
            AutoIncrement = true;
        }
        field(2; "Surrender No."; Code[20])
        {
            Editable = false;
            NotBlank = true;

            trigger OnValidate()
            begin
            end;
        }
        field(3; "Account No."; Code[10])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "G/L Account"."No." WHERE("Direct Posting" = filter('Yes'));

            trigger OnValidate()
            begin

            end;
        }
        field(4; "Account Name"; Text[50])
        {
            Editable = true;
        }
        field(5; "Advance Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(6; Amount; Decimal)
        {
            Editable = true;
        }
        field(7; "Actual Spent"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Actual Spent" > Amount THEN
                    ERROR('The Actual Spent Cannot be more than the Issued Amount');
                if "Actual Spent" + "Cash Receipt Amount" > Amount then Error('The Actual Spent Cannot be more than the Issued Amount');
                if "Actual Spent" + "Cash Receipt Amount" < Amount then Error('The Actual Spent Cannot be less than the Issued Amount');
                if "Cash Receipt Amount" > Amount then Error('The Cash Receipt Amount Spent Cannot be more than the Issued Amount');

            end;
        }
        field(8; "Apply to"; Code[20])
        {
            Editable = false;
        }
        field(9; "Apply to ID"; Code[20])
        {
            Editable = false;
        }
        field(10; "Account Type"; Enum "Gen. Journal Account Type")
        {

        }

        field(12; "Cash Receipt No"; Code[20])
        {
            TableRelation = "FIN-Receipts Header"."No.";

            trigger OnValidate()
            begin
                IF ReceiptH.GET("Cash Receipt No") THEN
                    "Cash Receipt Amount" := ReceiptH."Amount Recieved";
            end;
        }

        field(15; "Doc No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("PettyCash Surrender Header"."Advance No." WHERE("No." = FIELD("Surrender No.")));
            Editable = false;
        }
        field(17; "Cash Receipt Amount"; Decimal)
        {
        }
        field(18; "Surrender Date"; date)
        {

        }
    }

    keys
    {
        key(Key1; "Line No.", "Surrender No.", "Surrender Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Pay.RESET;
        Pay.SETRANGE(Pay.No, "Surrender No.");
        IF Pay.FIND('-') THEN
            IF (Pay.Status = Pay.Status::Posted) OR (Pay.Status = Pay.Status::"Pending Approval")
            OR (Pay.Status = Pay.Status::Approved) THEN
                ERROR('This Document is already Send for Approval/Approved or Posted');
    end;

    trigger OnModify()
    begin
        Pay.RESET;
        Pay.SETRANGE(Pay.No, "Surrender No.");
        IF Pay.FIND('-') THEN
            IF (Pay.Status = Pay.Status::Posted) OR (Pay.Status = Pay.Status::"Pending Approval")
            OR (Pay.Status = Pay.Status::Approved) THEN
                ERROR('This Document is already Send for Approval/Approved or Posted');
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "FIN-Imprest Surr. Header";
        Dim: Record Dimension;
        CustLedger: Record "Cust. Ledger Entry";
        Text000: Label 'Receipt No %1 Is already Used in Another Document';
        ReceiptH: Record "FIN-Receipts Header";
}