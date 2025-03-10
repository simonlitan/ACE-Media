// codeunit 52178553 "Payroll Budget Control"
// {
//     var
//         BCsetup: Record "FIN-Budgetary Control Setup";
//         PayPeriod: Record "PRL-Payroll Periods";
        
//         GLAccount: Record "G/L Account";
//         DimensionValue: Record "Dimension Value";
//         FINBudgetEntries: Record "FIN-Budget Entries";
//         PostBudgetEnties: Codeunit "Post Budget Enties";
//         //PayrollJournalDetails: Record "Payroll Journal Details";
//         PayrollJournalDetails: Record "PRL-Period Transactions";
//         PeriodTrans: Record "PRL-Period Transactions";
//         PRLVitalSetupInfo: Record "PRL-Vital Setup Info";
//         objPeriod: Record "PRL-Payroll Periods";
//         BudgetCode: Code[20];
//         deptCode: Code[20];
//         FINBudgetaryControlSetup: Record "FIN-Budgetary Control Setup";
//         SelectedPeriodIn: Date;
//         LineNumber: Integer;
//         objEmp: Record "HRM-Employee C";
//         GlobalDim1: Code[10];
//         strEmpName: Text[150];
//         SalaryCard: Record "PRL-Salary Card";


//     procedure CommitBudget()
//     begin
//         BCsetup.GET;
//         IF NOT ((BCsetup.Mandatory) AND (BCsetup."Payroll Budget Mandatory")) THEN EXIT;
//         BCsetup.TESTFIELD("Current Budget Code");
//         PayPeriod.RESET;
//         PayPeriod.SETRANGE(Closed, FALSE);
//         PayPeriod.SETFILTER("Date Opened", '<>%1', 0D);
//         IF PayPeriod.FIND('-') THEN;

//         PayrollJournalSummary.RESET;
//         PayrollJournalSummary.SETRANGE("Period Month", PayPeriod."Period Month");
//         PayrollJournalSummary.SETRANGE("Period YearS", PayPeriod."Period Year");
//         PayrollJournalSummary.SETFILTER("Post as", '%1', PayrollJournalSummary."Post as"::Debit);
//         PayrollJournalSummary.SETFILTER(Amount, '>%1', 0);
//         IF PayrollJournalSummary.FIND('-') THEN BEGIN
//             REPEAT
//             BEGIN
//                 PayrollJournalSummary.CALCFIELDS(Amount);
//                 // Check if budget exists
//                 PayrollJournalSummary.TESTFIELD("G/L Account");
//                 PayrollJournalSummary.TESTFIELD("Department Code");
//                 GLAccount.RESET;
//                 GLAccount.SETRANGE("No.", PayrollJournalSummary."G/L Account");
//                 IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
//                 DimensionValue.RESET;
//                 DimensionValue.SETRANGE(Code, PayrollJournalSummary."Department Code");
//                 DimensionValue.SETRANGE("Global Dimension No.", 2);
//                 IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
//                 FINBudgetEntries.RESET;
//                 FINBudgetEntries.SETRANGE("Budget Name", BCsetup."Current Budget Code");
//                 FINBudgetEntries.SETRANGE("G/L Account No.", PayrollJournalSummary."G/L Account");
//                 FINBudgetEntries.SETRANGE("Global Dimension 2 Code", PayrollJournalSummary."Department Code");
//                 FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
//                 , FINBudgetEntries."Transaction Type"::Allocation);
//                 FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2',
//                 FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
//                 FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(PayPeriod."Date Opened"));
//                 IF FINBudgetEntries.FIND('-') THEN BEGIN
//                     IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
//                         IF FINBudgetEntries.Amount > 0 THEN BEGIN
//                             IF (PayrollJournalSummary.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
//                             // Commit Budget Here
//                             PostBudgetEnties.CheckBudgetAvailability(PayrollJournalSummary."G/L Account", PayrollJournalSummary."Payroll Period", '',
//                             PayrollJournalSummary."Department Code",
//                             PayrollJournalSummary.Amount, GLAccount.Name, 'PAYROLL' + FORMAT(PayPeriod."Date Opened"),
//                             FORMAT(PayPeriod."Date Opened") + PayrollJournalSummary."G/L Account", 'PAYROLL' + PayPeriod."Period Name");
//                         END ELSE
//                             ERROR('No allocation for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
//                     END;
//                 END ELSE
//                     ERROR('%1%2%3%4%5%6', 'Missing Budget for  Account:', GLAccount.Name, ' Department: ', DimensionValue.Name, ' available is ', FINBudgetEntries.Amount);
//             END;
//             UNTIL PayrollJournalSummary.NEXT = 0;
//         END;
//     end;


//     procedure ExpenseBudget()
//     begin
//         BCsetup.GET;
//         IF NOT ((BCsetup.Mandatory) AND (BCsetup."Payroll Budget Mandatory")) THEN EXIT;
//         BCsetup.TESTFIELD("Current Budget Code");
//         PayPeriod.RESET;
//         PayPeriod.SETRANGE(Closed, FALSE);
//         PayPeriod.SETFILTER("Date Opened", '<>%1', 0D);
//         IF PayPeriod.FIND('-') THEN;

//         PayrollJournalSummary.RESET;
//         PayrollJournalSummary.SETRANGE("Period Month", PayPeriod."Period Month");
//         PayrollJournalSummary.SETRANGE("Period YearS", PayPeriod."Period Year");
//         PayrollJournalSummary.SETFILTER("Post as", '%1', PayrollJournalSummary."Post as"::Debit);
//         PayrollJournalSummary.SETFILTER(Amount, '>%1', 0);
//         IF PayrollJournalSummary.FIND('-') THEN BEGIN
//             REPEAT
//             BEGIN
//                 PayrollJournalSummary.CALCFIELDS(Amount);
//                 // Check if budget exists
//                 PayrollJournalSummary.TESTFIELD("G/L Account");
//                 PayrollJournalSummary.TESTFIELD("Department Code");
//                 GLAccount.RESET;
//                 GLAccount.SETRANGE("No.", PayrollJournalSummary."G/L Account");
//                 IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
//                 DimensionValue.RESET;
//                 DimensionValue.SETRANGE(Code, PayrollJournalSummary."Department Code");
//                 DimensionValue.SETRANGE("Global Dimension No.", 2);
//                 IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
//                 IF PayrollJournalSummary.Amount > 0 THEN BEGIN
//                     // Commit Budget Here
//                     PostBudgetEnties.ExpenseBudget(PayrollJournalSummary."G/L Account", PayPeriod."Date Opened", '', PayrollJournalSummary."Department Code",
//                     PayrollJournalSummary.Amount, GLAccount.Name, USERID, PayPeriod."Date Opened", 'PAYROLL' + FORMAT(PayPeriod."Date Opened"),
//                     FORMAT(PayPeriod."Date Opened") + PayrollJournalSummary."G/L Account", 'PAYROLL' + FORMAT(PayPeriod."Date Opened"));
//                 END;
//             END;
//             UNTIL PayrollJournalSummary.NEXT = 0;
//         END;
//     end;

//     procedure CancelCommitment()
//     begin
//         BCsetup.GET;
//         IF NOT ((BCsetup.Mandatory) AND (BCsetup."Payroll Budget Mandatory")) THEN EXIT;
//         BCsetup.TESTFIELD("Current Budget Code");
//         PayPeriod.RESET;
//         PayPeriod.SETRANGE(Closed, FALSE);
//         PayPeriod.SETFILTER("Date Opened", '<>%1', 0D);
//         IF PayPeriod.FIND('-') THEN;

//         PayrollJournalSummary.RESET;
//         PayrollJournalSummary.SETRANGE("Period Month", PayPeriod."Period Month");
//         PayrollJournalSummary.SETRANGE("Period YearS", PayPeriod."Period Year");
//         PayrollJournalSummary.SETFILTER("Post as", '%1', PayrollJournalSummary."Post as"::Debit);
//         PayrollJournalSummary.SETFILTER(Amount, '>%1', 0);
//         IF PayrollJournalSummary.FIND('-') THEN BEGIN
//             REPEAT
//             BEGIN
//                 PayrollJournalSummary.CALCFIELDS(Amount);
//                 // Check if budget exists
//                 PayrollJournalSummary.TESTFIELD("G/L Account");
//                 PayrollJournalSummary.TESTFIELD("Department Code");
//                 GLAccount.RESET;
//                 GLAccount.SETRANGE("No.", PayrollJournalSummary."G/L Account");
//                 IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
//                 DimensionValue.RESET;
//                 DimensionValue.SETRANGE(Code, PayrollJournalSummary."Department Code");
//                 DimensionValue.SETRANGE("Global Dimension No.", 2);
//                 IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
//                 IF PayrollJournalSummary.Amount > 0 THEN BEGIN
//                     //PostBudgetEnties.CancelBudgetCommitment(PayrollJournalSummary."G/L Account", PayPeriod."Date Opened", '', PayrollJournalSummary."Department Code",
//                     // PayrollJournalSummary.Amount, GLAccount.Name, USERID, 'PAYROLL' + FORMAT(PayPeriod."Date Opened"),
//                     // FORMAT(PayPeriod."Date Opened") + PayrollJournalSummary."G/L Account", 'PAYROLL' + FORMAT(PayPeriod."Date Opened"));
//                 END; 

//             END;
//             UNTIL PayrollJournalSummary.NEXT = 0;
//         END;
//     end;

//     procedure GenerateBudgetEntries(PayPeriodz: Record "PRL-Payroll Periods")
//     begin
//         //Delete Entries for Payroll budget for the Month First
//         // // PRLSalaryCard.RESET;
//         // // PRLSalaryCard.SETRANGE("Payroll Period",SelectedPeriodIn);
//         // // IF PRLSalaryCard.FIND('-') THEN REPORT.RUN(70275,FALSE,FALSE,PRLSalaryCard);
//         CLEAR(BudgetCode);
//         CLEAR(deptCode);
//         IF FINBudgetaryControlSetup.GET THEN FINBudgetaryControlSetup.TESTFIELD("Current Budget Code");
//         BudgetCode := FINBudgetaryControlSetup."Current Budget Code";
//         PRLVitalSetupInfo.RESET;
//         IF PRLVitalSetupInfo.FIND('-') THEN BEGIN
//             // PRLVitalSetupInfo.TESTFIELD("Payroll Budget is Based on");
//             // IF PRLVitalSetupInfo."Payroll Budget is Based on"=PRLVitalSetupInfo."Payroll Budget is Based on"::"Global Department" THEN 
//             // PRLVitalSetupInfo.TESTFIELD("Global Budget Department");
//             //deptCode:=PRLVitalSetupInfo."Global Budget Department";
//         END;
//         SelectedPeriodIn := PayPeriodz."Date Opened";
//         // // // // // SalaryCard.RESET;
//         // // // // // SalaryCard.SETRANGE("Period Month",PayPeriodz."Period Month");
//         // // // // // SalaryCard.SETRANGE("Period Year",PayPeriodz."Period Year");
//         // // // // // IF SalaryCard.FIND('-') THEN;
//         // // // // // REPEAT
//         // // // // //  BEGIN
//         objPeriod.RESET;
//         objPeriod.SETRANGE(objPeriod."Date Opened", SelectedPeriodIn);
//         IF objPeriod.FIND('-') THEN;
//         PeriodTrans.RESET;
//         //PeriodTrans.SETRANGE(PeriodTrans."Employee Code",SalaryCard."Employee Code");
//         PeriodTrans.SETRANGE(PeriodTrans."Payroll Period", SelectedPeriodIn);
//         IF PeriodTrans.FIND('-') THEN BEGIN
//             REPEAT
//                 //Get the staff details (header)
//                 objEmp.SETRANGE(objEmp."No.", SalaryCard."Employee Code");
//                 IF objEmp.FIND('-') THEN BEGIN
//                     strEmpName := '[' + objEmp."No." + '] ' + objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";
//                     GlobalDim1 := objEmp."Department Code";
//                 END;
//                 IF deptCode = '' THEN
//                     deptCode := objEmp."Department Code";
//                 LineNumber := LineNumber + 10;


//                 IF PeriodTrans."Journal Account Code" <> '' THEN BEGIN

//                     // Insert into Journal Details

//                     PayrollJournalDetails.RESET;
//                     PayrollJournalDetails.SETRANGE(PayrollJournalDetails."Employee Code", PeriodTrans."Employee Code");
//                     PayrollJournalDetails.SETRANGE(PayrollJournalDetails."Transaction Code", PeriodTrans."Transaction Code");
//                     PayrollJournalDetails.SETRANGE(PayrollJournalDetails."Period Month", PeriodTrans."Period Month");
//                     PayrollJournalDetails.SETRANGE(PayrollJournalDetails."Period Year", PeriodTrans."Period Year");
//                     IF PayrollJournalDetails.FIND('-') THEN BEGIN
//                         PayrollJournalDetails."GL Account" := PeriodTrans."Journal Account Code";
//                         //PayrollJournalDetails."Posting Description" := COPYSTR(objPeriod."Period Name" + ' - ' + PeriodTrans."Transaction Name", 1, 50);
//                         PayrollJournalDetails.Amount := PeriodTrans.Amount;
//                         PayrollJournalDetails."Post as" := PeriodTrans."Post As";
//                         PayrollJournalDetails."coop parameters" := PeriodTrans."coop parameters";
//                         PayrollJournalDetails."Journal Account Type" := PeriodTrans."Journal Account Type";
//                         PayrollJournalDetails.MODIFY;
//                     END ELSE BEGIN
//                         PayrollJournalDetails.INIT;
//                         PayrollJournalDetails."Employee Code" := PeriodTrans."Employee Code";
//                         PayrollJournalDetails."Transaction Code" := PeriodTrans."Transaction Code";
//                         PayrollJournalDetails."Period Month" := PeriodTrans."Period Month";
//                         PayrollJournalDetails."Period Year" := PeriodTrans."Period Year";
//                         PayrollJournalDetails."Transaction Name" := PeriodTrans."Transaction Name";
//                         PayrollJournalDetails."GL Account" := PeriodTrans."Journal Account Code";
//                         //  PayrollJournalDetails."Posting Description" := COPYSTR(objPeriod."Period Name" + ' - ' + PeriodTrans."Transaction Name", 1, 50);
//                         PayrollJournalDetails.Amount := PeriodTrans.Amount;
//                         PayrollJournalDetails."Post as" := PeriodTrans."Post As";
//                         PayrollJournalDetails."coop parameters" := PeriodTrans."coop parameters";
//                         PayrollJournalDetails."Journal Account Type" := PeriodTrans."Journal Account Type";
//                         PayrollJournalDetails.INSERT;
//                     END;// Does not exist, Insert

//                     // Insert into Journal Summary
//                     PayrollJournalSummary.RESET;
//                     PayrollJournalSummary.SETRANGE(PayrollJournalSummary."Transaction Code", PeriodTrans."Transaction Code");
//                     PayrollJournalSummary.SETRANGE(PayrollJournalSummary."Period Month", PeriodTrans."Period Month");
//                     PayrollJournalSummary.SETRANGE(PayrollJournalSummary."Period YearS", PeriodTrans."Period Year");
//                     IF PayrollJournalSummary.FIND('-') THEN BEGIN
//                         PayrollJournalSummary."G/L Account" := PeriodTrans."Journal Account Code";
//                         PayrollJournalSummary."Transaction Name" := PeriodTrans."Transaction Name";
//                         PayrollJournalSummary."Posting Description" := COPYSTR(objPeriod."Period Name" + ' - ' + PeriodTrans."Transaction Name", 1, 50);
//                         PayrollJournalSummary."Post as" := PeriodTrans."Post As";
//                         PayrollJournalSummary."coop parameters" := PeriodTrans."coop parameters";
//                         PayrollJournalSummary."Journal Account Type" := PeriodTrans."Journal Account Type";
//                         PayrollJournalSummary.MODIFY;
//                     END ELSE BEGIN
//                         PayrollJournalSummary.INIT;
//                         PayrollJournalSummary."Transaction Code" := PeriodTrans."Transaction Code";
//                         PayrollJournalSummary."Transaction Name" := PeriodTrans."Transaction Name";
//                         PayrollJournalSummary."G/L Account" := PeriodTrans."Journal Account Code";
//                         PayrollJournalSummary."Period Month" := PeriodTrans."Period Month";
//                         PayrollJournalSummary."Period YearS" := PeriodTrans."Period Year";
//                         PayrollJournalSummary."Posting Description" := COPYSTR(objPeriod."Period Name" + ' - ' + PeriodTrans."Transaction Name", 1, 50);
//                         PayrollJournalSummary."Post as" := PeriodTrans."Post As";
//                         PayrollJournalSummary."coop parameters" := PeriodTrans."coop parameters";
//                         PayrollJournalSummary."Journal Account Type" := PeriodTrans."Journal Account Type";
//                         PayrollJournalSummary."Payroll Period" := SelectedPeriodIn;
//                         PayrollJournalSummary."Department Code" := deptCode;
//                         PayrollJournalSummary."Budget Code" := BudgetCode;
//                         PayrollJournalSummary.INSERT;
//                     END;
//                 END;
//             UNTIL PeriodTrans.NEXT = 0;
//         END;
//     end;
// }

