table 50033 "Periodic Appraisal Targets"
{
    fields
    {
        field(1; "No."; Code[30])
        {

        }
        field(2; "Appraisal Period"; Code[50])
        {

        }
        field(3; "Start Date"; date)
        {

        }
        field(4; "End Date"; date)
        {

        }
        field(5; "Institution Code"; Code[30])
        {

        }
        field(6; "Department Code"; Code[30])
        {

        }
        field(7; "Target Description"; Text[250])
        {

        }
        field(8; "Mid Year Employee Evaluation"; Option)
        {
            OptionMembers = " ","Poor Performer","Needs improvement","Good performer","Exceptional performer","Outstanding Performer";
        }
        field(9; "Mid Year Supervisor Evaluation"; Option)
        {
            OptionMembers = " ","Poor Performer","Needs improvement","Good performer","Exceptional performer","Outstanding Performer";
        }
        field(10; "End Year Employee Evaluation"; Option)
        {
            OptionMembers = " ","Poor Performer","Needs improvement","Good performer","Exceptional performer","Outstanding Performer";
        }
        field(11; "End Year Supervisor Evaluation"; Option)
        {
            OptionMembers = " ","Poor Performer","Needs improvement","Good performer","Exceptional performer","Outstanding Performer";
        }
        field(12; Supervisor; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
    }

    keys
    {
        key(key1; "No.", "Appraisal Period", "Institution Code", "Department Code", Supervisor)
        {

        }
    }
}