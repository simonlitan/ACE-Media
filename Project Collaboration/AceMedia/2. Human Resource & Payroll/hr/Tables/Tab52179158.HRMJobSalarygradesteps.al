table 52179158 "HRM-Job_Salary grade/steps"
{
    DrillDownPageID = "HRM-Job_Salary Grade/Steps";
    LookupPageID = "HRM-Job_Salary Grade/Steps";

    fields
    {
        field(2; "Employee Category"; Code[30])
        {
            TableRelation = "HRM-Employee Categories".Code;
        }
        field(3; "Salary Grade code"; Code[30])
        {
            TableRelation = "HRM-Salary Grades"."Salary Grade";
        }
        field(4; "Grade Level"; Integer)
        {
        }
        field(5; "House Allowance"; Decimal)
        {
        }
        field(6; "Leave Allowance"; Decimal)
        {
        }
        field(7; "Medical Ceilling"; Decimal)
        {
        }
        field(8; "Annual Leave Days"; Decimal)
        {
        }
        field(9; "Grade Description"; Text[100])
        {
            CalcFormula = Lookup("HRM-Salary Grades".Description WHERE("Salary Grade" = FIELD("Salary Grade code")));
            FieldClass = FlowField;
        }
        field(10; "Weekly Hours"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Monthly Earned Leave Days"; Decimal)
        {

        }
        field(12; "Cummulative Earned Days"; Decimal)
        {

        }
        field(15; "Commuter Allowance"; Decimal)
        {

        }
        field(16; "Remunerative Allowances"; Decimal)
        {

        }
        field(17; "House Allowance Code"; Code[30])
        {
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(18; "Commuter Allowance Code"; Code[30])
        {
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(19; "Remunerative Allowance Code"; Code[30])
        {
            TableRelation = "PRL-Transaction Codes"."Transaction Code";
        }
        field(20; "Leave PeriodAcc"; code[20])
        {
            TableRelation = "Leave Setup"."Leave Period" where(Closed = Filter(False));
        }
        field(21; "Start Date"; Date)
        {

        }
        field(22; "End Date"; Date)
        {

        }
    }

    keys
    {
        key(Key1; "Employee Category", "Salary Grade code")
        {
        }
        key(Key2; "Grade Level")
        {
        }
    }

    fieldgroups
    {
    }
}
