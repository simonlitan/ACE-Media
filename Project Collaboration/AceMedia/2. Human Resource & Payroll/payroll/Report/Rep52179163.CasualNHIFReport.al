report 52179163 "Casual - NHIF Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Payroll/Report/SSR/CasualNHIFReport.rdl';

    dataset
    {
        dataitem(PerTrans; "PRL-Casual Period Transactions")
        {
            DataItemTableView = WHERE("Transaction Code" = FILTER('NHIF'));
            PrintOnlyIfDetail = true;
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
            /* column(CompPin; CompanyInformation."Company P.I.N")
            {
            } */
            column(Pic; CompanyInformation.Picture)
            {
            }
            column(CompRegNo; CompanyInformation."Registration No.")
            {
            }
            dataitem("HRM-Employee C"; "HRM-Employee C")
            {
                DataItemLink = "No." = FIELD("Employee Code");
                DataItemTableView = WHERE("Employee Category" = FILTER('CASUAL' | 'CASUALS'));
                column(pfNo; "HRM-Employee C"."No.")
                {
                }
                column(EmpPin; "HRM-Employee C"."PIN Number")
                {
                }
                column(EmpId; "HRM-Employee C"."ID Number")
                {
                }
                column(LName; "HRM-Employee C"."Last Name")
                {
                }
                column(MName; "HRM-Employee C"."Middle Name")
                {
                }
                column(FName; "HRM-Employee C"."First Name")
                {
                }
                column(EmployeeAmount; PRLPeriodTransactions.Amount)
                {
                }
                column(EmployerAmount; PRLEmployerDeductions.Amount)
                {
                }
                column(NHIFNo; "HRM-Employee C"."NHIF No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    PRLEmployerDeductions.RESET;
                    PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Employee Code", "HRM-Employee C"."No.");
                    PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Transaction Code", 'NHIF');
                    PRLEmployerDeductions.SETRANGE(PRLEmployerDeductions."Payroll Period", datefilter);
                    PRLEmployerDeductions.SETRANGE("Current Instalment", NoofInstalments);
                    IF PRLEmployerDeductions.FIND('-') THEN BEGIN
                    END;

                    PRLPeriodTransactions.RESET;
                    PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                    PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code", 'NHIF');
                    PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", datefilter);
                    PRLEmployerDeductions.SETRANGE("Current Instalment", NoofInstalments);
                    IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                    END ELSE
                        CurrReport.SKIP;

                    Gtoto := PRLPeriodTransactions.Amount;//+PRLEmployerDeductions.Amount;
                end;
            }

            trigger OnPreDataItem()
            begin
                IF datefilter = 0D THEN ERROR('Specify the Period Date');
                CLEAR(Gtoto);
                PerTrans.SETFILTER(PerTrans."Payroll Period", '=%1', datefilter);

                PerTrans.SETFILTER(PerTrans."Current Instalment", '=%1', NoofInstalments);
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
                    TableRelation = "PRL-Casual Payroll Periods"."Date Openned";
                    ApplicationArea = All;
                }
                field(NoofInstalments; NoofInstalments)
                {
                    Caption = 'NoOfInstalments';
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
        objPeriod.RESET;
        objPeriod.SETRANGE(objPeriod.Closed, FALSE);
        IF objPeriod.FIND('-') THEN BEGIN
            datefilter := objPeriod."Date Openned";
            NoofInstalments := objPeriod."Current Instalment";
            PeriodName := objPeriod."Period Name";
        END;
        IF CompanyInformation.GET() THEN
            CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
    end;

    var
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Casual Payroll Periods";
        CompanyInformation: Record "Company Information";
        PRLPeriodTransactions: Record "PRL-Casual Period Transactions";
        PRLEmployerDeductions: Record "PRL-Casual Employer Deductions";
        Gtoto: Decimal;
        PRLTransactionCodes: Record "PRL-Transaction Codes";
        PeriodName: Code[20];
        objPeriod: Record "PRL-Casual Payroll Periods";
        NoofInstalments: Integer;
}

