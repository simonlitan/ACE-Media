table 52178786 "Board Tax setup"
{
    LookupPageId = "Board Tax setup";
    DrillDownPageId = "Board Tax setup";
    fields
    {
        field(1; "Tax Code"; Code[30])
        {

        }
        field(2; "Description"; Text[100])
        {

        }

        field(3; "Tax Rate"; Decimal)
        {

        }

    }
    keys
    {
        key(key1; "Tax Code", Description, "Tax Rate")
        {

        }
    }
}