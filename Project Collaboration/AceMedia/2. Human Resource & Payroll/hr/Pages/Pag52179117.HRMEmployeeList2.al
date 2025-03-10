page 52179117 "HRM-Employee-List2"
{
    CardPageID = "PRL-Header Salary Card";
    Editable = false;
    PageType = List;
    SourceTable = "HRM-Employee C";
    SourceTableView = order(ascending) where(Status = const(Active));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }




                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = All;
                }

                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = All;
                }

                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                }

                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }


                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {



        area(processing)
        {
            action(ViewhorPayslip)
            {
                ApplicationArea = all;
                Caption = 'Payslip';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = report;


                trigger OnAction()
                begin

                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";

                    objEmp.Reset;
                    objEmp.SetRange(objEmp."No.", Rec."No.");
                    if objEmp.Find('-') then
                        REPORT.Run(Report::"PRL-Payslips V 1.1.1", true, false, objEmp);
                end;
            }
            action(ProcessPayroll)
            {
                ApplicationArea = all;
                Caption = 'Process Payslip';
                Image = ExecuteBatch;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;

                trigger OnAction()
                var
                    progre: Dialog;
                    counts: Integer;
                    RecCount1: Text[120];
                    RecCount2: Text[120];
                    RecCount3: Text[120];
                    RecCount4: Text[120];
                    RecCount5: Text[120];
                    RecCount6: Text[120];
                    RecCount7: Text[120];
                    RecCount8: Text[120];
                    RecCount9: Text[120];
                    RecCount10: Text[120];
                    BufferString: Text[1024];
                    Var1: Code[10];
                    prempTrns: Record "PRL-Employee Transactions";
                    progDots: Text[50];
                    counted: Integer;
                    text1: Label '.';
                    text2: Label '.  .';
                    text3: Label '.  .  .';
                    text4: Label '.  .  .  .';
                    text5: Label '.  .  .  .  .';
                    text6: Label '.  .  .  .  .  .';
                    text7: Label '.  .  .  .  .  .  .';
                    text8: Label '.  .  .  .  .  .  .  .';
                    text9: Label '.  .  .  .  .  .  .  .  .';
                    text10: Label '.  .  .  .  .  .  .  .  .  .';
                    FRMVitalSetup: Record "PRL-Vital Setup Info";
                    SalesShipmentHeader: Record "Sales Shipment Header";
                    FrmTransCodes: Record "PRL-Transaction Codes";
                    transName: Text[150];
                    cummCredits: Decimal;
                begin
                    ContrInfo.Get;

                    if Confirm('This will process salaries for Permanent Employees, Continue?', false) = false then exit;

                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    objPeriod.SetFilter("Payroll Code", '%1', 'PAYROLL');
                    if objPeriod.Find('-') then begin
                        PeriodName := objPeriod."Period Name";
                        SelectedPeriod := objPeriod."Date Opened";
                    end
                    else
                        Error('No open period for the Casuals!');

                    ///CLEAR(StdDailyRate);
                    //StdDailyRate:=objPeriod."Casual Daily Rate";
                    //SalCard.GET("No.");

                    PeriodTrans.Reset;
                    PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                    PeriodTrans.SetFilter("Employee Category", '<>%1', 'CASUALS');
                    if PeriodTrans.Find('-') then
                        PeriodTrans.DeleteAll;


                    //Use CODEUNIT
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee.Status, HrEmployee.Status::Active);
                    HrEmployee.SetFilter(HrEmployee."Employee Category", '<>%1', 'CASUALS');
                    if Confirm('Process for the current employee only?', false) = true then
                        HrEmployee.SetRange("No.", Rec."No.");
                    //HrEmployee.SETRANGE(HrEmployee.Status,HrEmployee.Status::Normal);
                    if HrEmployee.Find('-') then begin
                        Clear(progDots);
                        Clear(RecCount1);
                        Clear(RecCount2);
                        Clear(RecCount3);
                        Clear(RecCount4);
                        Clear(RecCount5);
                        Clear(RecCount6);
                        Clear(RecCount7);
                        Clear(RecCount8);
                        Clear(RecCount9);
                        Clear(RecCount10);
                        Clear(counts);
                        progre.Open('Processing Please wait #1#############################' +
                        '\ ' +
                        '\#2###############################################################' +
                        '\#3###############################################################' +
                        '\#4###############################################################' +
                        '\#5###############################################################' +
                        '\#6###############################################################' +
                        '\#7###############################################################' +
                        '\#8###############################################################' +
                        '\#9###############################################################' +
                        '\#10###############################################################' +
                        '\#11###############################################################' +
                        '\#12###############################################################' +
                        '\#13###############################################################' +
                        '\#14###############################################################',
                            progDots,
                            RecCount1,
                            RecCount2,
                            RecCount3,
                            RecCount4,
                            RecCount5,
                            RecCount6,
                            RecCount7,
                            RecCount8,
                            RecCount9,
                            RecCount10,
                            Var1,
                            Var1,
                            BufferString
                        );

                        repeat
                            // Get Basic Salary
                            /*CLEAR(computedBasic);
                            PRLEmployeeDaysWorked.RESET;
                            PRLEmployeeDaysWorked.SETRANGE("Payroll Period",SelectedPeriod);
                            PRLEmployeeDaysWorked.SETRANGE("Employee Code",HrEmployee."No.");
                            IF PRLEmployeeDaysWorked.FIND('-') THEN BEGIN
                              IF HrEmployee."Daily Rate">0 THEN BEGIN
                              IF PRLEmployeeDaysWorked."Days Worked">0 THEN computedBasic:= PRLEmployeeDaysWorked."Days Worked"*HrEmployee."Daily Rate"
                              ELSE IF PRLEmployeeDaysWorked."Computed Days">0 THEN computedBasic:= PRLEmployeeDaysWorked."Computed Days"*HrEmployee."Daily Rate";
                              END ELSE BEGIN
                              IF PRLEmployeeDaysWorked."Days Worked">0 THEN computedBasic:= PRLEmployeeDaysWorked."Days Worked"*StdDailyRate
                              ELSE IF PRLEmployeeDaysWorked."Computed Days">0 THEN computedBasic:= PRLEmployeeDaysWorked."Computed Days"*StdDailyRate;
                                END;
                              END;

                            IF computedBasic>0 THEN BEGIN
                              //update or insert SalaryCard

                             salaryCard.RESET;
                             salaryCard.SETRANGE(salaryCard."Employee Code",HrEmployee."No.");
                             salaryCard.SETRANGE("Payroll Period",SelectedPeriod);
                             IF NOT salaryCard.FIND('-') THEN BEGIN
                               salaryCard.INIT;
                               salaryCard."Employee Code":=HrEmployee."No.";
                               salaryCard."Payroll Period":=SelectedPeriod;
                               salaryCard."Basic Pay":=computedBasic;
                               salaryCard.INSERT(TRUE);
                               END ELSE BEGIN
                               salaryCard."Basic Pay":=computedBasic;
                               salaryCard.MODIFY;
                                 END;
                              END;
                             salaryCard.RESET;
                             salaryCard.SETRANGE(salaryCard."Employee Code",HrEmployee."No.");
                             salaryCard.SETFILTER(salaryCard.Closed,'=%1',FALSE);
                             IF salaryCard.FIND('-') THEN BEGIN
                             END;
                             */
                            dateofJoining := 0D;
                            dateofLeaving := CalcDate('-1M', Today);
                            if HrEmployee."Date Of Join" = 0D then dateofJoining := CalcDate('-1M', Today);
                            //Progress Window
                            PeriodTrans.Reset;
                            PeriodTrans.SetRange(PeriodTrans."Employee Code", HrEmployee."No.");
                            PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                            if PeriodTrans.Find('-') then
                                PeriodTrans.DeleteAll;

                            //  ProgressWindow.UPDATE(1,HrEmployee."No."+':'+HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name");
                            salaryCard.Reset;
                            salaryCard.SetRange(salaryCard."Employee Code", HrEmployee."No.");
                            salaryCard.SetRange("Payroll Period", SelectedPeriod);
                            if not salaryCard.Find('-') then begin
                                // If employee has no Basic Salary

                                // Populate Credits Here********************************************************************
                                // Populate Credit Sales for the Month
                                if FRMVitalSetup.Get() then begin
                                    FRMVitalSetup.TestField(FRMVitalSetup."Credit Trans. Code");
                                    SalesShipmentHeader.Reset;
                                    SalesShipmentHeader.SetRange(SalesShipmentHeader."Bill-to Customer No.", HrEmployee."Credit Account");
                                    /* SalesShipmentHeader.SetRange(SalesShipmentHeader."Credit Sale", true);
                                    SalesShipmentHeader.SetRange(SalesShipmentHeader."Payment Period", SelectedPeriod); */
                                    Clear(cummCredits);
                                    if SalesShipmentHeader.Find('-') then begin
                                        repeat
                                        begin
                                            /* SalesShipmentHeader.CalcFields("Document Amount");
                                            if SalesShipmentHeader."Document Amount" <> 0 then cummCredits := cummCredits + SalesShipmentHeader."Document Amount"; */
                                        end;
                                        until SalesShipmentHeader.Next = 0;
                                        if cummCredits <> 0 then begin
                                            transName := '';
                                            if FrmTransCodes.Get(FRMVitalSetup."Credit Trans. Code") then transName := FrmTransCodes."Transaction Name";
                                            prempTrns.Reset;
                                            prempTrns.SetRange(prempTrns."Employee Code", HrEmployee."No.");
                                            prempTrns.SetRange(prempTrns."Payroll Period", SelectedPeriod);
                                            prempTrns.SetRange(prempTrns."Transaction Code", FRMVitalSetup."Credit Trans. Code");
                                            if not (prempTrns.Find('-')) then begin
                                                // Insert
                                                prempTrns.Init;
                                                prempTrns."Employee Code" := HrEmployee."No.";
                                                prempTrns."Payroll Period" := SelectedPeriod;
                                                prempTrns."Period Year" := Date2DMY(SelectedPeriod, 3);
                                                prempTrns."Period Month" := Date2DMY(SelectedPeriod, 2);
                                                prempTrns."Transaction Code" := FRMVitalSetup."Credit Trans. Code";
                                                prempTrns."Transaction Name" := transName;
                                                prempTrns.Validate("Transaction Code");
                                                prempTrns."Recurance Index" := 999;
                                                prempTrns.Balance := cummCredits;
                                                prempTrns.Amount := cummCredits;
                                                prempTrns.Insert;
                                                prempTrns.Validate("Transaction Code");
                                            end else begin
                                                //Update
                                                prempTrns."Recurance Index" := 999;
                                                prempTrns.Balance := cummCredits;
                                                prempTrns."Transaction Name" := transName;
                                                prempTrns.Amount := cummCredits;
                                                prempTrns.Modify;
                                                prempTrns.Validate("Transaction Code");
                                            end;

                                        end;
                                    end;
                                end;

                                //Populate Credits ********************************************************************END**
                                /* prempTrns.RESET;
                                 prempTrns.SETRANGE(prempTrns."Employee Code",HrEmployee."No.");
                                 prempTrns.SETRANGE(prempTrns."Payroll Period",SelectedPeriod);
                                 IF prempTrns.FIND('-') THEN BEGIN
                                      PeriodTrans.RESET;
                                      PeriodTrans.SETRANGE(PeriodTrans."Employee Code",HrEmployee."No.");
                                      PeriodTrans.SETRANGE(PeriodTrans."Payroll Period",SelectedPeriod);
                                      PeriodTrans.DELETEALL; // Delete Processed Transactions
                                      */
                                /* ProcessPayroll.fnProcesspayroll(HrEmployee."No.", DOJ, 0, false
                                    , false, false, SelectedPeriod, SelectedPeriod, '', '',
                                    dateofLeaving, false, HrEmployee."Department Code", HrEmployee."Payroll Posting Group", true); */
                                /* ProcessPayroll.fnProcesspayroll(HrEmployee."No.", DOJ, 0, false
                                , false, false, SelectedPeriod, SelectedPeriod, '', '',
                                dateofLeaving, false, HrEmployee."Department Code"); */
                                ProcessPayroll.fnProcesspayroll(HrEmployee."No.", DOJ, salaryCard."Basic Pay", salaryCard."Pays PAYE"
                    , salaryCard."Pays NSSF", salaryCard."Pays NHIF", SelectedPeriod, SelectedPeriod, '', prempTrns."Reference No",
                    dateofLeaving, GetsPAYERelief, '', PayrollCode, true);


                                //END;// Has Transaction
                            end else begin
                                salaryCard.Reset;
                                salaryCard.SetRange(salaryCard."Employee Code", HrEmployee."No.");
                                salaryCard.SetRange("Payroll Period", SelectedPeriod);
                                //IF NOT salaryCard.FIND('-') THEN BEGIN
                                if salaryCard.Find('-') then begin
                                    if salaryCard."Suspend Pay" <> true then begin
                                        //IF salaryCard."Gets Personal Relief"=salaryCard."Gets Personal Relief"::"1" THEN GetsPAYERelief:=TRUE ELSE GetsPAYERelief:=FALSE;
                                        GetsPAYERelief := true;
                                        DOJ := 0D;
                                        if HrEmployee."Date Of Join" = 0D then DOJ := CalcDate('-2M', Today) else DOJ := HrEmployee."Date Of Join";
                                        salaryCard.Reset;
                                        salaryCard.SetRange(salaryCard."Employee Code", HrEmployee."No.");
                                        salaryCard.SetFilter(salaryCard.Closed, '=%1', false);
                                        if salaryCard.Find('-') then begin
                                            if salaryCard."Suspend Pay" = true then begin
                                                PeriodTrans.Reset;
                                                PeriodTrans.SetRange(PeriodTrans."Employee Code", HrEmployee."No.");
                                                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                                                PeriodTrans.DeleteAll;
                                            end// delete stuff from transactions table
                                            else begin
                                                /* ProcessPayroll.fnProcesspayroll(HrEmployee."No.", DOJ, salaryCard."Basic Pay", salaryCard."Pays PAYE"
                                                    , salaryCard."Pays NSSF", salaryCard."Pays NHIF", SelectedPeriod, SelectedPeriod, '', '',
                                                    dateofLeaving, GetsPAYERelief, HrEmployee."Department Code", HrEmployee."Payroll Posting Group", true); */

                                                /* ProcessPayroll.fnProcesspayroll(HrEmployee."No.", DOJ, salaryCard."Basic Pay", salaryCard."Pays PAYE"
                                                    , salaryCard."Pays NSSF", salaryCard."Pays NHIF", SelectedPeriod, SelectedPeriod, '', '',
                                                    dateofLeaving, GetsPAYERelief, HrEmployee."Department Code"); */

                                                ProcessPayroll.fnProcesspayroll(HrEmployee."No.", DOJ, salaryCard."Basic Pay", salaryCard."Pays PAYE"
                    , salaryCard."Pays NSSF", salaryCard."Pays NHIF", SelectedPeriod, SelectedPeriod, '', prempTrns."Reference No",
                    dateofLeaving, GetsPAYERelief, '', PayrollCode, true);

                                                Clear(Var1);
                                                counts := counts + 1;
                                                if ((counted = 21) or (counted = 11)) then begin
                                                    if counted = 21 then counted := 0;
                                                    // SLEEP(150);
                                                end;
                                                counted := counted + 1;
                                                if counted = 1 then
                                                    progDots := text1
                                                else
                                                    if counted = 2 then
                                                        progDots := text2
                                                    else
                                                        if counted = 3 then
                                                            progDots := text3
                                                        else
                                                            if counted = 4 then
                                                                progDots := text4
                                                            else
                                                                if counted = 5 then
                                                                    progDots := text5
                                                                else
                                                                    if counted = 6 then
                                                                        progDots := text6
                                                                    else
                                                                        if counted = 7 then
                                                                            progDots := text7
                                                                        else
                                                                            if counted = 8 then
                                                                                progDots := text8
                                                                            else
                                                                                if counted = 9 then
                                                                                    progDots := text9
                                                                                else
                                                                                    if counted = 10 then
                                                                                        progDots := text10
                                                                                    else
                                                                                        if counted = 19 then
                                                                                            progDots := text1
                                                                                        else
                                                                                            if counted = 18 then
                                                                                                progDots := text2
                                                                                            else
                                                                                                if counted = 17 then
                                                                                                    progDots := text3
                                                                                                else
                                                                                                    if counted = 16 then
                                                                                                        progDots := text4
                                                                                                    else
                                                                                                        if counted = 15 then
                                                                                                            progDots := text5
                                                                                                        else
                                                                                                            if counted = 14 then
                                                                                                                progDots := text6
                                                                                                            else
                                                                                                                if counted = 13 then
                                                                                                                    progDots := text7
                                                                                                                else
                                                                                                                    if counted = 12 then
                                                                                                                        progDots := text8
                                                                                                                    else
                                                                                                                        if counted = 11 then
                                                                                                                            progDots := text9
                                                                                                                        else
                                                                                                                            progDots := '';

                                                if counts = 1 then
                                                    RecCount1 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                else
                                                    if counts = 2 then begin
                                                        RecCount2 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                    HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                    end
                                                    else
                                                        if counts = 3 then begin
                                                            RecCount3 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                        HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                        end
                                                        else
                                                            if counts = 4 then begin
                                                                RecCount4 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                            HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                            end
                                                            else
                                                                if counts = 5 then begin
                                                                    RecCount5 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                                HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                                end
                                                                else
                                                                    if counts = 6 then begin
                                                                        RecCount6 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                                    HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                                    end
                                                                    else
                                                                        if counts = 7 then begin
                                                                            RecCount7 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                                        HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                                        end
                                                                        else
                                                                            if counts = 8 then begin
                                                                                RecCount8 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                                            HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                                            end
                                                                            else
                                                                                if counts = 9 then begin
                                                                                    RecCount9 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                                                HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                                                end
                                                                                else
                                                                                    if counts = 10 then begin
                                                                                        RecCount10 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                                                    HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name"
                                                                                    end else
                                                                                        if counts > 10 then begin
                                                                                            RecCount1 := RecCount2;
                                                                                            RecCount2 := RecCount3;
                                                                                            RecCount3 := RecCount4;
                                                                                            RecCount4 := RecCount5;
                                                                                            RecCount5 := RecCount6;
                                                                                            RecCount6 := RecCount7;
                                                                                            RecCount7 := RecCount8;
                                                                                            RecCount8 := RecCount9;
                                                                                            RecCount9 := RecCount10;
                                                                                            RecCount10 := Format(counts) + '). ' + HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' +
                                                                                        HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                                                                                        end;
                                                Clear(BufferString);
                                                BufferString := 'Total Records processed = ' + Format(counts);

                                                progre.Update();
                                                // SLEEP(50);
                                            end;
                                        end;
                                        //   END;
                                    end;
                                end;
                            end;
                        until HrEmployee.Next = 0;
                        ////Progress Window
                        progre.Close;
                    end;

                end;
            }

        }
    }


    var
        //  Mail: Codeunit Mail;
        PictureExists: Boolean;
        DepCode: Code[10];
        OfficeCode: Code[10];
        objEmp: Record "HRM-Employee C";
        SalCard: Record "PRL-Salary Card";
        objPeriod: Record "PRL-Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit prPayrollProcessing;
        HrEmployee: Record "HRM-Employee C";
        ProgressWindow: Dialog;
        prPeriodTransactions: Record "PRL-Period Transactions";
        prEmployerDeductions: Record "PRL-Employer Deductions";
        PayrollType: Record "PRL-Payroll Type";
        Selection: Integer;
        PayrollDefined: Text[30];
        PayrollCode: Code[10];
        NoofRecords: Integer;
        i: Integer;
        ContrInfo: Record "HRM-Control-Information";
        HREmp: Record "HRM-Employee C";
        j: Integer;
        PeriodTrans: Record "PRL-Period Transactions";
        salaryCard: Record "PRL-Salary Card";
        dateofJoining: Date;
        dateofLeaving: Date;
        GetsPAYERelief: Boolean;
        DOJ: Date;
        SalCard2: Record "PRL-Salary Card";

    procedure SetNewFilter(var DepartmentCode: Code[10]; var "Office Code": Code[10])
    begin
        DepCode := DepartmentCode;
        OfficeCode := "Office Code";
    end;
}

