table 50050 "Payroll Journal Lines"
{
    LookupPageId = "Payroll Journal Lines";
    DrillDownPageId = "Payroll Journal Lines";

    fields
    {
        field(1; "Transaction Code"; code[30])
        {

        }
        field(2; "Document No."; code[50])
        {

        }
        field(3; "Payroll Period"; date)
        {

        }
        field(4; "Transaction Name"; text[100])
        {

        }
        field(5; Amount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"), "Transaction Code" = field("Transaction Code")));
        }
        field(6; "Posted"; Boolean)
        {

        }
        field(7; "GL Account"; code[30])
        {
            TableRelation = "G/L Account";
        }
        field(8; "Bal Account"; Code[30])
        {
            TableRelation = "G/L Account";
        }
        field(9; "Group Text"; Text[100])
        {

        }
        field(12; "Line No."; integer)
        {

        }
    }
    keys
    {
        key(key1; "Transaction Code", "Document No.", "Payroll Period")
        {

        }
    }
    var
        PeriodTrans: Record "PRL-Period Transactions";
}