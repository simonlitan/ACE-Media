report 52179144 "PRL-Earnings & Deductions rep."
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/PRL-Earnings & Deductions rep..rdl';

    dataset
    {
        dataitem("PRL-Transaction Codes"; "PRL-Transaction Codes")
        {
            PrintOnlyIfDetail = true;
            column(TransCode; "PRL-Transaction Codes"."Transaction Code")
            {
            }
            column(TransaName; "PRL-Transaction Codes"."Transaction Code" + ': ' + "PRL-Transaction Codes"."Transaction Name")
            {
            }
            dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
            {
                DataItemLink = "Transaction Code" = FIELD("Transaction Code");
                dataitem("HRM-Employee C"; "HRM-Employee C")
                {
                    DataItemLink = "No." = FIELD("Employee Code");
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
                    column(PerName; PRLPayrollPeriods."Period Name")
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

                    trigger OnAfterGetRecord()
                    begin
                        Clear(SaccoSh);
                        Clear(SaccoLoanRep);
                        Clear(LoanInt);
                        Clear(XmasSav);
                        Clear(PapoUpesi);
                        Clear(TransAmount);
                        //Shares
                        PRLPeriodTransactions.Reset;
                        PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                        PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Transaction Code", "PRL-Period Transactions"."Transaction Code");
                        PRLPeriodTransactions.SetRange(PRLPeriodTransactions."Payroll Period", datefilter);
                        if PRLPeriodTransactions.Find('-') then begin
                            TransAmount := PRLPeriodTransactions.Amount;
                        end;
                        /*
                      //Loan Repayment
                      PRLPeriodTransactions.RESET;
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code","HRM-Employee C"."No.");
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code",'LBD002');
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period",datefilter);
                      IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                      SaccoLoanRep:=PRLPeriodTransactions.Amount;
                        END;

                      //Loan Interest
                      PRLPeriodTransactions.RESET;
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code","HRM-Employee C"."No.");
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code",'INT001');
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period",datefilter);
                      IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                      LoanInt:=PRLPeriodTransactions.Amount;
                        END;

                      //Xmas Savings
                      PRLPeriodTransactions.RESET;
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code","HRM-Employee C"."No.");
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code",'XMA001');
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period",datefilter);
                      IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                      XmasSav:=PRLPeriodTransactions.Amount;
                        END;

                      //Papo & Upesi
                      PRLPeriodTransactions.RESET;
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Employee Code","HRM-Employee C"."No.");
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Transaction Code",'PAP001');
                      PRLPeriodTransactions.SETRANGE(PRLPeriodTransactions."Payroll Period",datefilter);
                      IF PRLPeriodTransactions.FIND('-') THEN BEGIN
                      PapoUpesi:=PRLPeriodTransactions.Amount;
                        END;

                      */

                        Gtoto := TransAmount;//+PRLEmployerDeductions.Amount;
                        if Gtoto = 0 then CurrReport.Skip else seq := seq + 1;

                    end;
                }

                trigger OnPreDataItem()
                begin
                    "PRL-Period Transactions".SetFilter("PRL-Period Transactions"."Payroll Period", '=%1', datefilter);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Clear(seq);
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
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        PRLPayrollPeriods.Reset;
        PRLPayrollPeriods.SetRange(PRLPayrollPeriods.Closed, false);
        if PRLPayrollPeriods.Find('-') then begin
            datefilter := PRLPayrollPeriods."Date Opened";
        end;

        if CompanyInformation.Get() then
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        Clear(Gtoto);
        Clear("Tot-SaccoSh");
        Clear("Tot-SaccoLoanRep");
        Clear("Tot-LoanInt");
        Clear("Tot-XmasSav");
        Clear("Tot-PapoUpesi");
        Clear(seq);
    end;

    trigger OnPreReport()
    begin
        if datefilter = 0D then Error('Specify the Period Date');
        "PRL-Period Transactions".SETFILTER("PRL-Period Transactions"."Payroll Period", '=%1', datefilter)
    end;

    var
        datefilter: Date;
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        CompanyInformation: Record "Company Information";
        PRLPeriodTransactions: Record "PRL-Period Transactions";
        PRLEmployerDeductions: Record "PRL-Employer Deductions";
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
        TransAmount: Decimal;
}

