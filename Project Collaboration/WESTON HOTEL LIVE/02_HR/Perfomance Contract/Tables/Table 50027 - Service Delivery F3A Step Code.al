table 50027 "Service Delivery F3A Step Code"
{
    DrillDownPageID = "Service Delivery F3A Step Code";
    LookupPageID = "Service Delivery F3A Step Code";

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

