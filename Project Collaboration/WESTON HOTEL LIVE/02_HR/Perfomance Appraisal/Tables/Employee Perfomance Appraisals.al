table 50035 "Employee Perfomance Appraisals"
{
    fields
    {
        field(1; "No."; Code[30])
        {

        }
        field(2; "Appraisal Period"; Code[50])
        {
            TableRelation = "HRM Perfomance Appraisal"."Appraisal Period";
            trigger OnValidate()
            var
                HRPAppraisal: Record "HRM Perfomance Appraisal";
            begin
                HRPAppraisal.Get("Appraisal Period");

                "Start Date" := HRPAppraisal."Start Date";
                "End Date" := HRPAppraisal."End Date";
                "Institution Code" := HRPAppraisal."Institution Code";
            end;
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
        field(12; "Employee No"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(13; "Supervisor"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(14; "Joint SupervisorEmployee Score"; Option)
        {
            OptionMembers = " ","Poor Performer","Needs improvement","Good performer","Exceptional performer","Outstanding Performer";
        }
    }

    keys
    {
        key(key1; "No.", "Appraisal Period", "Institution Code", "Department Code", "Employee No")
        {

        }
    }

    trigger OnInsert()
    var
        HrmEmployee: Record "HRM-Employee C";
        HRMAppraisal: Record "HRM Perfomance Appraisal";
    begin
        HrmEmployee.Reset();
        HrmEmployee.SetRange("No.", Rec."Employee No");
        if HrmEmployee.Find('-') then begin
            "Department Code" := HrmEmployee."Department Code";
            HrmEmployee.TestField(Supervisor);
            Supervisor := HrmEmployee.Supervisor;
        end;
        HRMAppraisal.Reset();
        HRMAppraisal.SetRange(Closed, false);
        if HRMAppraisal.FindLast() then begin
            Rec."Appraisal Period" := HRMAppraisal."Appraisal Period";
            Rec."Start Date" := HRMAppraisal."Start Date";
            Rec."End Date" := HRMAppraisal."End Date";
            Rec."Institution Code" := HRMAppraisal."Institution Code";
        end;
    end;
}