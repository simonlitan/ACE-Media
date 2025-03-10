table 50036 "Depart Perfomance Appraisal"
{
    fields
    {
        field(1; "Appraisal Period"; Code[50])
        {
            TableRelation = "HRM Perfomance Appraisal"."Appraisal Period";
            trigger OnValidate()
            var
                HRPAppraisal: Record "HRM Perfomance Appraisal";
            begin
                HRPAppraisal.Reset();
                HRPAppraisal.SetRange("Appraisal Period", Rec."Appraisal Period");
                if HRPAppraisal.FindFirst() then begin
                    Description := HRPAppraisal.Description;
                    "Start Date" := HRPAppraisal."Start Date";
                    "End Date" := HRPAppraisal."End Date";
                    "Institution Code" := HRPAppraisal."Institution Code";
                end;

            end;

        }
        field(2; Description; Text[100])
        {

        }
        field(3; "Start Date"; Date)
        {

        }
        field(4; "End Date"; Date)
        {

        }
        field(5; "UserName"; Code[30])
        {

        }
        field(6; "Status"; Option)
        {
            OptionMembers = Pending,"Pending Approval",Approved;
        }
        field(7; "Closed"; Boolean)
        {

        }
        field(8; "Institution Code"; Code[50])
        {
            // TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(9; "Department Code"; Code[50])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));

            trigger OnValidate()
            var
                dimval: Record "Dimension Value";
            begin
                dimval.Reset();
                dimval.SetRange(Code, "Department Code");
                if dimval.FindFirst() then
                    "Department Name" := dimval.Name;
            end;
        }
        field(10; "Department Name"; Text[50])
        {

        }
        field(11; "Supervisor"; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
    }

    keys
    {
        key(key1; "Appraisal Period", "Institution Code", "Department Code", Supervisor)
        {

        }
    }

    trigger OnInsert()
    begin
        UserName := UserId;
        "Institution Code" := 'NWHSA';

    end;
}