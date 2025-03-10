table 52178988 "PC Indicator Name"
{
    DrillDownPageId = "PC Indicator Names";
    LookupPageId = "PC Indicator Names";
    fields
    {
        field(1; "Indicator Code"; code[30])
        {

        }
        field(2; "Description"; Text[200])
        {

        }
        field(3; "Department Code"; code[50])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(4; "Department Name"; Text[100])
        {

        }
        field(5; "Head of Department"; code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(6; "Indicator Total weight"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PC Indicator Params".Weight where("PC Period" = field("PC Period"),
             "Indicator Code" = field("Indicator Code")));
        }
        field(7; "PC Period"; code[30])
        {
            TableRelation = "G/L Budget Name".Name;
        }
    }

    keys
    {
        key(key1; "Indicator Code", "PC Period", "Department Code", "Head of Department")
        {

        }
    }
}