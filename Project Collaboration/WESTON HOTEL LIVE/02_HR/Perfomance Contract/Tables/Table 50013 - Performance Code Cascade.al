table 50013 "Performance Code Cascade"
{
    DrillDownPageID = "Performance Criteria Code";
    LookupPageID = "Performance Criteria Code";

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

