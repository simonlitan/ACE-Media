report 52179148 "PRL - Pension Combined 2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Payroll/Report/SSR/PRL - Pension Combined 2.rdl';

    dataset
    {
        dataitem(DataItem1000000009; "HRM-Employee C")
        {
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
            column(CompRegNo; CompanyInformation."Registration No.")
            {
            }
            column(pfNo; "HRM-Employee C"."No.")
            {
            }
            column(EmpPin; "HRM-Employee C"."PIN Number")
            {
            }
            column(EmpId; "HRM-Employee C"."ID Number")
            {
            }
            column(FName; "HRM-Employee C"."Last Name")
            {
            }
            column(MName; "HRM-Employee C"."Middle Name")
            {
            }
            column(LName; "HRM-Employee C"."First Name")
            {
            }
            column(EmployeeAmount; PRLPeriodTransactions.Amount)
            {
            }
            column(EmployerAmount; PRLEmployerDeductions.Amount)
            {
            }
            column(PensionEmployer; PensionEmployer)
            {
            }
            column(avc; avc)
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(PensionEmployee; PensionEmployee)
            {
            }
            column(TotalValue; TotalValue)
            {
            }
            column(PerName; PRLPayrollPeriods."Period Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                CLEAR(avc);
                CLEAR(BasicPay);
                CLEAR(PensionEmployer);
                CLEAR(PensionEmployee);
                CLEAR(TotalValue);
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code", 'GPAY');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", datefilter);
                IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                    BasicPay := PRLPeriodTransactions.Amount;
                END;

                PRLTransactionCodes.RESET;
                PRLTransactionCodes.SETFILTER(PRLTransactionCodes."Special Transactions", '%1', PRLTransactionCodes."Special Transactions"::"Defined Contribution");
                IF PRLTransactionCodes.FIND('-') THEN BEGIN
                    REPEAT
                    BEGIN
                        IF PRLTransactionCodes."Transaction Code" IN ['D004'] THEN BEGIN
                            PRLEmployerDeductions.RESET;
                            PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Employee Code", "HRM-Employee C"."No.");
                            PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Transaction Code", 'D004');
                            PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Payroll Period", datefilter);
                            IF PRLEmployerDeductions.FIND('-') THEN BEGIN
                                PensionEmployer := PRLEmployerDeductions.Amount;
                            END;

                            PRLPeriodTransactions.RESET;
                            PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                            PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code", PRLTransactionCodes."Transaction Code");
                            PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", datefilter);
                            IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                                PensionEmployee := PRLPeriodTransactions.Amount;
                            END;
                        END;

                        IF PRLTransactionCodes."Transaction Code" = 'D-916' THEN BEGIN
                            PRLPeriodTransactions.RESET;
                            PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                            PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code", 'D-916');
                            PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", datefilter);
                            IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                                avc := PRLPeriodTransactions.Amount;
                            END;
                        END;
                    END;
                    UNTIL PRLTransactionCodes.NEXT = 0;
                END;
                TotalValue := avc + PensionEmployee + PensionEmployer;
                IF TotalValue = 0 THEN CurrReport.SKIP;
                IF PensionEmployee = 0 THEN CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                //
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

    trigger OnPreReport()
    begin
        //IF groupFilter= '' THEN groupFilter:= 'All Employees';
        PRLPayrollPeriods.RESET;
        PRLPayrollPeriods.SETRANGE(PRLPayrollPeriods."Date Opened", datefilter);
        IF PRLPayrollPeriods.FIND('-') THEN BEGIN
            //  datefilter:=PRLPayrollPeriods."Date Opened";
        END;
    end;

    var
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        CompanyInformation: Record "Company Information";
        "HRM-Employee C": Record "HRM-Employee C";
        PRLPeriodTransactions: Record "PRL-Period Transactions";
        PRLEmployerDeductions: Record "PRL-Employer Deductions";
        compName: Code[150];
        avc: Decimal;
        BasicPay: Decimal;
        PRLTransactionCodes: Record "PRL-Transaction Codes";
        PensionEmployer: Decimal;
        PensionEmployee: Decimal;
        TotalValue: Decimal;
}

