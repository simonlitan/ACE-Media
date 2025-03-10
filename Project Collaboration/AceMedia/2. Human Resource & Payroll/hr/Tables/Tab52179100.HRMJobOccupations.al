/// <summary>
/// Table HRM-Job Occupations (ID 61196).
/// </summary>
table 52179100 "HRM-Job Occupations"
{

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            begin
                HREmp.Get("Employee No.");

                CalcFields("First Name");
                CalcFields("Middle Name");
                CalcFields("Last Name");
                Email := HREmp."E-Mail";
                "Date of Join" := HREmp."Date Of Join";
                HREmp."Job Title" := "Job Id";
                HREmp.Validate(HREmp."Job Title");
                HREmp.Modify;
            end;
        }
        field(2; "First Name"; Text[80])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("HRM-Employee C"."First Name" WHERE("No." = FIELD("Employee No.")));

        }
        field(3; "Middle Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("HRM-Employee C"."Middle Name" WHERE("No." = FIELD("Employee No.")));

        }
        field(4; "Last Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("HRM-Employee C"."Last Name" WHERE("No." = FIELD("Employee No.")));

        }
        field(5; Extension; Text[30])
        {
            FieldClass = Normal;
        }
        field(6; Email; Text[30])
        {
            FieldClass = Normal;
        }
        field(7; "Date of Join"; Date)
        {
            FieldClass = Normal;
        }
        field(8; Department; Code[20])
        {
            FieldClass = Normal;
        }
        field(9; "Job Title"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("HRM-Jobs"."Job Title" WHERE("Job ID" = FIELD("Job Id")));

        }
        field(10; "Job Id"; Code[100])
        {
            TableRelation = "HRM-Jobs"."Job ID";
        }
    }

    keys
    {
        key(Key1; "Job Id", "Employee No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        HREmp: Record "HRM-Employee C";
        HRJobs: Record "HRM-Jobs";
}

