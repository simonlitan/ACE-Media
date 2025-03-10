table 52179103 "HRM-Lookup Values"
{
    DrillDownPageID = "HRM-Lookup Values List";
    LookupPageID = "HRM-Lookup Values List";

    fields
    {
        field(1; Type; Option)
        {
            OptionCaption = 'Religion,Language,Medical Scheme,Location,Contract Type,Qualification Type,Stages,Scores,Institution,Appraisal Type,Appraisal Period,Urgency,Succession,Security,Disciplinary Case Rating,Disciplinary Case,Disciplinary Action,Next of Kin,County,Grade,Checklist Item,Appraisal Sub Category,Appraisal Group Item,Transport Type,Training Cost Items,Training Category,Dependant,CompetenceValues,ShortListing Criteria,Qualification category';
            OptionMembers = Religion,Language,"Medical Scheme",Location,"Contract Type","Qualification Type",Stages,Scores,Institution,"Appraisal Type","Appraisal Period",Urgency,Succession,Security,"Disciplinary Case Rating","Disciplinary Case","Disciplinary Action","Next of Kin",County,Grade,"Checklist Item","Appraisal Sub Category","Appraisal Group Item","Transport Type","Training Cost Items","Training Category",Dependant,CompetenceValues,"ShortListing Criteria","Qualification category";
        }
        field(2; "Code"; Code[70])
        {
        }
        field(3; Description; Text[500])
        {
        }
        field(4; Remarks; Text[250])
        {
        }
        field(5; "Notice Period"; Date)
        {
        }
        field(6; Closed; Boolean)
        {
        }
        field(7; "Contract Length"; Integer)
        {
        }
        field(8; "Current Appraisal Period"; Boolean)
        {
        }
        field(9; "Disciplinary Case Rating"; Text[30])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Disciplinary Case Rating"));
        }
        field(10; "Disciplinary Action"; Code[20])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Disciplinary Action"));
        }
        field(11; From; Date)
        {
        }
        field(12; "To"; Date)
        {
        }
        field(13; Score; Integer)
        {
        }
        field(14; "Basic Salary"; Decimal)
        {
        }
        field(15; "To be cleared by"; Code[10])
        {
            TableRelation = "HRM-Jobs"."Job ID";
        }
        field(16; "Weight Scores"; Decimal)
        {
        }
        field(17; "Job Scale"; Code[10])
        {
        }
        field(18; "Next Period"; Boolean)
        {
        }
        field(19; "Previous Job Position"; Boolean)
        {
        }
        field(20; "Previous Job Position Order"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; Type, "Code", Description)
        {
        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description)
        {
        }
    }
}

