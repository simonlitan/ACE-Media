table 50213 "Self Appraisal"
{
    Caption = 'Self Appraisal';
    DataClassification = ToBeClassified;
    LookupPageId = "Work Plan";
    DrillDownPageId = "Work Plan";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    NoSeriesMgt.TestManual('APPRAISE');
                    "No. Series" := '';
                end;
            end;
        }
        field(13; Status; option)
        {
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(37; "GradeInt"; Code[20])
        {

        }
        field(40; "User ID"; Code[20])
        {
            Editable = false;
        }
        field(39; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Employee No"; Code[20])
        {
            Caption = 'Employee No.';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C";
            trigger OnValidate()
            var
                Employee: Record "HRM-Employee C";
                DimensionValue: Record "Dimension Value";
                Dim: Code[20];
                Sup: Code[20];
                Jobtitle: Record "HRM-Jobs";
                title: Code[20];
                JobGrade: Record "HRM-Job_Salary grade/steps";
                Sgrade: Text;
            begin
                if Employee.Get("Employee No") then begin
                    Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Department Code" := Employee."Department Code";
                    GradeInt := Employee."Grade Level";
                    Sgrade := Employee."Salary Grade";
                    "User ID" := Employee."User ID";
                    JobGrade.SetRange("Salary Grade code", Sgrade);
                    if JobGrade.FindFirst() then begin
                        JobGrade.CalcFields("Grade Description");
                        grade := JobGrade."Grade Description";
                    end;
                    title := employee."Job Title";
                   // "Divison/section" := Employee."Division Code";
                    "Years of service" := Dates.DetermineAge(Employee."Date Of Join", Today);
                    Sup := Employee.Supervisor;
                    if Jobtitle.Get(title) then begin
                        "Job Title" := Jobtitle."Job Description";
                    end;
                end;
                if Employee.Get(Sup) then begin
                    "Supervisor’s Name:" := Employee.Names;
                end;
                DimensionValue.Reset();
                DimensionValue.SetRange(Code, "Department Code");
                if DimensionValue.FindFirst() then
                    Department := DimensionValue.Name;
            end;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Employee Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(3; Department; Code[50])
        {
            Caption = 'Department';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; Grade; Text[30])
        {
            Caption = 'Grade';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Period Under Review"; Code[50])
        {
            Caption = 'Period Under Review';
            DataClassification = ToBeClassified;
            TableRelation = "Appraisal Period";
        }
        field(6; "Supervisor’s Name:"; Text[250])
        {
            Caption = 'Supervisor’s Name:';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C";
            Editable = false;
        }
        field(7; "Job Title"; Text[100])
        {
            Caption = 'Job Title';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Divison/section"; Code[250])
        {
            Caption = 'Divison/section';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Last Review Date"; Date)
        {
            Caption = 'Last Review Date';
            DataClassification = ToBeClassified;
        }
        field(10; "Years of service"; Text[100])
        {
            Caption = 'Years of service';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(14; " Self Operation Efficiency"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("No."), Type = const("Operational Efficiency")));
        }
        field(15; "Self Communication Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("No."), Type = const("Communication Skills")));
        }
        field(16; "Self Leadership Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("No."), Type = const("Leadership Skills")));
        }
        field(17; "Self Role Execution Oversite"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("No."), Type = const("Role Execution Oversite")));
        }
        field(18; "Self Personal Attributes"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("No."), Type = const("Personal Attributes")));
        }
        field(19; "Supervisor Operation Effic"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("No."), Type = const("Operational Efficiency")));
        }
        field(20; "Supervisor Communication Skill"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("No."), Type = const("Communication Skills")));
        }
        field(21; "Supervisor Leadership Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("No."), Type = const("Leadership Skills")));
        }
        field(22; "Supervisor Role Execution"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("No."), Type = const("Role Execution Oversite")));
        }
        field(23; "Supervisor Personal Attributes"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("No."), Type = const("Personal Attributes")));
        }
        field(24; "Agreed Operation Effic"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("No."), Type = const("Operational Efficiency")));
        }
        field(25; "Agreed Communication Skill"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("No."), Type = const("Communication Skills")));
        }
        field(26; "Agreed Leadership Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("No."), Type = const("Leadership Skills")));
        }
        field(27; "Agreed Role Execution"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("No."), Type = const("Role Execution Oversite")));
        }
        field(28; "Agreed Personal Attributes"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("No."), Type = const("Personal Attributes")));
        }
        field(29; "Totals Score Agreed"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("No.")));
        }
        field(30; "Total Score Supervisor"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("No.")));
        }
        field(31; "Totals Score Self"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("No.")));
        }
        field(32; "Total Self Score Objective"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Strategic Objective"."Self Rating" where("Document No." = field("No.")));
        }
        field(33; "Total Variance Objective"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Strategic Objective".variance where("Document No." = field("No.")));
        }
        field(34; "Total Supervisor Objective"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Strategic Objective"."Supervisor  Rating" where("Document No." = field("No.")));
        }
        field(35; "Review Status"; Option)
        {
            OptionMembers = Employee,Appraiser;
        }
        field(36; "Closed"; Boolean)
        {

        }
        field(38; "Supervisor"; Text[50])
        {
            TableRelation = "HRM-Employee C"."No.";
            DataClassification = ToBeClassified;
        }
        field(41; "From"; date)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "To"; date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            NoSeriesMgt.InitSeries('APPRAISE', xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Dates: Codeunit "HR Dates";
}
