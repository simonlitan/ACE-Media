table 52178522 "Micros Cost Centers"
{
    DrillDownPageId = "Micros Cost centers";
    LookupPageId = "Micros Cost centers";

    fields
    {
        field(1; "Opera Code"; Code[20])
        {
        }
        field(2; "Navision Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Opera Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

