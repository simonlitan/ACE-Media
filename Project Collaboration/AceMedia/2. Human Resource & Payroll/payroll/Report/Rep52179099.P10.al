/// <summary>
/// Report "P10" (ID 50001).
/// </summary>
report 52179099 P10
{
    DefaultLayout = RDLC;
    RDLCLayout = './Payroll/Report/SSR/P.10.rdl';

    dataset
    {
        dataitem(DataItem1; "HRM-Employee C")
        {
            column(PrintBy; 'PRINTED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(CheckedBy; 'CHECKED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(VerifiedBy; 'VERIFIED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(ApprovedBy; 'APPROVED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(BasicPayLbl; 'BASIC PAY')
            {
            }
            column(payelbl; 'PAYE.')
            {
            }
            column(nssflbl; 'NSSF')
            {
            }
            column(nhiflbl; 'NHIF')
            {
            }
            column(Netpaylbl; 'Net Pay')
            {
            }
            column(payeamount; payeamount)
            {
            }
            column(nssfam; nssfam)
            {
            }
            column(nhifamt; nhifamt)
            {
            }
            column(NetPay; NetPay)
            {
            }
            column(pic; info.Picture)
            {
            }
            column(PensionTotal; PensionTotal)
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(periods; 'EARNINGS SUMMARY for ' + FORMAT(periods, 0, 4))
            {
            }
            column(empName; "No." + ': ' + "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(empName1; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(resident; Resident)
            {
            }
            column(TransName_1_1; TransName[1, 1])
            {
            }
            column(TransName_1_2; TransName[1, 2])
            {
            }
            column(TransName_1_3; TransName[1, 3])
            {
            }
            column(TransName_1_4; TransName[1, 4])
            {
            }
            column(TransName_1_5; TransName[1, 5])
            {
            }
            column(TransName_1_6; TransName[1, 6])
            {
            }
            column(TransName_1_7; TransName[1, 7])
            {
            }
            column(TransName_1_8; TransName[1, 8])
            {
            }
            column(TransName_1_9; TransName[1, 9])
            {
            }
            column(TransName_1_10; TransName[1, 10])
            {
            }
            column(TransName_1_11; TransName[1, 11])
            {
            }
            column(TransName_1_12; TransName[1, 12])
            {
            }
            column(TransName_1_13; TransName[1, 13])
            {
            }
            column(TransName_1_14; TransName[1, 14])
            {
            }
            column(TransName_1_15; TransName[1, 15])
            {
            }
            column(TransName_1_16; TransName[1, 16])
            {
            }
            column(TransName_1_17; TransName[1, 17])
            {
            }
            column(TransName_1_18; TransName[1, 18])
            {
            }
            column(TransName_1_19; TransName[1, 19])
            {
            }
            column(TransName_1_20; TransName[1, 20])
            {
            }
            column(TransName_1_21; TransName[1, 21])
            {
            }
            column(TransName_1_22; TransName[1, 22])
            {
            }
            column(TransName_1_23; TransName[1, 23])
            {
            }
            column(TransName_1_24; TransName[1, 24])
            {
            }
            column(TransName_1_25; TransName[1, 25])
            {
            }
            column(TransName_1_26; TransName[1, 26])
            {
            }
            column(TransName_1_27; TransName[1, 27])
            {
            }
            column(TransName_1_28; TransName[1, 28])
            {
            }
            column(TranscAmount_1_1; TranscAmount[1, 1])
            {
            }
            column(TranscAmount_1_2; TranscAmount[1, 2])
            {
            }
            column(TranscAmount_1_3; TranscAmount[1, 3])
            {
            }
            column(TranscAmount_1_4; TranscAmount[1, 4])
            {
            }
            column(TranscAmount_1_5; TranscAmount[1, 5])
            {
            }
            column(TranscAmount_1_6; TranscAmount[1, 6])
            {
            }
            column(TranscAmount_1_7; TranscAmount[1, 7])
            {
            }
            column(TranscAmount_1_8; TranscAmount[1, 8])
            {
            }
            column(TranscAmount_1_9; TranscAmount[1, 9])
            {
            }
            column(TranscAmount_1_10; TranscAmount[1, 10])
            {
            }
            column(TranscAmount_1_11; TranscAmount[1, 11])
            {
            }
            column(TranscAmount_1_12; TranscAmount[1, 12])
            {
            }
            column(TranscAmount_1_13; TranscAmount[1, 13])
            {
            }
            column(TranscAmount_1_14; TranscAmount[1, 14])
            {
            }
            column(TranscAmount_1_15; TranscAmount[1, 15])
            {
            }
            column(TranscAmount_1_16; TranscAmount[1, 16])
            {
            }
            column(TranscAmount_1_17; TranscAmount[1, 17])
            {
            }
            column(TranscAmount_1_18; TranscAmount[1, 18])
            {
            }
            column(TranscAmount_1_19; TranscAmount[1, 19])
            {
            }
            column(TranscAmount_1_20; TranscAmount[1, 20])
            {
            }
            column(TranscAmount_1_21; TranscAmount[1, 21])
            {
            }
            column(TranscAmount_1_22; TranscAmount[1, 22])
            {
            }
            column(TranscAmount_1_23; TranscAmount[1, 23])
            {
            }
            column(TranscAmount_1_24; TranscAmount[1, 24])
            {
            }
            column(TranscAmount_1_25; TranscAmount[1, 25])
            {
            }
            column(TranscAmount_1_26; TranscAmount[1, 26])
            {
            }
            column(TranscAmount_1_27; TranscAmount[1, 27])
            {
            }
            column(TranscAmount_1_28; TranscAmount[1, 28])
            {
            }
            column(PINNumber_HRMEmployeeD; "HRM-Employee (d)"."PIN Number")
            {
            }
            column(personalRelief; personalRelief)
            {
            }
            column(InsrRelief; InsrRelief)
            {
            }
            column(paye; paye)
            {
            }
            column(TotalAllowance; TotalAllowance)
            {
            }

            trigger OnAfterGetRecord()
            begin

                TransCount := 0;
                showdet := TRUE;
                NetPay := 0;
                BasicPay := 0;
                CLEAR(TranscAmount);
                payeamount := 0;
                nssfam := 0;
                nhifamt := 0;
                REPEAT
                BEGIN
                    TransCount := TransCount + 1;
                    prPeriodTransactions.RESET;
                    prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll Period", periods);
                    prPeriodTransactions.SETRANGE(prPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                    prPeriodTransactions.SETRANGE(prPeriodTransactions."Transaction Code", Transcode[1, TransCount]);
                    IF prPeriodTransactions.FIND('-') THEN BEGIN
                        TranscAmount[1, TransCount] := prPeriodTransactions.Amount;
                        // prPeriodTransactions.CALCSUMS(TravelAllowance,TranscAmount[1,9]);
                    END;
                    REPEAT
                    BEGIN
                        TranscAmountTotal[1, TransCount] := ((TranscAmountTotal[1, TransCount]) + TranscAmount[1, TransCount]);
                    END;
                    UNTIL prPeriodTransactions.NEXT = 0;

                END;
                UNTIL TransCount = 70;//COMPRESSARRAY(TransName);



                prPeriodTransactions.RESET;
                prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll Period", periods);
                prPeriodTransactions.SETRANGE(prPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                prPeriodTransactions.SETRANGE(prPeriodTransactions."Transaction Name", 'Net Pay');
                IF prPeriodTransactions.FIND('-') THEN BEGIN
                    NetPay := prPeriodTransactions.Amount;
                    //NetPayTotal:=(NetPayTotal+(prPeriodTransactions.Amount));

                END;


                prPeriodTransactions.RESET;
                prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll Period", periods);
                prPeriodTransactions.SETRANGE(prPeriodTransactions."Employee Code", "HRM-Employee (D)"."No.");
                //prPeriodTransactions.SETRANGE(prPeriodTransactions."Transaction Name",'Net Pay');
                IF prPeriodTransactions.FIND('-') THEN BEGIN
                    REPEAT
                    BEGIN
                        IF prPeriodTransactions."Transaction Code" = 'NPAY' THEN BEGIN
                            NetPay := prPeriodTransactions.Amount;
                            NetPayTotal := (NetPayTotal + (prPeriodTransactions.Amount));
                        END ELSE
                            IF prPeriodTransactions."Transaction Code" = 'PAYE' THEN BEGIN
                                payeamount := prPeriodTransactions.Amount;
                                ;
                                payeamountTotal := (payeamountTotal + (prPeriodTransactions.Amount));
                            END ELSE
                                IF prPeriodTransactions."Transaction Code" = 'NSSF' THEN BEGIN
                                    nssfam := prPeriodTransactions.Amount;
                                    ;
                                    nssfamTotal := (nssfamTotal + (prPeriodTransactions.Amount));
                                END ELSE
                                    IF prPeriodTransactions."Transaction Code" = 'NHIF' THEN BEGIN
                                        nhifamt := prPeriodTransactions.Amount;
                                        ;
                                        nhifamtTotal := (nhifamtTotal + (prPeriodTransactions.Amount));

                                    END ELSE
                                        IF prPeriodTransactions."Transaction Code" = 'BPAY' THEN BEGIN
                                            BasicPay := prPeriodTransactions.Amount;
                                            ;
                                            BasicPayTotal := (BasicPayTotal + (prPeriodTransactions.Amount));
                                            ;

                                        END ELSE
                                            IF prPeriodTransactions."Transaction Code" = 'D004' THEN BEGIN
                                                PensionTotal := prPeriodTransactions.Amount + nssfam + 200;
                                            END ELSE
                                                IF prPeriodTransactions."Transaction Code" = 'INSR' THEN BEGIN
                                                    InsrRelief := prPeriodTransactions.Amount;
                                                END ELSE
                                                    IF prPeriodTransactions."Transaction Code" = 'PSNR' THEN BEGIN
                                                        personalRelief := prPeriodTransactions.Amount;

                                                    END;
                    END;
                    UNTIL prPeriodTransactions.NEXT = 0;

                END;


                IF "HRM-Employee (D)"."No." = '' THEN showdet := FALSE;


                IF ((BasicPay = 0) OR ("HRM-Employee (D)"."No." = '')) THEN //showdet:=FALSE;
                    CurrReport.SKIP;
            end;

            trigger OnPreDataItem()
            begin
                IF periods = 0D THEN ERROR('Please Specify the Period first.');
                counts := 0;
                NetPayTotal := 0;
                BasicPayTotal := 0;
                payeamountTotal := 0;
                nssfamTotal := 0;
                nhifamtTotal := 0;

                CLEAR(TranscAmountTotal);

                // Make Headers
                // Pick The Earnings First
                prtransCodes.RESET;
                prtransCodes.SETFILTER(prtransCodes."Transaction Type", '=%1', prtransCodes."Transaction Type"::Income);
                IF prtransCodes.FIND('-') THEN BEGIN
                    REPEAT
                    BEGIN
                        prPeriodTransactions.RESET;
                        prPeriodTransactions.SETRANGE(prPeriodTransactions."Transaction Code", prtransCodes."Transaction Code");
                        prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll Period", periods);
                        IF prPeriodTransactions.FIND('-') THEN BEGIN
                            counts := counts + 1;
                            TransName[1, counts] := prtransCodes."Transaction Name";
                            Transcode[1, counts] := prtransCodes."Transaction Code";
                        END;
                    END;
                    UNTIL prtransCodes.NEXT = 0;
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
                field(Period; periods)
                {
                    Caption = 'Period:';
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

    var
        "HRM-Employee (D)": Record "HRM-Employee C";
        prPayrollPeriods: Record "PRL-Payroll Periods";
        periods: Date;
        counts: Integer;
        prPeriodTransactions: Record "PRL-Period Transactions";
        TransName: array[1, 200] of Text[200];
        Transcode: array[1, 200] of Code[100];
        TransCount: Integer;
        TranscAmount: array[1, 200] of Decimal;
        TranscAmountTotal: array[1, 200] of Decimal;
        NetPay: Decimal;
        NetPayTotal: Decimal;
        showdet: Boolean;
        payeamount: Decimal;
        payeamountTotal: Decimal;
        nssfam: Decimal;
        nssfamTotal: Decimal;
        nhifamt: Decimal;
        nhifamtTotal: Decimal;
        BasicPay: Decimal;
        BasicPayTotal: Decimal;
        GrossPay: Decimal;
        GrosspayTotal: Decimal;
        prtransCodes: Record "PRL-Transaction Codes";
        info: Record "Company Information";
        Resident: Code[10];
        PensionTotal: Decimal;
        personalRelief: Decimal;
        InsrRelief: Decimal;
        paye: Decimal;
        TotalAllowance: Decimal;
}

