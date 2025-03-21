table 52178576 "FIN-Staff Advance Lines"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                IF Pay.GET("Document No.") THEN
                    "Advance Holder" := Pay."Account No.";
            end;
        }
        field(2; "Account No."; Code[10])
        {
            Editable = true;
            NotBlank = false;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                IF GLAcc.GET("Account No.") THEN
                    "Account Name" := GLAcc.Name;
                GLAcc.TESTFIELD("Direct Posting", TRUE);
                "Budgetary Control A/C" := GLAcc."Budget Controlled";
                Pay.SETRANGE(Pay."No.", "Document No.");
                IF Pay.FINDFIRST THEN BEGIN
                    IF Pay."Account No." <> '' THEN
                        "Advance Holder" := Pay."Account No."
                    ELSE
                        ERROR('Please Enter the Customer/Account Number');
                END;
            end;
        }
        field(3; "Account Name"; Text[30])
        {
        }
        field(4; Amount; Decimal)
        {

            trigger OnValidate()
            begin

                ImprestHeader.RESET;
                ImprestHeader.SETRANGE(ImprestHeader."No.", "Document No.");
                IF ImprestHeader.FINDFIRST THEN BEGIN
                    "Date Taken" := ImprestHeader.Date;
                    ImprestHeader.TESTFIELD("Responsibility Center");
                    ImprestHeader.TESTFIELD("Global Dimension 1 Code");
                    ImprestHeader.TESTFIELD("Shortcut Dimension 2 Code");
                    "Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
                    "Shortcut Dimension 3 Code" := ImprestHeader."Shortcut Dimension 3 Code";
                    "Shortcut Dimension 4 Code" := ImprestHeader."Shortcut Dimension 4 Code";
                    "Currency Factor" := ImprestHeader."Currency Factor";
                    "Currency Code" := ImprestHeader."Currency Code";
                    IF Purpose = '' THEN
                        Purpose := ImprestHeader.Purpose;

                END;

                IF "Currency Factor" <> 0 THEN
                    "Amount LCY" := Amount / "Currency Factor"
                ELSE
                    "Amount LCY" := Amount;
            end;
        }
        field(5; "Due Date"; Date)
        {
        }
        field(6; "Advance Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(7; "Actual Spent"; Decimal)
        {
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; "Apply to"; Code[20])
        {
        }
        field(10; "Apply to ID"; Code[20])
        {
        }
        field(11; "Surrender Date"; Date)
        {
        }
        field(12; Surrendered; Boolean)
        {
        }
        field(13; "M.R. No"; Code[20])
        {
        }
        field(14; "Date Issued"; Date)
        {
        }
        field(15; "Type of Surrender"; Option)
        {
            OptionMembers = " ",Cash,Receipt;
        }
        field(16; "Dept. Vch. No."; Code[20])
        {
        }
        field(17; "Cash Surrender Amt"; Decimal)
        {
        }
        field(18; "Bank/Petty Cash"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(19; "Surrender Doc No."; Code[20])
        {
        }
        field(20; "Date Taken"; Date)
        {
        }
        field(21; Purpose; Text[250])
        {
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(23; "Budgetary Control A/C"; Boolean)
        {
        }
        field(24; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(25; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the fourth global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(26; Committed; Boolean)
        {
        }
        field(27; "Advance Type"; Code[20])
        {
            TableRelation = "FIN-Receipts and Payment Types".Code WHERE(Type = CONST(Advance),
                                                                         Blocked = CONST(false));

            trigger OnValidate()
            begin
                ImprestHeader.RESET;
                ImprestHeader.SETRANGE(ImprestHeader."No.", "Document No.");
                IF ImprestHeader.FINDFIRST THEN BEGIN
                    IF (ImprestHeader.Status = ImprestHeader.Status::Approved) OR
                    (ImprestHeader.Status = ImprestHeader.Status::Posted) OR
                    (ImprestHeader.Status = ImprestHeader.Status::"Pending Approval") THEN
                        ERROR('You Cannot Insert a new record when the status of the document is not Pending');
                END;

                RecPay.RESET;
                RecPay.SETRANGE(RecPay.Code, "Advance Type");
                RecPay.SETRANGE(RecPay.Type, RecPay.Type::Advance);
                IF RecPay.FIND('-') THEN BEGIN
                    "Account No." := RecPay."G/L Account";
                    VALIDATE("Account No.");
                END;
            end;
        }
        field(28; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF "Currency Factor" <> 0 THEN
                    "Amount LCY" := Amount / "Currency Factor"
                ELSE
                    "Amount LCY" := Amount;
            end;
        }
        field(29; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(30; "Amount LCY"; Decimal)
        {
        }
        field(31; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(32; "Claim Receipt No"; Code[20])
        {
        }
        field(33; "Expenditure Date"; Date)
        {
        }
        field(34; "Attendee/Organization Names"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Document No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount LCY";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ImprestHeader.RESET;
        ImprestHeader.SETRANGE(ImprestHeader."No.", "Document No.");
        IF ImprestHeader.FINDFIRST THEN BEGIN
            IF (ImprestHeader.Status = ImprestHeader.Status::Approved) OR
            (ImprestHeader.Status = ImprestHeader.Status::Posted) OR
            (ImprestHeader.Status = ImprestHeader.Status::"Pending Approval") THEN
                ERROR('You Cannot Delete this record its status is not Pending');
        END;
        TESTFIELD(Committed, FALSE);
    end;

    trigger OnInsert()
    begin
        ImprestHeader.RESET;
        ImprestHeader.SETRANGE(ImprestHeader."No.", "Document No.");
        IF ImprestHeader.FINDFIRST THEN BEGIN
            "Date Taken" := ImprestHeader.Date;
            //ImprestHeader.TESTFIELD("Responsibility Center");
            ImprestHeader.TESTFIELD("Global Dimension 1 Code");
            ImprestHeader.TESTFIELD("Shortcut Dimension 2 Code");
            "Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
            "Shortcut Dimension 3 Code" := ImprestHeader."Shortcut Dimension 3 Code";
            "Shortcut Dimension 4 Code" := ImprestHeader."Shortcut Dimension 4 Code";
            "Currency Factor" := ImprestHeader."Currency Factor";
            "Currency Code" := ImprestHeader."Currency Code";
            IF Purpose = '' THEN
                Purpose := ImprestHeader.Purpose;
        END;
    end;

    trigger OnModify()
    begin
        ImprestHeader.RESET;
        ImprestHeader.SETRANGE(ImprestHeader."No.", "Document No.");
        IF ImprestHeader.FINDFIRST THEN BEGIN
            IF
                (ImprestHeader.Status = ImprestHeader.Status::Posted) THEN
                ERROR('You Cannot Modify this record its status is posted');

            "Date Taken" := ImprestHeader.Date;
            "Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
            "Shortcut Dimension 3 Code" := ImprestHeader."Shortcut Dimension 3 Code";
            "Shortcut Dimension 4 Code" := ImprestHeader."Shortcut Dimension 4 Code";
            "Currency Factor" := ImprestHeader."Currency Factor";
            "Currency Code" := ImprestHeader."Currency Code";
            IF Purpose = '' THEN
                Purpose := ImprestHeader.Purpose;

        END;

        TESTFIELD(Committed, FALSE);
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "FIN-Staff Advance Header";
        ImprestHeader: Record "FIN-Staff Advance Header";
        RecPay: Record "FIN-Receipts and Payment Types";
}