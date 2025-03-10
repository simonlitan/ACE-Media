table 52178548 "Advance PettyCash Lines"
{
    LookupPageId = "Petty Cash Advance Lines";
    DrillDownPageId = "Petty Cash Advance Lines";
    fields
    {
        field(1; "Line No."; Integer)
        {
            // AutoIncrement = true;
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
                RecPay.SETRANGE(RecPay.Type, RecPay.Type::Imprest);
                IF RecPay.FIND('-') THEN BEGIN
                    RecPay.TESTFIELD(RecPay."G/L Account");
                    "Account No." := RecPay."G/L Account";
                    VALIDATE("Account No.");
                END;
            end;
        }
        field(3; "Document No."; Code[20])
        {
            NotBlank = true;
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
        field(7; "Petty Cash Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(8; Purpose; Text[250])
        {
        }
        field(9; Amount; Decimal)
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

    fieldgroups
    {
    }

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
}