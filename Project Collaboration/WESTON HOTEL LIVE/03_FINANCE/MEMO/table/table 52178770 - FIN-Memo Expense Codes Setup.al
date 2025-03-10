table 52178770 "FIN-Memo Expense Codes Setup"
{
    DrillDownPageID = "FIN-Memo Expense Codes Setup";
    LookupPageID = "FIN-Memo Expense Codes Setup";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

