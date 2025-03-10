page 52179264 "PRL-List Transactions"
{
    PageType = List;
    SourceTable = "PRL-Employee Transactions";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = all;
                    Editable = true;
                    Visible = false;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        blnIsLoan := false;
                        if objTransCodes.Get(Rec."Transaction Code") then
                            Rec."Transaction Name" := objTransCodes."Transaction Name";
                        Rec."Payroll Period" := SelectedPeriod;
                        Rec."Period Month" := PeriodMonth;
                        Rec."Period Year" := PeriodYear;
                        if objTransCodes."Special Transactions" = 8 then blnIsLoan := true;

                        /*IF objTransCodes."Is Formula"=TRUE THEN
                        BEGIN
                         empCode:="Employee Code";
                         CLEAR(objOcx);
                         curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes.Formula);
                         Amount:=curTransAmount;
                        END;
                        */
                        //*************ENTER IF EMPLOYER DEDUCTION IS SET UP
                        curTransAmount := 0;
                        /*
                        IF objTransCodes."Include Employer Deduction"=TRUE THEN
                        BEGIN
                          curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes."Is Formula for employer");
                          "Employer Amount":=curTransAmount;
                        END;
                        */

                    end;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        if (blnIsLoan = true) and (Rec.Balance > 0) and (Rec.Amount > 0) then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }


                field(Balance; Rec.Balance)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        if (blnIsLoan = true) and (Rec.Balance > 0) and (Rec.Amount > 0) then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }
                field("Recurance Index"; Rec."Recurance Index")
                {
                    ApplicationArea = all;
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = all;
                }
                field("#of Repayments"; Rec."#of Repayments")
                {
                    ApplicationArea = all;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        if blnIsLoan = true then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }

                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = all;
                    Editable = false;
                }



                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = all;
                }
                field("Employer Balance"; Rec."Employer Balance")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
            //objEmpTrans.RESET;
            //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);
        end;

        //Filter per period  - Dennis
        Rec.SetFilter("Payroll Period", Format(objPeriod."Date Opened"));
    end;

    var
        objTransCodes: Record "PRL-Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "PRL-Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PRL-Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        blnIsLoan: Boolean;
        objEmpTrans: Record "PRL-Employee Transactions";
        transType: Text[30];
        objOcx: Codeunit prPayrollProcessing;
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
}

