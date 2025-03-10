// report 52178584 "Payroll JVS Transfer"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(scard; "PRL-Salary Card")
//         {
//             RequestFilterFields = "Period Filter", "Employee Code";

//             trigger OnAfterGetRecord()
//             begin
//                 scard.SetFilter("Payroll Period", '%1', PeriodDate);
//                 //For use when posting Pension and NSSF
//                 // ERROR('Here');
//                 //Get the staff details (header)
//                 //skip this report if employee is terminated
//                 objEmp.RESET;
//                 objEmp.SETRANGE(objEmp."No.", "Employee Code");
//                 IF objEmp.FIND('-') THEN
//                     IF objEmp.Status = objEmp.Status::Terminated THEN
//                         CurrReport.SKIP;

//                 objEmp.RESET;
//                 objEmp.SETRANGE(objEmp."No.", "Employee Code");
//                 IF objEmp.FIND('-') THEN BEGIN
//                     strEmpName := '[' + "Employee Code" + '] ' + objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";
//                     GlobalDim1 := objEmp."Department Code";
//                     GlobalDim2 := objEmp."Department Code";//objEmp.Office;
//                     objEmp.TESTFIELD("Posting Group");
//                     PostingGroup.GET(objEmp."Posting Group");

//                 END;

//                 //PKK
//                 PostingGroup.TESTFIELD("NSSF Employee Account");
//                 PostingGroup.TESTFIELD("NSSF Employer Account");
//                 PostingGroup.TESTFIELD("Pension Employer Acc");
//                 PostingGroup.TESTFIELD("Pension Employee Acc");

//                 LineNumber := LineNumber + 10;


//                 PeriodTrans.RESET;
//                 PeriodTrans.SETRANGE(PeriodTrans."Employee Code", scard."Employee Code");
//                 PeriodTrans.SETRANGE(PeriodTrans."Payroll Period", SelectedPeriod);
//                 IF PeriodTrans.FIND('-') THEN BEGIN
//                     REPEAT
//                         IF PeriodTrans."Journal Account Code" <> '' THEN BEGIN
//                             if PeriodTrans."Payroll Period" = SelectedPeriod then begin
//                                 //message('test 1');
//                                 AmountToDebit := 0;
//                                 AmountToCredit := 0;
//                                 IF PeriodTrans."Post As" = PeriodTrans."Post As"::Debit THEN
//                                     AmountToDebit := PeriodTrans.Amount
//                                 else
//                                     IF PeriodTrans."Post As" = PeriodTrans."Post As"::Credit THEN
//                                         AmountToCredit := PeriodTrans.Amount;

//                                 IF PeriodTrans."Journal Account Type" = 1 THEN
//                                     IntegerPostAs := 0
//                                 else
//                                     IF PeriodTrans."Journal Account Type" = 2 THEN
//                                         IntegerPostAs := 1;
//                                 //Negative NPay
//                                 /*  IF (PeriodTrans."Post As" =PeriodTrans."Post As"::Credit) AND (PeriodTrans.Amount<0) THEN BEGIN
//                                     AmountToDebit:=AmountToCredit*-1;
//                                     AmountToCredit:=0;
//                                     CreateJnlEntry(IntegerPostAs,PeriodTrans."Journal Account Code",
//                                     GlobalDim1,GlobalDim2,PeriodTrans."Transaction Name"+'-'+PeriodTrans."Employee Code",AmountToDebit,AmountToCredit,
//                                     PeriodTrans."Post As"::Debit,PeriodTrans."Loan Number",SaccoTransactionType);
//                                   END ELSE BEGIN
//                                   IF  PeriodTrans.GET("prSalary Card"."Employee Code") THEN */

//                                 CreateJnlEntry(IntegerPostAs, PeriodTrans."Journal Account Code",
//                                 GlobalDim1, GlobalDim2, PeriodTrans."Transaction Name" + '-' + PeriodTrans."Employee Code", AmountToDebit, AmountToCredit,
//                                 PeriodTrans."Post As", PeriodTrans."Loan Number", SaccoTransactionType, PeriodTrans."Employee Code");
//                             end;
//                         END;
//                     UNTIL PeriodTrans.NEXT = 0;
//                 END;



//                 /// Nita Employer
//                 PeriodTrans.RESET;
//                 PeriodTrans.SETRANGE(PeriodTrans."Employee Code", scard."Employee Code");
//                 PeriodTrans.SETRANGE(PeriodTrans."Payroll Period", SelectedPeriod);
//                 PeriodTrans.SetRange("Transaction Code", 'NITA');
//                 IF PeriodTrans.FIND('-') THEN BEGIN
//                     REPEAT
//                         //Debit Staff Expense
//                         CreateJnlEntry(0, PeriodTrans."Journal Bal Acc",
//                         GlobalDim1, GlobalDim2, PeriodTrans."Transaction Code" + '-' + PeriodTrans."Employee Code", PeriodTrans.Amount, 0, 1, '',
//                         SaccoTransactionType, PeriodTrans."Employee Code");

//                         //Credit Payables
//                         CreateJnlEntry(0, PeriodTrans."Journal Account Code",
//                         GlobalDim1, GlobalDim2, PeriodTrans."Transaction Code" + '-' + PeriodTrans."Employee Code", 0, PeriodTrans.Amount,
//                         0, '', SaccoTransactionType, PeriodTrans."Employee Code");

//                     UNTIL PeriodTrans.NEXT = 0;
//                 END;
//                 //end of nita
//                 //Housing Levy Employer
//                 PeriodTrans.RESET;
//                 PeriodTrans.SETRANGE(PeriodTrans."Employee Code", scard."Employee Code");
//                 PeriodTrans.SETRANGE(PeriodTrans."Payroll Period", SelectedPeriod);
//                 PeriodTrans.SetRange("Transaction Code", 'HE-LEVI Employer');
//                 IF PeriodTrans.FIND('-') THEN BEGIN
//                     REPEAT
//                         //Debit Staff Expense
//                         CreateJnlEntry(0, PostingGroup."Housing Levy Employer Acc",
//                         GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", EmployerDed.Amount, 0, 1, '',
//                         SaccoTransactionType, EmployerDed."Employee Code");

//                         //  //Credit Payables
//                         CreateJnlEntry(0, PostingGroup."Housing Levy Employer Acc",
//                         GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", 0, EmployerDed.Amount,
//                         0, '', SaccoTransactionType, EmployerDed."Employee Code");
//                     // //Debit Staff Expense
//                     // CreateJnlEntry(0, PeriodTrans."Journal Bal Acc",
//                     // GlobalDim1, GlobalDim2, PeriodTrans."Transaction Code" + '-' + PeriodTrans."Employee Code", PeriodTrans.Amount, 0, 1, '',
//                     // SaccoTransactionType, PeriodTrans."Employee Code");

//                     // //Credit Payables
//                     // CreateJnlEntry(0, PeriodTrans."Journal Account Code",
//                     // GlobalDim1, GlobalDim2, PeriodTrans."Transaction Code" + '-' + PeriodTrans."Employee Code", 0, PeriodTrans.Amount,
//                     // 0, '', SaccoTransactionType, PeriodTrans."Employee Code");

//                     UNTIL PeriodTrans.NEXT = 0;
//                 END;

//                 EmployerDed.RESET;
//                 EmployerDed.SETRANGE(EmployerDed."Employee Code", scard."Employee Code");
//                 EmployerDed.SETRANGE(EmployerDed."Payroll Period", SelectedPeriod);
//                 IF EmployerDed.FIND('-') THEN BEGIN

//                     REPEAT //added
//                         if EmployerDed."Transaction Code" = 'NSSF(I) EMPLOYER' then begin
//                             //Debit Staff Expense
//                             CreateJnlEntry(0, PostingGroup."NSSF Employer Account",
//                             GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", EmployerDed.Amount, 0, 1, '',
//                             SaccoTransactionType, EmployerDed."Employee Code");

//                             //Credit Payables
//                             CreateJnlEntry(0, PostingGroup."NSSF Payable Acc",
//                             GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", 0, EmployerDed.Amount,
//                             0, '', SaccoTransactionType, EmployerDed."Employee Code");

//                         end;
//                         if EmployerDed."Transaction Code" = 'NSSF(II) EMPLOYER' then begin
//                             //Debit Staff Expense
//                             CreateJnlEntry(0, PostingGroup."NSSF Employer Account",
//                             GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", EmployerDed.Amount, 0, 1, '',
//                             SaccoTransactionType, EmployerDed."Employee Code");

//                             //  //Credit Payables
//                             CreateJnlEntry(0, PostingGroup."NSSF Payable Acc",
//                             GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", 0, EmployerDed.Amount,
//                             0, '', SaccoTransactionType, EmployerDed."Employee Code");
//                         end;

//                         if EmployerDed."Transaction Code" = 'D022-PEN-EMPLOYER' then begin
//                             //Debit Staff Expense
//                             CreateJnlEntry(0, PostingGroup."Pension Employer Acc",
//                             GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", EmployerDed.Amount, 0, 1, '',
//                             SaccoTransactionType, EmployerDed."Employee Code");

//                             //  //Credit Payables
//                             CreateJnlEntry(0, PostingGroup."Pension Payable Acc",
//                             GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", 0, EmployerDed.Amount,
//                             0, '', SaccoTransactionType, EmployerDed."Employee Code");
//                         end;
//                     // if EmployerDed."Transaction Code" = 'D025-Housing Levy Employer Contrib' then begin
//                     //     //Debit Staff Expense
//                     //     CreateJnlEntry(0, PostingGroup."Housing Levy Employer Acc",
//                     //     GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", EmployerDed.Amount, 0, 1, '',
//                     //     SaccoTransactionType, EmployerDed."Employee Code");

//                     //     //  //Credit Payables
//                     //     CreateJnlEntry(0, PostingGroup."Housing Levy Employer Acc",
//                     //     GlobalDim1, GlobalDim2, EmployerDed."Transaction Code" + '-' + EmployerDed."Employee Code", 0, EmployerDed.Amount,
//                     //     0, '', SaccoTransactionType, EmployerDed."Employee Code");

//                     // end;

//                     UNTIL EmployerDed.NEXT = 0;
//                 end;

//             END;







//             trigger OnPostDataItem()
//             begin
//                 MESSAGE('Journals Created Successfully');
//             end;

//             trigger OnPreDataItem()
//             begin

//                 LineNumber := 10000;

//                 //Create batch*****************************************************************************
//                 GenJnlBatch.RESET;
//                 GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name", 'GENERAL');
//                 GenJnlBatch.SETRANGE(GenJnlBatch.Name, 'SALARIES');
//                 IF GenJnlBatch.FIND('-') = FALSE THEN BEGIN
//                     GenJnlBatch.INIT;
//                     GenJnlBatch."Journal Template Name" := 'GENERAL';
//                     GenJnlBatch.Name := 'SALARIES';
//                     GenJnlBatch.INSERT;
//                 END;
//                 // End Create Batch

//                 // Clear the journal Lines
//                 GeneraljnlLine.SETRANGE(GeneraljnlLine."Journal Batch Name", 'SALARIES');
//                 IF GeneraljnlLine.FIND('-') THEN
//                     GeneraljnlLine.DELETEALL;

//                 // "Slip/Receipt No" := UPPERCASE(objPeriod."Period Name");



//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(PeriodDate; PeriodDate)
//                 {
//                     Caption = 'Period Date';
//                     TableRelation = "PRL-Payroll Periods";
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         /*
//         PeriodFilter:=PeriodDate;//"prSalary Card".GETFILTER("Period Filter");
//         IF PeriodFilter='' THEN ERROR('You must specify the period filter');
//                      */

//         IF PeriodDate = 0D THEN ERROR('You must specify the period filter');
//         SelectedPeriod := PeriodDate;//"prSalary Card".GETRANGEMIN("Period Filter");
//                                      // Error('%1', PeriodDate);
//         PostingDate := CALCDATE('1M-1D', SelectedPeriod);
//         //PostingDate:=SelectedPeriod;
//         objPeriod.RESET;
//         objPeriod.SetRange("Date Opened", SelectedPeriod);
//         IF objPeriod.find('-') THEN begin
//             begin
//                 PeriodName := objPeriod."Period Name";
//                 "Slip/Receipt No" := format(objPeriod."Period Name");
//                 if objPeriod."JV No." = '' then begin
//                     gensetup.Get();
//                     JVHeader := NoSeriesManagement.GetNextNo(gensetup.JVs, 0D, True);
//                     objPeriod."JV No." := JVHeader;
//                     objPeriod.Modify();
//                     JVsheader.Init();
//                     JVsheader."No." := JVHeader;
//                     JVsheader."Document Date" := Today;
//                     JVsheader."User Name" := UserId;
//                     JVsheader."Posting Date" := objPeriod."Date Opened";
//                     JVsheader.Description := 'Payroll journals for the period ' + Format(objPeriod."Date Opened");
//                     JVsheader.Insert();
//                 end;

//             end;


//             //Error('%1%2%3', objPeriod."Date Opened", ' One ', "Slip/Receipt No");
//         end else
//             Error('%1', SelectedPeriod);



//     end;

//     var
//         JVsheader: Record "Journal Voucher Header";
//         JVSLine: Record "Journals Voucher Lines";
//         JVSLine2: Record "Journals Voucher Lines";
//         JVHeader: code[30];
//         NoSeriesManagement: Codeunit NoSeriesManagement;
//         gensetup: Record "Cash Office Setup";
//         PeriodTrans: Record "PRL-Period Transactions";
//         objEmp: Record "HRM-Employee C";
//         PeriodName: Text[30];
//         PeriodFilter: Text[30];
//         SelectedPeriod: Date;
//         objPeriod: Record "PRL-Payroll Periods";
//         ControlInfo: Record "HRM-Control-Information";
//         strEmpName: Text[150];
//         GeneraljnlLine: Record "Gen. Journal Line";
//         GenJnlBatch: Record "Gen. Journal Batch";
//         "Slip/Receipt No": Code[50];
//         LineNumber: Integer;
//         "Salary Card": Record "PRL-Salary Card";
//         TaxableAmount: Decimal;
//         PostingGroup: Record "PRL-Employee Posting Group";
//         GlobalDim1: Code[10];
//         GlobalDim2: Code[10];
//         TransCode: Record "PRL-Transaction Codes";
//         PostingDate: Date;
//         AmountToDebit: Decimal;
//         AmountToCredit: Decimal;
//         IntegerPostAs: Integer;

//         SaccoTransactionType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Welfare Contribution","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee","Welfare Contribution 2";
//         //EmployerDed: Record "50149";
//         EmployerDed: Record "PRL-Employer Deductions";
//         PeriodDate: Date;
//         GLS: Record "General Ledger Setup";


//     procedure CreateJnlEntry(AccountType: Enum "Gen. Journal Account Type"; AccountNo: Code[20]; GlobalDime1: Code[20]; GlobalDime2: Code[20]; Description: Text[50]; DebitAmount: Decimal; CreditAmount: Decimal; PostAs: Option " ",Debit,Credit; LoanNo: Code[20]; TransType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Welfare Contribution","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee","Welfare Contribution 2"; staffNo: code[50])
//     begin
//         if "Slip/Receipt No" = '' then Error('No Doc ');
//         //
//         LineNumber := LineNumber + 100;
//         /* GeneraljnlLine.INIT;
//         GeneraljnlLine."Journal Template Name" := 'GENERAL';
//         GeneraljnlLine."Journal Batch Name" := 'SALARIES';
//         GeneraljnlLine."Line No." := LineNumber;
//         GeneraljnlLine."Document No." := "Slip/Receipt No";
//         GeneraljnlLine.Validate("Document No.");
//         //GeneraljnlLine."Loan No":=LoanNo;
//         //GeneraljnlLine."Transaction Type":=TransType;
//         GeneraljnlLine."Posting Date" := PostingDate;
//         GeneraljnlLine."Account Type" := AccountType;
//         GeneraljnlLine."Account No." := AccountNo;
//         GeneraljnlLine.VALIDATE(GeneraljnlLine."Account No.");
//         GeneraljnlLine.Description := Description;
//         IF PostAs = PostAs::Debit THEN BEGIN
//              GeneraljnlLine."Debit Amount" := DebitAmount;
//             GeneraljnlLine.VALIDATE("Debit Amount");
//         END ELSE BEGIN
//             GeneraljnlLine."Credit Amount" := CreditAmount;
//             GeneraljnlLine.VALIDATE("Credit Amount");
//         END;
//         GeneraljnlLine."Shortcut Dimension 1 Code" := '10';
//         GeneraljnlLine.VALIDATE(GeneraljnlLine."Shortcut Dimension 1 Code");
//         GeneraljnlLine."Shortcut Dimension 2 Code" := '1031';
//         GeneraljnlLine.VALIDATE(GeneraljnlLine."Shortcut Dimension 2 Code");
//         GeneraljnlLine."Gen. Bus. Posting Group" := '';
//         GeneraljnlLine."Gen. Prod. Posting Group" := '';
//         IF GeneraljnlLine.Amount <> 0 THEN
//             GeneraljnlLine.INSERT; */

//         JVSLine.Init();
//         JVSLine."Line No." := LineNumber;
//         JVSLine."No." := JVHeader;
//         JVSLine."Creation Date" := PostingDate;
//         JVSLine."Document No." := "Slip/Receipt No";
//         JVSLine."Account Type" := AccountType;
//         JVSLine."Account No." := AccountNo;
//         JVSLine.Description := Description;
//         IF PostAs = PostAs::Debit THEN BEGIN
//             JVSLine.Amount := DebitAmount;
//         END ELSE BEGIN
//             JVSLine.Amount := -CreditAmount;
//         END;
//         JVSLine."Shortcut Dimension 1 Code" := '10';
//         JVSLine."Shortcut Dimension 2 Code" := '1033';
//         JVSLine."Staff No." := staffNo;
//         if JVSLine.Amount <> 0 then begin
//             //Error('Check Out');
//             // JVSLine2.Reset();
//             // JVSLine2.SetRange("No.", JVHeader);
//             // JVSLine2.SetRange("Document No.", JVSLine."Document No.");
//             // JVSLine2.SetRange("Account No.", JVSLine."Account No.");
//             // JVSLine2.SetRange("Staff No.", JVSLine."Staff No.");
//             // JVSLine2.SetRange(Amount, JVSLine.Amount);
//             // if JVSLine2.Find('-') then begin
//             //     JVSLine."Extra Info" := Format(staffNo) + ' - ' + Format(AccountNo);
//             //     JVSLine.Insert();
//             // end else
//             JVSLine.Insert();
//         end;




//     end;
// }

