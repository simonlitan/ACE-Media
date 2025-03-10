table 61192 "HRM-Job Responsiblities (B)"
{

    fields
    {
        field(2; "Job ID"; Code[50])
        {
        }
        field(3; "Responsibility Description"; Text[2048])
        {
        }
        field(4; Remarks; Text[2048])
        {
        }
        field(5; "Responsibility Code"; Code[20])
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
        HRAppEvalArea: Record "HRM-Appraisal Evaluation Areas";
}

