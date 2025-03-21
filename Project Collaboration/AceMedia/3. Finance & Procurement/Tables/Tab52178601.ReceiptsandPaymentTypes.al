table 52178601 "Receipts and Payment Types"
{
    // DrillDownPageID = 50627;
    // LookupPageID = 50627;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Account Type"; Option)
        {
            Caption = '"Account Type"';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Staff,None';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Staff,"None";

            trigger OnValidate()
            begin
                IF "Account Type" = "Account Type"::"G/L Account" THEN
                    "Direct Expense" := TRUE
                ELSE
                    "Direct Expense" := FALSE;
            end;
        }
        field(4; Type; Option)
        {
            NotBlank = true;
            OptionCaption = ' ,Receipt,Payment,Imprest,Claim,Advance';
            OptionMembers = " ",Receipt,Payment,Imprest,Claim,Advance;
        }
        field(5; "VAT Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(6; "Withholding Tax Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(7; "VAT Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
        }
        field(8; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
        }
        field(9; "Default Grouping"; Code[20])
        {
            TableRelation = IF ("Account Type" = CONST(Customer)) "Customer Posting Group"
            ELSE
            IF ("Account Type" = CONST(Vendor)) "Vendor Posting Group"
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account Posting Group"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "FA Posting Group"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner";
        }
        field(10; "G/L Account"; Code[20])
        {
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account"."No.";

            trigger OnValidate()
            begin
                GLAcc.RESET;
                IF GLAcc.GET("G/L Account") THEN BEGIN
                    IF Type = Type::Payment THEN
                        // GLAcc.TESTFIELD(GLAcc."Budget Controlled",TRUE);
                        IF GLAcc."Direct Posting" = FALSE THEN BEGIN
                            ERROR('Direct Posting must be True');
                        END;
                END;
            end;
        }
        field(11; "Pending Voucher"; Boolean)
        {
        }
        field(12; "Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";

            trigger OnValidate()
            begin
                IF "Account Type" <> "Account Type"::"Bank Account" THEN BEGIN
                    ERROR('You can only enter Bank No where "Account Type" is Bank Account');
                END;
            end;
        }
        field(13; "Transation Remarks"; Text[250])
        {
            NotBlank = true;
        }
        field(14; "Payment Reference"; Option)
        {
            OptionMembers = Normal,"Farmer Purchase";
        }
        field(15; "Customer Payment On Account"; Boolean)
        {
        }
        field(16; "Direct Expense"; Boolean)
        {
            Editable = false;
        }
        field(17; "Calculate Retention"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(18; "Retention Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
        }
        field(19; Blocked; Boolean)
        {
        }
        field(20; "Retention Fee Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
        }
        field(21; "Retention Fee Applicable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(22; "Subsistence?"; Boolean)
        {
        }
        field(23; "Lecturer Claim?"; Boolean)
        {
        }
        field(24; "VAT Withheld Code"; Code[20])
        {
            TableRelation = "Tariff Codes".Code;
        }
        field(25; "Council Claim?"; Boolean)
        {
        }
        field(26; "Telephone Allowance?"; Boolean)
        {
        }
        field(27; "PAYE Tax Chargeable"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(28; "PAYE Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
        }
        field(29; "Use PAYE Table"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        IF Type = Type::Receipt THEN BEGIN
            RecLine.SETRANGE(RecLine.Type, Code);
            IF RecLine.FIND('-') THEN BEGIN
                ERROR('You cannot delete this Receipt type because it is already in use');
            END;
        END;

        IF Type = Type::Payment THEN BEGIN
            PayLine.SETRANGE(PayLine.Type, Code);
            IF PayLine.FIND('-') THEN BEGIN
                ERROR('You cannot delete this Payment type because it is already in use');
            END;
        END;
    end;

    var
        GLAcc: Record "G/L Account";
        PayLine: Record "Payment Line";
        RecLine: Record "Receipt Line q";
}
