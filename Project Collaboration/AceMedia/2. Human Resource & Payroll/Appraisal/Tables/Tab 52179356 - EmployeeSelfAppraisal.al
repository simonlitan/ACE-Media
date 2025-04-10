table 52179356 "Employee Self-Appraisal"
{
    Caption = 'Self Appraisal';
    DataClassification = ToBeClassified;
    LookupPageId = "Self Appraisal List";
    DrillDownPageId = "Self Appraisal List";

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
            OptionMembers = Open,Submitted,Rejected,"Supervisor's Rating",Agreed,Disagreed,Closed,Released,"Pending Approval";
        }
        field(37; "GradeInt"; Code[20])
        {

        }
        field(39; "User ID"; Code[20])
        {
            Editable = false;
        }
        field(11; "Employee No"; Code[100])
        {
            Caption = 'Employee No.';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C";
            trigger OnValidate()
            var
                Employee: Record "HRM-Employee C";
                DimensionValue: Record "Dimension Value";
                Dim: Code[50];
                Sup: Code[50];
                Jobtitle: Record "HRM-Jobs";
                title: Code[200];
                JobGrade: Record "HRM-Job_Salary grade/steps";
                Sgrade: Text;
            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee No");
                if Employee.find('-') then begin
                    Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    Dim := Employee."Department Code";
                    GradeInt := Employee."Grade Level";
                    rec."Responsibility Center":= Employee."Responsibility Centre";
                    DimensionValue.SetRange(Code, dim);
                    if DimensionValue.FindFirst() then
                        Department := DimensionValue.Name;
                    Sgrade := Employee."Salary Grade";
                    //"User ID" := Employee."User ID";
                    JobGrade.SetRange("Salary Grade code", Sgrade);
                    if JobGrade.FindFirst() then begin
                        JobGrade.CalcFields("Grade Description");
                        grade := JobGrade."Grade Description";
                    end;
                    title := employee."Job Title";
                    //"Divison/section" := Employee."Division Code";
                    "Years of service" := Dates.DetermineAge(Employee."Date Of Join", Today);
                    Sup := Employee.Supervisor;
                    if Jobtitle.Get(title) then begin
                        "Job Title" := Jobtitle."Job Description";
                    end;
                end;

                if Employee.Get(Sup) then begin
                    "Supervisor’s Name:" := Employee.Names;
                end;
            end;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Employee Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(3; Department; Code[100])
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
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("WorkPlan No."), Type = const("Operational Efficiency")));
        }
        field(38; "WorkPlan No."; Code[20])
        {
            TableRelation = "Self Appraisal"."No." where("Employee No" = field("Employee No"));
            // TableRelation = "Self Appraisal"."No.";
            //Status = filter('Released')


        }
        field(15; "Self Communication Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("WorkPlan No."), Type = const("Communication Skills")));
        }
        field(16; "Self Leadership Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("WorkPlan No."), Type = const("Leadership Skills")));
        }
        field(17; "Self Role Execution Oversite"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("WorkPlan No."), Type = const("Role Execution Oversite")));
        }
        field(18; "Self Personal Attributes"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("WorkPlan No."), Type = const("Personal Attributes")));
        }
        field(19; "Supervisor Operation Effic"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("WorkPlan No."), Type = const("Operational Efficiency")));
        }
        field(20; "Supervisor Communication Skill"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("WorkPlan No."), Type = const("Communication Skills")));
        }
        field(21; "Supervisor Leadership Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("WorkPlan No."), Type = const("Leadership Skills")));
        }
        field(22; "Supervisor Role Execution"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("WorkPlan No."), Type = const("Role Execution Oversite")));
        }
        field(23; "Supervisor Personal Attributes"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("WorkPlan No."), Type = const("Personal Attributes")));
        }
        field(24; "Agreed Operation Effic"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("WorkPlan No."), Type = const("Operational Efficiency")));
        }
        field(25; "Agreed Communication Skill"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("WorkPlan No."), Type = const("Communication Skills")));
        }
        field(26; "Agreed Leadership Skills"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("WorkPlan No."), Type = const("Leadership Skills")));
        }
        field(27; "Agreed Role Execution"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("WorkPlan No."), Type = const("Role Execution Oversite")));
        }
        field(28; "Agreed Personal Attributes"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("WorkPlan No."), Type = const("Personal Attributes")));
        }
        field(29; "Totals Score Agreed"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Agreed Score" where("Document No." = field("WorkPlan No.")));
        }
        field(30; "Total Score Supervisor"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Supervisor Score" where("Document No." = field("WorkPlan No.")));
        }
        field(31; "Totals Score Self"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Self Appraisal Line"."Self Score" where("Document No." = field("WorkPlan No.")));
        }
        field(32; "Total Self Score Objective"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Strategic Objective"."Self Rating" where("Document No." = field("WorkPlan No.")));
        }
        field(33; "Total Variance Objective"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Strategic Objective".variance where("Document No." = field("WorkPlan No.")));
        }
        field(34; "Total Supervisor Objective"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Strategic Objective"."Supervisor  Rating" where("Document No." = field("WorkPlan No.")));
        }
        field(35; "Review Status"; Option)
        {
            OptionMembers = Employee,Appraiser;
        }
        field(36; "Closed"; Boolean)
        {

        }
        field(44; "Appraising Supervisor"; Code[30])
        {

            TableRelation = "HRM-Employee C"."No." where(Status = filter(Active));


            Trigger OnValidate()
            var
                Emp: Record "HRM-Employee C";
            begin
                Emp.Reset();
                Emp.SetRange("No.", Rec."Appraising Supervisor");
                If Emp.Find('-') then begin
                    "Appraising Supervisor Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Appraising Supervisor Userid" := Emp."User ID";
                    //"Send To" := Emp."User ID";
                end;
            end;

        }
        field(43; "Appraising Supervisor Name"; Text[100])
        {

        }
        field(45; "Appraising Supervisor Userid"; Code[30])
        {

        }
        field(42; "Send To"; Code[30])
        {

        }
        field(46; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(47; "Additional Assignments"; Text[500])
        {

        }

        field(48; "Supervisor Comments"; Text[500])
        {

        }
        field(49; "Appraisee Comments"; Text[500])
        {

        }
        field(50; "Training Identification"; Text[500])
        {

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
        MaxItem: Integer;
    begin
        if "No." = '' then begin
            NoSeriesMgt.InitSeries('APPRAISE', xRec."No. Series", 0D, "No.", "No. Series");
        end;

    end;


    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Dates: Codeunit "HR Dates";
}
