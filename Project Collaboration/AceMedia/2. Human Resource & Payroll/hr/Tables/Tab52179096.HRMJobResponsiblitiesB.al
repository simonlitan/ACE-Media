table 52179096 "HRM-Job Responsiblities (B)"
{

    fields
    {
        field(1; "Job ID"; Code[50])
        {
        }

        field(2; "Responsibility Description"; Text[2048])
        {
        }
        field(3; Remarks; Text[2048])
        {
        }
        field(4; "Responsibility Code"; Code[20])
        {

        }
    }

    keys
    {
        key(Key1; "Job ID", "Responsibility Code")
        {
        }
    }

    fieldgroups
    {
    }

    var

}

