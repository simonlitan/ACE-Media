report 52179147 "PRL-Pension Scheme Employer"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/report/ssr/PRLPensionSchemeEmployer.rdl';

    dataset
    {
        dataitem(DataItem1000000000; "PRL-Transaction Codes")
        {
            DataItemTableView = WHERE("Special Transactions" = FILTER("Defined Contribution"));
            column(CompName; CompanyInformation.Name)
            {
            }
            column(CompAddress; CompanyInformation.Address)
            {
            }
            column(CompPhone1; CompanyInformation."Phone No.")
            {
            }
            column(CompPhone2; CompanyInformation."Phone No. 2")
            {
            }
            column(CompEmail; CompanyInformation."E-Mail")
            {
            }
            column(CompPage; CompanyInformation."Home Page")
            {
            }
            column(CompPin; CompanyInformation."VAT Registration No.")
            {
            }
            column(Pic; CompanyInformation.Picture)
            {
            }
            column(CompRegNo; CompanyInformation."VAT Registration No.")
            {
            }
            column(PerName; PRLPayrollPeriods."Period Name")
            {
            }
            column(groupFilter; groupFilter)
            {
            }
            dataitem("HRM-Employee (D)"; "HRM-Employee C")
            {
                column(pfNo; "HRM-Employee (D)"."No.")
                {
                }
                column(EmpPin; "HRM-Employee (D)"."PIN Number")
                {
                }
                column(EmpId; "HRM-Employee (D)"."ID Number")
                {
                }
                column(FName; "HRM-Employee (D)"."Last Name")
                {
                }
                column(MName; "HRM-Employee (D)"."Middle Name")
                {
                }
                column(LName; "HRM-Employee (D)"."First Name")
                {
                }
                column(EmployeeAmount; PRLPeriodTransactions.Amount)
                {
                }
                column(EmployerAmount; PRLEmployerDeductions.Amount)
                {
                }
                column(Tot; Gtoto)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PRLEmployerDeductions.RESET;
                    PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Employee Code", "HRM-Employee (D)"."No.");
                    PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Transaction Code", "PRL-Transaction Codes"."Transaction Code");
                    PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Payroll Period", datefilter);
                    IF PRLEmployerDeductions.FIND('-') THEN BEGIN
                    END;

                    PRLPeriodTransactions.RESET;
                    PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                    PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code", "PRL-Transaction Codes"."Transaction Code");
                    PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", datefilter);
                    IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                    END ELSE
                        CurrReport.SKIP;

                    Gtoto := PRLEmployerDeductions.Amount;//PRLPeriodTransactions.Amount+PRLEmployerDeductions.Amount;

                    IF PRLEmployerDeductions.Amount = 0 THEN CurrReport.SKIP;
                end;
            }

            trigger OnPreDataItem()
            begin
                IF datefilter = 0D THEN ERROR('Specify the Period Date');
                CLEAR(Gtoto);
                PRLPayrollPeriods.RESET;
                PRLPayrollPeriods.SETRANGE(PRLPayrollPeriods."Date Opened", datefilter);
                IF PRLPayrollPeriods.FIND('-') THEN BEGIN
                    // datefilter:=PRLPayrollPeriods."Date Opened";
                END;
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
                    Caption = 'Date Filter';
                    TableRelation = "PRL-Payroll Periods"."Date Opened";
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        PRLPayrollPeriods.RESET;
        PRLPayrollPeriods.SETRANGE(PRLPayrollPeriods.Closed, FALSE);
        IF PRLPayrollPeriods.FIND('-') THEN BEGIN
            datefilter := PRLPayrollPeriods."Date Opened";
        END;

        IF CompanyInformation.GET() THEN
            CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
    end;

    var
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        CompanyInformation: Record "Company Information";
        PRLPeriodTransactions: Record "PRL-Employer Deductions";
        PRLEmployerDeductions: Record "PRL-Employer Deductions";
        "PRL-Transaction Codes": record "PRL-Transaction Codes";
        Gtoto: Decimal;
        groupFilter: Code[20];
}

