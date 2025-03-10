table 52178877 "Audit- Risks"
{

    fields
    {
        field(1; No; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Risk Code"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Title; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No, "Risk Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

