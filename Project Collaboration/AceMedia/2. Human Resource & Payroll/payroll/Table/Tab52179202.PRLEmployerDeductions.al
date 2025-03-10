table 52179202 "PRL-Employer Deductions"
{
    DrillDownPageID = "PRL-Emp. Deductions";
    LookupPageID = "PRL-Emp. Deductions";

    fields
    {
        field(1; "Employee Code"; Code[30])
        {
        }
        field(2; "Transaction Code"; Code[20])
        {
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Period Month"; Integer)
        {
        }
        field(5; "Period Year"; Integer)
        {
        }
        field(6; "Payroll Period"; Date)
        {
            TableRelation = "PRL-Payroll Periods"."Date Opened";
        }
        field(7; "Payroll Code"; Code[20])
        {
            TableRelation = "PRL-Payroll Type";
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Period Month", "Period Year", "Payroll Period")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

