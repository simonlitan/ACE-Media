/// <summary>
/// Report "Gratuity" (ID 51929).
/// </summary>
report 52179094 Gratuity
{
    Caption = 'Gratuity';
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/Gratuity Report.rdl';

    dataset
    {
        dataitem(PRLPeriodTransactions;
        "PRL-Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = const('GRATUITY'));

            column(Logo; CompInfo.Picture)

            {
            }
            column(CompanyName; CompInfo.Name)

            {
            }
            column(address; CompInfo.Address)

            {
            }
            column(FullName; FullName)

            {
            }
            column(Amount; Amount)

            {
            }
            column(DepartmentCode; "Department Code")

            {
            }
            column(Payroll_Period; "Payroll Period")

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
            column(Basicpay; Basicpay)
            {

            }
            column(PerName; PerName)
            {

            }
            trigger OnAfterGetRecord()
            begin
                Basicpay := GetBasicPay(PRLPeriodTransactions."Employee Code");
                Employee.Reset();
                Employee.SetRange("No.", "Employee Code");
                if Employee.Find('-') then FullName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                field(DateFil; datefilter)
                {
                    ApplicationArea = all;
                    Caption = 'Date Filter';
                    TableRelation = "PRL-Payroll Periods"."Date Opened";
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
        SelectedPeriod := datefilter;
        PRLPayrollPeriods.RESET;
        PRLPayrollPeriods.SETRANGE(PRLPayrollPeriods."Date Opened", datefilter);
        IF PRLPayrollPeriods.FIND('-') THEN BEGIN
            PerName := PRLPayrollPeriods."Period Name";

        END;
        PRLPeriodTransactions.SETFILTER(PRLPeriodTransactions."Payroll Period", '=%1', datefilter)
    end;

    trigger OnInitReport()
    begin
        PRLPayrollPeriods.RESET;
        PRLPayrollPeriods.SETRANGE(PRLPayrollPeriods.Closed, FALSE);
        IF PRLPayrollPeriods.FIND('-') THEN BEGIN
            datefilter := PRLPayrollPeriods."Date Opened";
        END;
        PRLPeriodTransactions.SETFILTER(PRLPeriodTransactions."Payroll Period", '=%1', datefilter)
    end;

    var
        Employee: Record "HRM-Employee C";
        FullName: Text;
        CompInfo: Record "Company Information";
        periodtrans: record "PRL-Period Transactions";
        Basicpay: Decimal;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        datefilter: date;
        SelectedPeriod: date;
        PerName: text[50];

    local procedure GetBasicPay(EmpCode: code[20]) Basicpay: Decimal;
    begin
        periodtrans.SetRange("Employee Code", EmpCode);
        periodtrans.SetRange("Transaction Code", 'BPAY');
        periodtrans.SetRange("Payroll Period", datefilter);
        IF periodtrans.FindSet(TRUE, TRUE) THEN BEGIN
            repeat
                Basicpay := periodtrans.Amount;
            until periodtrans.Next() = 0
        END;

    end;


}
