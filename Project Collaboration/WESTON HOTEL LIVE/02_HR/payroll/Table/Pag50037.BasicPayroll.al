page 50037 BasicPayroll
{
    Caption = 'BasicPayroll';
    CardPageId = "SalaryCard Transactions";
    DeleteAllowed = true;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "PRL-Salary Card";


    layout
    {

        area(content)
        {
            repeater(General)
            {
                field("Employee Code"; Rec."Employee Code")
                {

                }
                field("Basic Pay"; Rec."Basic Pay")
                {

                }
                field("Pays NHIF"; Rec."Pays NHIF")
                {

                }
                field("Pays NSSF"; Rec."Pays NSSF")
                {

                }
                field("Pays PAYE"; Rec."Pays PAYE")
                {

                }
                field("Period Month"; Rec."Period Month")
                {

                }
                field("Period Year"; Rec."Period Year")
                {

                }
                field("Payroll Period"; Rec."Payroll Period")
                {

                }
                field(Closed; Rec.Closed)
                {

                }

                // field("Cumm BasicPay"; Rec."Cumm BasicPay")
                // {

                // }
                // field("Cumm GrossPay"; Rec."Cumm GrossPay")
                // {

                // }
                // field("Cumm NetPay"; Rec."Cumm NetPay")
                // {

                // }
                // field("Cumm Allowances"; Rec."Cumm Allowances")
                // {

                // }
                // field("Cumm Deductions"; Rec."Cumm Deductions")
                // {

                // }
                // field("Cumm PAYE"; Rec."Cumm PAYE")
                // {

                // }
                // field("Cumm NSSF"; Rec."Cumm NSSF")
                // {

                // }
                // field("Cumm Pension"; Rec."Cumm Pension")
                // {

                // }
                // field("Cumm HELB"; Rec."Cumm HELB")
                // {

                // }
                // field("Cumm Employer Pension"; Rec."Cumm Employer Pension")
                // {

                // }
                // field("Cumm NHIF"; Rec."Cumm NHIF")
                // {

                // }

            }





        }
    }
}

