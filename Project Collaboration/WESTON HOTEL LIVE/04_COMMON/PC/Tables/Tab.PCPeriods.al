table 52178984 "PC Periods"
{
    DrillDownPageId = "PC Periods";
    LookupPageId = "PC Periods";
    fields
    {
        field(1; "PC Period"; code[30])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(2; "Weight"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PC Indicator Params".Weight where("PC Period" = field("PC Period")));
        }
        field(10; "Description"; Text[200])
        {

        }
    }
}