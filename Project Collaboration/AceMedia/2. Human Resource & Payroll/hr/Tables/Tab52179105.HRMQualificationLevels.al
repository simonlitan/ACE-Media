table 52179105 "HRM-Qualification Levels"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; Description; Text[150])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(4; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
        }
    }

    fieldgroups
    {
    }
}

