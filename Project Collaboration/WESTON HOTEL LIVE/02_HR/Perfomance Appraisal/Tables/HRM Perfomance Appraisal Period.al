table 50034 "HRM Perfomance Appraisal"
{
    fields
    {
        field(1; "Appraisal Period"; Code[50])
        {
            TableRelation = "G/L Budget Name".Name;
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

        }
    }


    keys
    {
        key(key1; "Appraisal Period", "Institution Code")
        {

        }
    }

    trigger OnInsert()
    begin
        UserName := UserId;
    end;

    procedure EscalateTargets()
    var
        ApprTargets: Record "Periodic Appraisal Targets";
        EmpApprTargets: Record "Employee Perfomance Appraisals";
        DeptApprTargets: Record "Depart Perfomance Appraisal";
        HrmEmployee: Record "HRM-Employee C";
    begin
        ApprTargets.Reset();
        ApprTargets.SetRange("Appraisal Period", Rec."Appraisal Period");
        ApprTargets.SetRange("Institution Code", Rec."Institution Code");
        if ApprTargets.Find('-') then begin
            repeat
                HrmEmployee.Reset();
                HrmEmployee.SetRange("Department Code", ApprTargets."Department Code");
                if HrmEmployee.Find('-') then begin
                    repeat
                        EmpApprTargets.Init();
                        EmpApprTargets."Appraisal Period" := Rec."Appraisal Period";
                        EmpApprTargets."No." := ApprTargets."No.";
                        EmpApprTargets."Department Code" := HrmEmployee."Department Code";
                        EmpApprTargets."Employee No" := HrmEmployee."No.";
                        EmpApprTargets."Start Date" := Rec."Start Date";
                        EmpApprTargets."End Date" := Rec."End Date";
                        EmpApprTargets."Institution Code" := Rec."Institution Code";
                        EmpApprTargets.Supervisor := ApprTargets.Supervisor;
                        EmpApprTargets."Target Description" := ApprTargets."Target Description";
                        EmpApprTargets.Insert();
                    until HrmEmployee.Next() = 0;
                end;
            until ApprTargets.Next() = 0;

        end;

    end;

    procedure ClassifyTargets()
    var
        ApprTargets: Record "Periodic Appraisal Targets";
        EmpApprTargets: Record "Employee Perfomance Appraisals";
        DeptApprTargets: Record "Depart Perfomance Appraisal";
        HrmEmployee: Record "HRM-Employee C";
    begin
        EmpApprTargets.Reset();
        EmpApprTargets.SetRange("Appraisal Period", Rec."Appraisal Period");
        if EmpApprTargets.Find('-') then begin
            repeat
                ApprTargets.Init();
                ApprTargets."No." := EmpApprTargets."No." + EmpApprTargets."Employee No";
                ApprTargets."Institution Code" := EmpApprTargets."Institution Code";
                ApprTargets."Appraisal Period" := EmpApprTargets."Appraisal Period";
                ApprTargets."Department Code" := EmpApprTargets."Department Code";
                ApprTargets.Supervisor := EmpApprTargets.Supervisor;
                ApprTargets."Start Date" := EmpApprTargets."Start Date";
                ApprTargets."End Date" := EmpApprTargets."End Date";
                ApprTargets."Target Description" := EmpApprTargets."Target Description";
                ApprTargets.Insert();
            until EmpApprTargets.Next() = 0;

            DeptApprTargets.Reset();
            DeptApprTargets.SetRange("Appraisal Period", Rec."Appraisal Period");
            DeptApprTargets.SetRange("Institution Code", Rec."Institution Code");
            DeptApprTargets.SetRange("Department Code", EmpApprTargets."Department Code");
            DeptApprTargets.SetRange(Supervisor, EmpApprTargets.Supervisor);
            if NOT DeptApprTargets.FindFirst then begin
                DeptApprTargets.Init();
                DeptApprTargets."Appraisal Period" := Rec."Appraisal Period";
                DeptApprTargets."Start Date" := Rec."Start Date";
                DeptApprTargets."End Date" := Rec."End Date";
                DeptApprTargets."Institution Code" := Rec."Institution Code";
                DeptApprTargets.Supervisor := EmpApprTargets.Supervisor;
                DeptApprTargets.UserName := Rec.UserName;
                DeptApprTargets."Department Code" := EmpApprTargets."Department Code";
                DeptApprTargets.Insert();
            end;

            Message('Updated Successifully');
        end;

    end;

}
