table 52179146 "HRM-Employee Leave Journal"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Staff No."; Code[30])
        {
            TableRelation = "HRM-Employee C"."No.";

            /* trigger OnValidate()
            begin
                if emp.Get("Staff No.") then
                    "Staff Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end; */
        }
        field(3; "Staff Name"; Text[250])
        {
            trigger OnValidate()
            begin
                if emp.Get("Staff No.") then
                    "Staff Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end;
        }
        field(4; "Transaction Description"; Text[150])
        {
        }
        field(5; "Leave Type"; Code[20])
        {
            TableRelation = "HRM-Leave Types".Code;
        }
        field(6; "No. of Days"; Decimal)
        {
        }
        field(7; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Allocation,Application,Positive Adjustment,Negative Adjustment';
            OptionMembers = " ",Allocation,Application,"Positive Adjustment","Negative Adjustment";
        }
        field(8; "Document No."; Code[50])
        {
        }
        field(9; "Posting Date"; Date)
        {
        }
        field(10; "Leave Period"; Integer)
        {
        }
        field(11; "Start Date"; date)
        {

        }
        field(12; "End Date"; date)
        {

        }
        field(13; Active; Boolean)
        {

        }
        field(14; Closed; Boolean)
        {

        }
        field(15; "Leave PeriodAcc"; Code[20])
        {
            TableRelation = "HRM-Job_Salary grade/steps"."Leave PeriodAcc";
        }
        field(16; "Forfeited Days"; Decimal)
        {

        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        emp: Record "HRM-Employee C";
}


