table 52179154 "HRM-Job Applic.- Appt. Res"
{

    fields
    {
        field(1; "Applicant No"; Code[20])
        {
            Description = 'Stores the admission number of the record in the database';
            TableRelation = "HRM-Job Applic.- Appt. Line"."Applicants Code";
        }
        field(2; "Interview Code"; Code[80])
        {
            Description = 'Stores the code of the medical condition in the database';
            //TableRelation = "HRM-Stage Requirements"."Qualification Code" WHERE("Stage Code" = FIELD(Stage));

            trigger OnValidate()
            begin
                /*  Intdetails.SetRange(Intdetails."Qualification Code", "Interview Code");
                 if Intdetails.Find('-') then begin
                     "Interview Description" := Intdetails."Qualification Description"; */

                ///end;
            end;
        }
        field(3; "Interview Description"; Text[250])
        {
            Description = 'Stores the name of the medical condition';

            trigger OnValidate()
            begin

                CalcFields("Interview Description");
            end;
        }
        field(4; Score; Decimal)
        {
            Description = 'Stores when the user was diagnosed';
            MaxValue = 5;
        }
        field(5; "Total Score"; Decimal)
        {
            CalcFormula = Sum("HRM-Job Applic.- Appt. Res".Score WHERE("Applicant No" = FIELD("Applicant No")));
            Editable = false;
            FieldClass = FlowField;
            MaxValue = 19;

            trigger OnValidate()
            begin
                //Cust.CALCFIELDS("Total Score");
                if Cust."Total Score" > 5 then begin
                    Error('The allowable unaccounted balance of %1 has been exceeded');

                end;
            end;
        }
        field(6; Category; Option)
        {
            OptionMembers = "JOB SPECIFIC EVALUATION AREA","EMPLOYEE PERFORMANCE FACTOR";
        }
        field(7; "Sub Category"; Code[100])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Checklist Item"));
        }
        field(8; Group; Code[80])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Appraisal Sub Category"));
        }
        field(9; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(10; comments; Text[250])
        {
        }
        field(11; Interviwer; Code[50])
        {
            TableRelation = "HRM-Employee C";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", Interviwer);
                if Employee.Find('-') then begin
                    "Interviewer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(12; "Interviewer Name"; Text[100])
        {
        }
        field(13; Stage; Code[10])
        {
            TableRelation = "HRM-Recruitment Stages".Code;
        }
    }

    keys
    {
        key(Key1; "Applicant No", "Line No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        HRLookupValues: Record "HRM-Lookup Values";
        TotalScore: Integer;

        Cust: Record "HRM-Job Interview";
        Employee: Record "HRM-Employee C";
}

