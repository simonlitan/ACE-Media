report 62840 "PRL-Payroll Cost Analysis"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/report/SSR/PRL-Payroll Cost Analysis.rdl';

    dataset
    {
        dataitem("PRL-Variance Trans. Code Buff"; "PRL-Variance Trans. Code Buff")
        {
            column(CompName; compInfo.Name)
            {
            }
            column(Address1; compInfo.Address)
            {
            }
            column(Address2; compInfo."Address 2")
            {
            }
            column(Phone1; compInfo."Phone No.")
            {
            }
            column(Phone2; compInfo."Phone No. 2")
            {
            }
            column(pics; compInfo.Picture)
            {
            }
            column(Emails; compInfo."E-Mail")
            {
            }
            column(Homep; compInfo."Home Page")
            {
            }
            column(DateFilter; PeriFilter)
            {
            }
            column(TransCode; "PRL-Variance Trans. Code Buff"."Transaction Code")
            {
            }
            column(EmpCode; "PRL-Variance Trans. Code Buff"."Emp. Code")
            {
            }
            column(TransName; "PRL-Variance Trans. Code Buff"."Transaction Name")
            {
            }
            column(EmpName; "PRL-Variance Trans. Code Buff"."Emp. Name")
            {
            }
            column(CurrAmount; "PRL-Variance Trans. Code Buff"."Current Amount")
            {
            }
            column(PrevAmount; "PRL-Variance Trans. Code Buff"."Previous Amount")
            {
            }
            column(CurrPeriod; PRLPayrollPeriodsCurr."Period Name")
            {
            }
            column(PrevPeriod; PRLPayrollPeriodsPrev."Period Name")
            {
            }
            column(variance; "PRL-Variance Trans. Code Buff"."Current Amount" - "PRL-Variance Trans. Code Buff"."Previous Amount")
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF "PRL-Variance Trans. Code Buff"."Current Amount" = "PRL-Variance Trans. Code Buff"."Previous Amount" THEN CurrReport.SKIP;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PeriodFilter; PeriFilter)
                {
                    Caption = 'Period Filter';
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
        compInfo.RESET;
        IF compInfo.FIND('-') THEN BEGIN
            compInfo.CALCFIELDS(Picture);
        END;

        PRLPayrollPeriods.RESET;
        PRLPayrollPeriods.SETRANGE(Closed, FALSE);
        IF PRLPayrollPeriods.FIND('-') THEN BEGIN
            PeriFilter := PRLPayrollPeriods."Date Opened";
        END ELSE
            ERROR('No Open period in the filters');
    end;

    trigger OnPreReport()
    begin
        PRLVarianceTransCodeBuff2.RESET;
        IF PRLVarianceTransCodeBuff2.FIND('-') THEN PRLVarianceTransCodeBuff2.DELETEALL;
        IF PeriFilter = 0D THEN ERROR('Invalid date specified');
        PRLPayrollPeriodsCurr.RESET;
        PRLPayrollPeriodsCurr.SETRANGE("Date Opened", PeriFilter);
        IF PRLPayrollPeriodsCurr.FIND('-') THEN BEGIN
            CurrentMonth := PRLPayrollPeriodsCurr."Period Month";
            CurrentYear := PRLPayrollPeriodsCurr."Period Year";

            IF CurrentMonth = 1 THEN BEGIN
                PrevMonth := 12;
                PrevYear := CurrentYear - 1;
            END ELSE BEGIN
                PrevMonth := CurrentMonth - 1;
                PrevYear := CurrentYear;
            END;
        END;

        PRLPayrollPeriodsPrev.RESET;
        PRLPayrollPeriodsPrev.SETRANGE("Period Month", PrevMonth);
        PRLPayrollPeriodsPrev.SETRANGE("Period Year", PrevYear);
        IF PRLPayrollPeriodsPrev.FIND('-') THEN BEGIN
        END;
        // Curent Period data
        PRLPeriodTransactionsCurr.RESET;
        PRLPeriodTransactionsCurr.SETRANGE("Period Month", CurrentMonth);
        PRLPeriodTransactionsCurr.SETRANGE("Period Year", CurrentYear);
        PRLPeriodTransactionsCurr.SETFILTER("Group Order", '<>%1', 6);
        PRLPeriodTransactionsCurr.SETFILTER("Transaction Code", '<>%1', 'TOT-DED');
        IF PRLPeriodTransactionsCurr.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                HRMEmployeeD.RESET;
                HRMEmployeeD.SETRANGE("No.", PRLPeriodTransactionsCurr."Employee Code");
                IF HRMEmployeeD.FIND('-') THEN BEGIN
                END;

                PRLVarianceTransCodeBuff.RESET;
                PRLVarianceTransCodeBuff.SETRANGE("Transaction Code", PRLPeriodTransactionsCurr."Transaction Code");
                PRLVarianceTransCodeBuff.SETRANGE("Emp. Code", PRLPeriodTransactionsCurr."Employee Code");
                IF NOT PRLVarianceTransCodeBuff.FIND('-') THEN BEGIN
                    // Insert Here
                    PRLVarianceTransCodeBuff.INIT;
                    PRLVarianceTransCodeBuff."Transaction Code" := PRLPeriodTransactionsCurr."Transaction Code";
                    PRLVarianceTransCodeBuff."Transaction Name" := PRLPeriodTransactionsCurr."Transaction Name";
                    PRLVarianceTransCodeBuff."Emp. Code" := PRLPeriodTransactionsCurr."Employee Code";
                    PRLVarianceTransCodeBuff."Emp. Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                    PRLVarianceTransCodeBuff."Current Amount" := PRLPeriodTransactionsCurr.Amount;
                    PRLVarianceTransCodeBuff."Previous Amount" := 0;
                    PRLVarianceTransCodeBuff."Current Month" := CurrentMonth;
                    PRLVarianceTransCodeBuff."Previous Month" := PrevMonth;
                    PRLVarianceTransCodeBuff."Current Year" := CurrentYear;
                    PRLVarianceTransCodeBuff."Previous Year" := PrevYear;
                    PRLVarianceTransCodeBuff.INSERT;
                    //Pension Employer Contribution
                    if PRLVarianceTransCodeBuff."Transaction Code" = 'D004' then begin
                        PRLVarianceTransCodeBuff3.INIT;
                        PRLVarianceTransCodeBuff3."Transaction Code" := 'PensEmp';
                        PRLVarianceTransCodeBuff3."Transaction Name" := 'P Pension Employer Contribution';
                        PRLVarianceTransCodeBuff3."Emp. Code" := PRLPeriodTransactionsCurr."Employee Code";
                        PRLVarianceTransCodeBuff3."Emp. Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                        PRLVarianceTransCodeBuff3."Current Amount" := 2 * PRLPeriodTransactionsCurr.Amount;
                        PRLVarianceTransCodeBuff3."Previous Amount" := 0;
                        PRLVarianceTransCodeBuff3."Current Month" := CurrentMonth;
                        PRLVarianceTransCodeBuff3."Previous Month" := PrevMonth;
                        PRLVarianceTransCodeBuff3."Current Year" := CurrentYear;
                        PRLVarianceTransCodeBuff3."Previous Year" := PrevYear;
                        PRLVarianceTransCodeBuff3.INSERT;
                    end;
                    //NSSF Employer Contribution
                    if PRLVarianceTransCodeBuff."Transaction Code" = 'NSSF' then begin
                        PRLVarianceTransCodeBuff4.INIT;
                        PRLVarianceTransCodeBuff4."Transaction Code" := 'NSSFEmployer';
                        PRLVarianceTransCodeBuff4."Transaction Name" := 'P NSSF Employer Contribution';
                        PRLVarianceTransCodeBuff4."Emp. Code" := PRLPeriodTransactionsCurr."Employee Code";
                        PRLVarianceTransCodeBuff4."Emp. Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                        PRLVarianceTransCodeBuff4."Current Amount" := PRLPeriodTransactionsCurr.Amount;
                        PRLVarianceTransCodeBuff4."Previous Amount" := 0;
                        PRLVarianceTransCodeBuff4."Current Month" := CurrentMonth;
                        PRLVarianceTransCodeBuff4."Previous Month" := PrevMonth;
                        PRLVarianceTransCodeBuff4."Current Year" := CurrentYear;
                        PRLVarianceTransCodeBuff4."Previous Year" := PrevYear;
                        PRLVarianceTransCodeBuff4.INSERT;
                    end;

                END ELSE BEGIN
                    //PRLVarianceTransCodeBuff."Transaction Code":=PRLPeriodTransactionsCurr."Transaction Code";
                    PRLVarianceTransCodeBuff."Transaction Name" := PRLPeriodTransactionsCurr."Transaction Name";
                    //PRLVarianceTransCodeBuff."Emp. Code":=PRLPeriodTransactionsCurr."Employee Code";
                    PRLVarianceTransCodeBuff."Emp. Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                    PRLVarianceTransCodeBuff."Current Amount" := PRLPeriodTransactionsCurr.Amount;
                    //PRLVarianceTransCodeBuff."Previous Amount":=0;
                    PRLVarianceTransCodeBuff.MODIFY;
                END;
            END;
            UNTIL PRLPeriodTransactionsCurr.NEXT = 0;
        END;

        // Insert for Previous
        PRLPeriodTransactionsPrev.RESET;
        PRLPeriodTransactionsPrev.SETRANGE("Period Month", PrevMonth);
        PRLPeriodTransactionsPrev.SETRANGE("Period Year", PrevYear);
        PRLPeriodTransactionsPrev.SETFILTER("Group Order", '<>%1', 6);
        PRLPeriodTransactionsPrev.SETFILTER("Transaction Code", '<>%1', 'TOT-DED');
        IF PRLPeriodTransactionsPrev.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                HRMEmployeeD.RESET;
                HRMEmployeeD.SETRANGE("No.", PRLPeriodTransactionsPrev."Employee Code");
                IF HRMEmployeeD.FIND('-') THEN BEGIN
                END;
                PRLVarianceTransCodeBuff.RESET;
                PRLVarianceTransCodeBuff.SETRANGE("Transaction Code", PRLPeriodTransactionsPrev."Transaction Code");
                PRLVarianceTransCodeBuff.SETRANGE("Emp. Code", PRLPeriodTransactionsPrev."Employee Code");
                IF NOT PRLVarianceTransCodeBuff.FIND('-') THEN BEGIN
                    // Insert Here
                    PRLVarianceTransCodeBuff.INIT;
                    PRLVarianceTransCodeBuff."Transaction Code" := PRLPeriodTransactionsPrev."Transaction Code";
                    PRLVarianceTransCodeBuff."Transaction Name" := PRLPeriodTransactionsPrev."Transaction Name";
                    PRLVarianceTransCodeBuff."Emp. Code" := PRLPeriodTransactionsPrev."Employee Code";
                    PRLVarianceTransCodeBuff."Emp. Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                    PRLVarianceTransCodeBuff."Current Amount" := 0;
                    PRLVarianceTransCodeBuff."Previous Amount" := PRLPeriodTransactionsPrev.Amount;
                    PRLVarianceTransCodeBuff."Current Month" := CurrentMonth;
                    PRLVarianceTransCodeBuff."Previous Month" := PrevMonth;
                    PRLVarianceTransCodeBuff."Current Year" := CurrentYear;
                    PRLVarianceTransCodeBuff."Previous Year" := PrevYear;
                    PRLVarianceTransCodeBuff.INSERT;
                END ELSE BEGIN
                    PRLVarianceTransCodeBuff."Transaction Name" := PRLPeriodTransactionsPrev."Transaction Name";
                    PRLVarianceTransCodeBuff."Emp. Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                    // PRLVarianceTransCodeBuff."Current Amount":=0;
                    PRLVarianceTransCodeBuff."Previous Amount" := PRLPeriodTransactionsPrev.Amount;
                    // PRLVarianceTransCodeBuff."Current Month":=CurrentMonth;
                    // PRLVarianceTransCodeBuff."Previous Month":=PrevMonth;
                    // PRLVarianceTransCodeBuff."Current Year":=CurrentYear;
                    // PRLVarianceTransCodeBuff."Previous Year":=PrevYear;
                    PRLVarianceTransCodeBuff.MODIFY;
                    //Pension Employer previous
                    if PRLVarianceTransCodeBuff."Transaction Code" = 'D004' then begin
                        PRLVarianceTransCodeBuff3.Reset();
                        PRLVarianceTransCodeBuff3.SetRange("Transaction Code", 'PensEmp');
                        PRLVarianceTransCodeBuff3.SetRange("Emp. Code", PRLVarianceTransCodeBuff."Emp. Code");
                        PRLVarianceTransCodeBuff3.SetRange("Previous Month", PrevMonth);
                        PRLVarianceTransCodeBuff3.SetRange("Previous Year", PrevYear);
                        if PRLVarianceTransCodeBuff3.Find('-') then begin
                            PRLVarianceTransCodeBuff3."Previous Amount" := PRLVarianceTransCodeBuff."Previous Amount" * 2;
                            PRLVarianceTransCodeBuff3.Modify();
                        end;

                    END;
                    //NSSF Employer Previous
                    if PRLVarianceTransCodeBuff."Transaction Code" = 'D003' then begin
                        PRLVarianceTransCodeBuff4.Reset();
                        PRLVarianceTransCodeBuff4.SetRange("Transaction Code", 'P N.S.S.F Employer');
                        PRLVarianceTransCodeBuff4.SetRange("Emp. Code", PRLVarianceTransCodeBuff."Emp. Code");
                        PRLVarianceTransCodeBuff4.SetRange("Previous Month", PrevMonth);
                        PRLVarianceTransCodeBuff4.SetRange("Previous Year", PrevYear);
                        if PRLVarianceTransCodeBuff4.Find('-') then begin
                            PRLVarianceTransCodeBuff4."Previous Amount" := PRLVarianceTransCodeBuff."Previous Amount";
                            PRLVarianceTransCodeBuff4.Modify();
                        end;

                    END

                END;


            END;
            UNTIL PRLPeriodTransactionsPrev.NEXT = 0;
        END;
        "PRL-Variance Trans. Code Buff".RESET;
        IF "PRL-Variance Trans. Code Buff".FIND('-') THEN BEGIN
        END;
    end;

    var
        PRLVarianceTransCodeBuff: Record "PRL-Variance Trans. Code Buff";
        PRLVarianceTransCodeBuff2: Record "PRL-Variance Trans. Code Buff";
        PRLVarianceTransCodeBuff3: Record "PRL-Variance Trans. Code Buff";
        PRLVarianceTransCodeBuff4: Record "PRL-Variance Trans. Code Buff";
        PeriFilter: Date;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        PRLPayrollPeriodsCurr: Record "PRL-Payroll Periods";
        PRLPayrollPeriodsPrev: Record "PRL-Payroll Periods";
        PRLPeriodTransactions: Record "PRL-Period Transactions";
        PRLPeriodTransactionsCurr: Record "PRL-Period Transactions";
        PRLPeriodTransactionsPrev: Record "PRL-Period Transactions";
        HRMEmployeeD: Record "HRM-Employee C";
        CurrentMonth: Integer;
        CurrentYear: Integer;
        PrevMonth: Integer;
        PrevYear: Integer;
        CurrentAmount: Integer;
        PrevAmounts: Integer;
        "Emp|No": Integer;
        EmpName: Integer;
        compInfo: Record "Company Information";
}

