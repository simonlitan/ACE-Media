table 52179206 "PRL-Journal Trans Mapping"
{

    fields
    {
        field(1; "Transaction Code"; Code[10])
        {
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(2; "GL Navision"; Text[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(3; "Append StaffCode"; Boolean)
        {
        }
        field(4; "Is Formula"; Boolean)
        {
        }
        field(5; Formula; Text[100])
        {
        }
        field(6; Analysis0; Boolean)
        {
        }
        field(7; Analysis1; Boolean)
        {
        }
        field(8; Analysis2; Boolean)
        {
        }
        field(9; Analysis3; Boolean)
        {
        }
        field(10; Analysis4; Boolean)
        {
        }
        field(11; Analysis5; Boolean)
        {
        }
        field(12; "Amount (Dr/Cr)"; Option)
        {
            OptionMembers = Debit,Credit;
        }
        field(13; "GL Others"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Transaction Code")
        {
        }
    }

    fieldgroups
    {
    }
}

