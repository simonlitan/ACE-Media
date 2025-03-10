/// <summary>
/// Table HRM-Cue (ID 61682).
/// </summary>
table 61682 "HRM-Cue"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Employee-Active"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("HRM-Employee C" WHERE("Employee Type" = FILTER(<> Intern), Status = FILTER(Active), "Contract Type" = FILTER(<> cASUAL)));
        }
        field(3; "Employee-Male"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Gender = FILTER(Male), Status = filter(Active)));
            FieldClass = FlowField;
        }
        field(4; "Employee-Female"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Gender = FILTER(Female), Status = filter(Active)));
            FieldClass = FlowField;
        }
        field(5; "Employee-InActive"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Inactive)));
            FieldClass = FlowField;
        }

        field(9; "Employee-InActive (PR)"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(<> Active)));
            FieldClass = FlowField;
        }
        field(10; "Active Casuals (PR)"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Active),
                                                          "Contract Type" = FILTER(Casual)));
            FieldClass = FlowField;
        }
        field(11; "Active Permanent (PR)"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Active),
                                                          "Employee Type" = FILTER(Permanent)));
            FieldClass = FlowField;
        }
        field(12; "Active Casual (Female) (PR)"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Active),
                                                          "Employee Type" = FILTER(Casual),
                                                          Gender = FILTER(Female)));
            FieldClass = FlowField;
        }
        field(13; "Active Casual (Male) (PR)"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Active),
                                                          "Employee Type" = FILTER(Casual),
                                                          Gender = FILTER(Male)));
            FieldClass = FlowField;
        }
        field(14; "Active Permanent (Female) (PR)"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Active),
                                                          // "Employee Type" = FILTER(Permanent),
                                                          Gender = FILTER(Female)));
            FieldClass = FlowField;
        }
        field(15; "Active Permanent (Male) (PR)"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Active),
                                                          //"Employee Type" = FILTER(Permanent),
                                                          Gender = FILTER(Male)));
            FieldClass = FlowField;
        }
        field(16; "Retired Employees"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Retired)));

            FieldClass = FlowField;
        }
        field(17; Interns; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(
            "Employee Type" = FILTER(Intern)));

            FieldClass = FlowField;
        }
        field(6; "Active Interns"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = filter(active),
            "Employee Type" = FILTER(Intern)));

            FieldClass = FlowField;
        }
        field(7; "Inactive Interns"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = filter(<> active),
            "Employee Type" = FILTER(Intern)));

            FieldClass = FlowField;
        }
        field(18; "Resigned Employees"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Status = FILTER(Resigned)));

            FieldClass = FlowField;
        }
        field(8; Employees; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE("Posting Group" = FILTER('Payroll')));

            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    trigger OnModify()
    var
        emp: record "HRM-Employee C";
    begin
        emp.reset();
        if emp.FindFirst() then begin
            emp.CalcFields(Status);
            Message(Format(emp.status));
        end;
    end;

}

