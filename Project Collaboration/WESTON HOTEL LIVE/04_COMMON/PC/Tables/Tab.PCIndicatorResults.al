table 52178986 "PC Indicator Results"
{
    LookupPageId = "PC Indicator Results";
    DrillDownPageId = "PC Indicator Results";
    fields
    {
        field(1; "No."; integer)
        {

        }
        field(2; "Indicator Code"; code[20])
        {

        }
        field(3; "Department"; code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(4; "Head of Department"; code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(5; "Description"; Text[100])
        {

        }
        field(6; Weight; Decimal)
        {

        }
        field(7; Unit; Text[20])
        {

        }
        field(10; "PC Period"; code[30])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(11; "Annual Target"; Decimal)
        {

        }
        field(12; "Q1 Target"; Decimal)
        {

        }
        field(13; "Q2 Target"; Decimal)
        {

        }
        field(14; "Q3 Target"; Decimal)
        {

        }
        field(15; "Q4 Target"; Decimal)
        {

        }
        field(16; "Quater Period"; code[30])
        {
            //  TableRelation = period
        }
        field(17; Score; Decimal)
        {

        }
        field(18; Posted; Boolean)
        {

        }

    }

    keys
    {
        key(key1; "No.", "Indicator Code", "PC Period", "Department", "Head of Department", "Quater Period")
        {

        }
    }

    trigger OnModify()
    begin
        if Rec.Posted = true then begin
            // Error('Cannot Modify a posted score');
        end;
    end;

}