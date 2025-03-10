table 52178523 "Micros G/L Accounts"
{
    DrillDownPageId = "Micros G/L Accounts";
    LookupPageId = "Micros G/L Accounts";
    fields
    {
        field(1; "Navision Code"; Code[20])
        {
        }
        field(2; "Opera Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Navision Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

