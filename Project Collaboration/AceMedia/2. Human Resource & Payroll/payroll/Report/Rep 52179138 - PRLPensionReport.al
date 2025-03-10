report 52179138 "PRL-Pension Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/Pension Report.rdl';
    dataset
    {
        dataitem(PRLPeriodTransactions; "PRL-Period Transactions")
        {
            DataItemTableView = where("Group Order" = filter(14));
            RequestFilterFields = "Payroll Period";
            column(Logo; CompInfo.Picture)
            {
            }
            column(CompanyName; CompInfo.Name)
            {
            }
            column(address; CompInfo.Address)
            { }
            column(FullName; FullName)
            {
            }
            column(Amount; Amount)
            {
            }
            column(Payroll_Period; "Payroll Period")
            { }
            column(DepartmentCode; "Department Code")
            {
            }
            column(EmpBalance; "Emp Balance")
            {
            }
            column(EmployeeCode; "Employee Code")
            {
            }
            column(EmployeeCategory; "Employee Category")
            {
            }
            trigger OnAfterGetRecord()

            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee Code");
                if Employee.Find('-') then
                    FullName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    trigger OnPreReport()
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture);
    end;

    var
        Employee: Record "HRM-Employee C";
        FullName: Text;
        CompInfo: Record "Company Information";
}