table 52178551 "GEN-Religion"
{
    DrillDownPageID = "GEN-Religion List";
    LookupPageID = "GEN-Religion List";

    fields
    {
        field(1; Relegion; Code[50])
        {
        }
        field(2; Remarks; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; Relegion)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

