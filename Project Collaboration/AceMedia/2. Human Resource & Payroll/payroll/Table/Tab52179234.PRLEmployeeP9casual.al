table 52179234 "PRL-Employee P9 casual"
{
    DrillDownPageID = "PRL-Employee History";
    LookupPageID = "PRL-Employee History";

    fields
    {
        field(1; "Employee Code"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
        field(2; "Basic Pay"; Decimal)
        {
        }
        field(3; Allowances; Decimal)
        {
        }
        field(4; Benefits; Decimal)
        {
        }
        field(5; "Value Of Quarters"; Decimal)
        {
        }
        field(6; "Defined Contribution"; Decimal)
        {
        }
        field(7; "Owner Occupier Interest"; Decimal)
        {
        }
        field(8; "Gross Pay"; Decimal)
        {
        }
        field(9; "Taxable Pay"; Decimal)
        {
        }
        field(10; "Tax Charged"; Decimal)
        {
        }
        field(11; "Insurance Relief"; Decimal)
        {
        }
        field(12; "Tax Relief"; Decimal)
        {
        }
        field(13; PAYE; Decimal)
        {
        }
        field(14; NSSF; Decimal)
        {
        }
        field(15; NHIF; Decimal)
        {
        }
        field(16; Deductions; Decimal)
        {
        }
        field(17; "Net Pay"; Decimal)
        {
        }
        field(18; "Period Month"; Integer)
        {
        }
        field(19; "Period Year"; Integer)
        {
        }
        field(20; "Payroll Period"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(21; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(22; Pension; Decimal)
        {
        }
        field(23; HELB; Decimal)
        {
        }
        field(24; "Payroll Code"; Code[20])
        {
            TableRelation = "PRL-Payroll Type";
        }
        field(25; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Payroll Period")
        {
            SumIndexFields = "Basic Pay", "Gross Pay", "Net Pay", Allowances, Deductions, PAYE, NSSF, NHIF;
        }
    }

    fieldgroups
    {
    }
}

