table 52178481 "Journals Voucher Lines1"
{
    LookupPageId = "Journal Voucher Lines1";
    DrillDownPageId = "Journal Voucher Lines1";
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "No."; Code[30])
        {
        }
        field(3; "Account Type"; Enum "Gen. Journal Account Type")
        {
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type" = CONST(Employee)) Employee;

        }
        field(5; "Creation Date"; Date)
        {

        }
        field(6; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';

            trigger OnValidate()
            var
                Cust: Record Customer;
                Vend: Record Vendor;
            begin

                if "Account No." <> '' then
                    case "Account Type" of
                        "Account Type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                Cust.CheckBlockedCustOnJnls(Cust, "Document Type", false);
                            end;
                        "Account Type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                Vend.CheckBlockedVendOnJnls(Vend, "Document Type", false);
                            end;
                    end;

            end;
        }
        field(7; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(8; Amount; Decimal)
        {
            trigger OnValidate()
            begin
                "Amount LCY" := Amount;
                Validate("Amount LCY");
                if "Currency Code" <> '' then begin
                    if "Exchange Rate" <> 0 then
                        Validate("Exchange Rate")

                    // else

                end;
            end;

        }
        field(9; "Amount LCY"; Decimal)
        {

        }

        field(10; "Bal. Account Type"; Enum "Gen. Journal Account Type")
        {

        }
        field(11; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting), Blocked = CONST(false))
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Bal. Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Bal. Account Type" = CONST(Employee)) Employee;


        }
        field(12; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

        }
        field(13; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(14; "Description"; Text[100])
        {

        }

        field(15; "Processed"; Boolean)
        {

        }
        field(16; UserId; Code[20])
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Rec.Reset();
                Rec.SetRange(UserId, UserId);
            end;

        }
        field(17; "Currency Code"; Code[20])
        {
            Editable = true;
            TableRelation = Currency;
            trigger OnValidate()
            var
                Currcy: Record "Currency Exchange Rate";
            begin

                Currcy.Reset();
                Currcy.SetRange("Currency Code", "Currency Code");
                if Currcy.FindLast() then begin
                    "Exchange Rate" := Currcy."Relational Exch. Rate Amount";
                end;

                if Amount <> 0 then
                    Validate(Amount);

            end;
        }

        field(37; "Exchange Rate"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 15;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Reciprical 1" := 1 / "Exchange Rate";
                VALIDATE("Reciprical 1");
            end;
        }
        field(38; "Reciprical 1"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;
            trigger OnValidate()
            begin
                if "Currency Code" <> '' then
                    "Amount LCY" := ROUND(Amount / "Reciprical 1")
                else
                    "Amount LCY" := Amount;
            end;
        }

        field(39; "Staff No."; Code[50])
        {

        }
        field(40; "Extra Info"; Text[100])
        {

        }
    }

    keys
    {
        key(pk; "Line No.", "No.")
        {

        }
    }
}