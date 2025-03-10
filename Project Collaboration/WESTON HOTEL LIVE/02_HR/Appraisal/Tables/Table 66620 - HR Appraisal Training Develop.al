table 66620 "HR Appraisal Training Develop"
{

    fields
    {
        field(1; "No Series"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Appraisal No"; Code[50])
        {
            TableRelation = "HR Appraisal indicators"."Entry No" WHERE("Code" = FIELD("Appraisal No"));
        }
        field(3; "Staff No"; Code[50])
        {
            TableRelation = "HRM-Employee C"."NHIF No.";
        }
        field(4; "Training Category"; Code[50])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = FILTER("Training Category"));
        }
        field(5; KSAR; Text[250])
        {
        }
        field(6; HOW; Text[250])
        {
        }
        field(7; IMPACT; Text[250])
        {
        }
        field(8; COMMENTS; Option)
        {
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
    }

    keys
    {
        key(Key1; "No Series", "Appraisal No")
        {
        }
    }

    fieldgroups
    {
    }
}

