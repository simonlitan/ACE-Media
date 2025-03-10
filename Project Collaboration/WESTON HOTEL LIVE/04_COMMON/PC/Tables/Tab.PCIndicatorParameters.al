table 52178987 "PC Indicator Params"
{
    DrillDownPageId = "PC Indicator Params";
    LookupPageId = "PC Indicator Params";
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
        field(16; "Annual Achievement"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PC Indicator Results".Score where("No." = field("No."),
            "Indicator Code" = field("Indicator Code"), "PC Period" = field("PC Period"), Department = field(Department),
            "Head of Department" = field("Head of Department")));
        }
        field(17; "Q1 Achievement"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PC Indicator Results".Score where("No." = field("No."),
            "Indicator Code" = field("Indicator Code"), "PC Period" = field("PC Period"), Department = field(Department),
            "Head of Department" = field("Head of Department"), "Quater Period" = filter('Q1')));

        }
        field(18; "Q2 Achievement"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PC Indicator Results".Score where("No." = field("No."),
            "Indicator Code" = field("Indicator Code"), "PC Period" = field("PC Period"), Department = field(Department),
            "Head of Department" = field("Head of Department"), "Quater Period" = filter('Q2')));
        }
        field(19; "Q3 Achievement"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PC Indicator Results".Score where("No." = field("No."),
            "Indicator Code" = field("Indicator Code"), "PC Period" = field("PC Period"), Department = field(Department),
            "Head of Department" = field("Head of Department"), "Quater Period" = filter('Q3')));
        }
        field(20; "Q4 Achievement"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PC Indicator Results".Score where("No." = field("No."),
            "Indicator Code" = field("Indicator Code"), "PC Period" = field("PC Period"), Department = field(Department),
            "Head of Department" = field("Head of Department"), "Quater Period" = filter('Q4')));
        }
        field(21; "% Change"; Decimal)
        {

        }
        field(22; "Raw Score"; Decimal)
        {

        }
        field(23; "Weighted Score"; Decimal)
        {

        }
        field(24; "Remarks"; Text[100])
        {

        }
        field(25; "Comments"; Text[250])
        {

        }
    }

    keys
    {
        key(key1; "No.", "Indicator Code", "PC Period", "Department", "Head of Department")
        {

        }
    }
}