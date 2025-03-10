table 52178867 "Audit-Activities"
{

    fields
    {
        field(1; "No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Activities; Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

