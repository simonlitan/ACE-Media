report 52179164 "Casual - NSSF Report (A)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Payroll/Report/SSR/CasualNSSFReportA.rdl';

    dataset
    {
        dataitem("HRM-Employee C"; "HRM-Employee C")
        {
            DataItemTableView = WHERE("Employee Category" = FILTER('CASUALS' | 'CASUAL'));
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
            column(PerName; PRLPayrollPeriods."Period Name" + ' (' + FORMAT(NoOfInstalments) + ')')
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
            column(NHIFNo; "HRM-Employee C"."NHIF No.")
            {
            }
            column(Gtot; Gtoto)
            {
            }
            column(SaccoSh; SaccoSh)
            {
            }
            column(SaccoLoanRep; SaccoLoanRep)
            {
            }
            column(LoanInt; LoanInt)
            {
            }
            column(XmasSav; XmasSav)
            {
            }
            column(PapoUpesi; PapoUpesi)
            {
            }
            column(region; "HRM-Employee C".Region)
            {
            }
            column(seq; seq)
            {
            }
            column(NssFNo; "HRM-Employee C"."NSSF No.")
            {
            }
            column(CurrGross; CurrGross)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CLEAR(SaccoSh);
                CLEAR(SaccoLoanRep);
                CLEAR(LoanInt);
                CLEAR(XmasSav);
                CLEAR(PapoUpesi);
                CLEAR(CurrGross);
                CLEAR(NSSFAmount);
                //Shares
                PRLPeriodTransactions.RESET;
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Name", 'NSSF');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code", 'DEFCON');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Group Text", 'TAXATION');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", datefilter);
                //PRLPeriodTransactions.SETRANGE("Current Instalment",NoOfInstalments);
                IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                    NSSFAmount := PRLPeriodTransactions.Amount;
                END;

                //Gross
                PRLPeriodTransactions.RESET;
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code", 'GPAY');
                PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period", datefilter);
                //PRLPeriodTransactions.SETRANGE("Current Instalment",NoOfInstalments);
                IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                    CurrGross := PRLPeriodTransactions.Amount;
                END;

                Gtoto := NSSFAmount;
                IF Gtoto = 0 THEN CurrReport.SKIP ELSE seq := seq + 1;
            end;

            trigger OnPreDataItem()
            begin
                objPeriod.RESET;
                objPeriod.SETRANGE(objPeriod."Date Openned", datefilter);
                IF objPeriod.FIND('-') THEN BEGIN
                    NoOfInstalments := objPeriod."Current Instalment";
                    PeriodName := objPeriod."Period Name";
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
                    TableRelation = "PRL-Casual Payroll Periods"."Date Openned";
                    ApplicationArea = All;
                }
                field(NoOfInstalments; NoOfInstalments)
                {
                    Caption = 'instalment';
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
            NoOfInstalments := objPeriod."Current Instalment";
            PeriodName := objPeriod."Period Name";
        END;
        IF CompanyInformation.GET() THEN
            CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
        CLEAR(Gtoto);
        CLEAR("Tot-SaccoSh");
        CLEAR("Tot-SaccoLoanRep");
        CLEAR("Tot-LoanInt");
        CLEAR("Tot-XmasSav");
        CLEAR("Tot-PapoUpesi");
        CLEAR(seq);
    end;

    trigger OnPreReport()
    begin
        IF datefilter = 0D THEN ERROR('Specify the Period Date');
    end;

    var
        NoOfInstalments: Integer;
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Casual Payroll Periods";
        CompanyInformation: Record "Company Information";
        PRLPeriodTransactions: Record "PRL-Casual Period Transactions";
        PRLEmployerDeductions: Record "PRL-Casual Employer Deductions";
        Gtoto: Decimal;
        PRLTransactionCodes: Record "PRL-Transaction Codes";
        SaccoSh: Decimal;
        SaccoLoanRep: Decimal;
        LoanInt: Decimal;
        XmasSav: Decimal;
        PapoUpesi: Decimal;
        "Tot-SaccoSh": Decimal;
        "Tot-SaccoLoanRep": Decimal;
        "Tot-LoanInt": Decimal;
        "Tot-XmasSav": Decimal;
        "Tot-PapoUpesi": Decimal;
        HelbAm: Decimal;
        seq: Integer;
        NSSFAmount: Decimal;
        CurrGross: Decimal;
        objPeriod: Record "PRL-Casual Payroll Periods";
        PeriodName: Code[20];
}

