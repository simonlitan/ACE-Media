table 66623 "HR Overall Comments"
{

    fields
    {
        field(1; "No series"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Appraisal Code"; Code[50])
        {
            TableRelation = "HR Appraisal Card"."Appraisal Code";
        }
        field(3; "Supervisor Comments"; Text[250])
        {
        }
        field(4; "Appraisee Comments"; Text[250])
        {
        }
        field(5; "HR comments"; Text[250])
        {
        }
        field(6; "Weak Areas Discussed"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "No series", "Appraisal Code")
        {
        }
    }

    fieldgroups
    {
    }
}

