table 50012 "Performance Step Code Cascade"
{
    DrillDownPageID = "Performance Criteria Step Code";
    LookupPageID = "Performance Criteria Step Code";

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Steps; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; Steps, "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

