// table 52178884 "Prl-Test Approval"
// {
//     LookupPageId = "Prl-Approval List";
//     DrillDownPageId = "Prl-Approval List";

//     fields
//     {
//         field(1; "Payroll Period"; Date)
//         {
//             TableRelation = "PRL-Payroll Periods"."Date Opened";
//             trigger OnValidate()
//             begin
//                 objPeriod.Reset();
//                 objPeriod.SetRange("Date Opened", Rec."Payroll Period");
//                 if objPeriod.Find('-') then begin
//                     "Period Month" := objPeriod."Period Month";
//                     "Period Year" := objPeriod."Period Year";
//                     "Period Name" := objPeriod."Period Name";
//                 end;
//             end;
//         }
//         field(2; "Period Month"; integer)
//         {
//             Editable = false;
//         }
//         field(3; "Period Year"; integer)
//         {
//             Editable = false;
//         }
//         field(4; "Period Name"; Text[50])
//         {
//             Editable = false;

//         }
//         field(5; Status; Option)
//         {
//             OptionMembers = Pending,"Pending Approval",Approved;
//         }
//         field(6; "Net Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"),
//             "Transaction Code" = filter('NPAY')));
//         }
//         field(7; "Gross Amount"; Decimal)
//         {
//             FieldClass = FlowField;
//             CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"),
//             "Transaction Code" = filter('GPAY')));
//         }
//         field(8; "Total deductions"; Decimal)
//         {
//             FieldClass = FlowField;
//             CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"),
//            "Group Order" = const(8)));
//         }
//         field(9; "Total PE Cost"; Decimal)
//         {
//             FieldClass = FlowField;
//             CalcFormula = sum("PRL-Period Transactions".Amount where("Payroll Period" = field("Payroll Period"),
//             "Group Order" = filter(4 | 6 | 12 | 13 | 14 | 15 | 16), "Sub Group Order" = filter(0 | 1)));
//         }
//         field(10; code; Code[20])
//         {

//         }
//         field(11; "Journals Posted"; boolean)
//         {
//         }

//     }
//     procedure GetAmounts()
//     begin
//         PayrollJournalDetails.Reset();
//         PayrollJournalDetails.SetRange("Payroll Period", rec."Payroll Period");
//         if PayrollJournalDetails.Find('-') then
//             PayrollJournalDetails.DeleteAll();
//         PeriodTrans.SetAutoCalcFields("Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
//         PeriodTrans.Reset();
//         PeriodTrans.SetRange("Payroll Period", rec."Payroll Period");
//         PeriodTrans.SetFilter("Transaction Code", '<>%1', 'NITA');
//         if PeriodTrans.Find('-') then begin
//             repeat
//                 TransCode.Reset();
//                 TransCode.SetRange("Transaction Code", PeriodTrans."Transaction Code");
//                 if TransCode.Find('-') then begin
//                     if TransCode."GL Account" = '' then Error('No Gl Account available for %1', TransCode."Transaction Name");
//                     PayrollJournalDetails.Reset();
//                     PayrollJournalDetails.SetRange("Payroll Period", rec."Payroll Period");
//                     PayrollJournalDetails.SetRange("Transaction Code", TransCode."Transaction Code");
//                     PayrollJournalDetails.SetRange("Employee Code", PeriodTrans."Employee Code");
//                     if not PayrollJournalDetails.Find('-') then begin
//                         PayrollJournalDetails.Init();
//                         PayrollJournalDetails."Employee Code" := PeriodTrans."Employee Code";
//                         PayrollJournalDetails."Period Month" := PeriodTrans."Period Month";
//                         PayrollJournalDetails."Period Year" := PeriodTrans."Period Year";
//                         PayrollJournalDetails."Payroll Period" := PeriodTrans."Payroll Period";
//                         PayrollJournalDetails."Transaction Code" := TransCode."Transaction Code";
//                         PayrollJournalDetails."Transaction Name" := TransCode."Transaction Name";
//                         PayrollJournalDetails."G/L Account" := TransCode."GL Account";
//                         PayrollJournalDetails."Shortcut Dimension 1 Code" := PeriodTrans."Shortcut Dimension 1 Code";
//                         PayrollJournalDetails."Shortcut Dimension 2 Code" := PeriodTrans."Shortcut Dimension 2 Code";
//                         PayrollJournalDetails."Shortcut Dimension 6 Code" := PeriodTrans."Shortcut Dimension 6 Code";
//                         PayrollJournalDetails."Posting Description" := COPYSTR(rec."Period Name" + ' ' + TransCode."Transaction Name" + '(' + PeriodTrans."Shortcut Dimension 1 Code" + ')', 1, 50);
//                         if TransCode."Transaction Type" = TransCode."Transaction Type"::Income then begin
//                             PayrollJournalDetails.Amount := PeriodTrans.Amount;
//                             PayrollJournalDetails."Post as" := PayrollJournalDetails."Post as"::Debit;
//                         end else
//                             if TransCode."Transaction Type" = TransCode."Transaction Type"::Deduction then begin
//                                 PayrollJournalDetails.Amount := -PeriodTrans.Amount;
//                                 PayrollJournalDetails."Post as" := PayrollJournalDetails."Post as"::Credit;
//                             end;
//                         PayrollJournalDetails.Insert();
//                     end else begin
//                     end;
//                 end;
//             until PeriodTrans.Next() = 0;

//         end;
//         GetEmployerAmounts;
//         SumPerCode;
//         Message('Complete');
//     end;

//     procedure GetEmployerAmounts()
//     begin
//         PeriodTrans.SetAutoCalcFields("Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
//         PeriodTrans.Reset();
//         PeriodTrans.SetRange("Payroll Period", rec."Payroll Period");
//         if PeriodTrans.Find('-') then begin
//             repeat
//                 TransCode.Reset();
//                 TransCode.SetRange("Transaction Code", PeriodTrans."Transaction Code");
//                 TransCode.SetRange("Employer Deduction", true);
//                 if TransCode.Find('-') then begin
//                     EmplCode := TransCode."Transaction Code" + 'EMP';
//                     if TransCode."GL Employee Account" = '' then Error('No employer gl account available for %1', TransCode."Transaction Name");
//                     PayrollJournalDetails.Reset();
//                     PayrollJournalDetails.SetRange("Payroll Period", rec."Payroll Period");
//                     PayrollJournalDetails.SetRange("Transaction Code", EmplCode);
//                     PayrollJournalDetails.SetRange("Employee Code", PeriodTrans."Employee Code");
//                     if not PayrollJournalDetails.Find('-') then begin
//                         PayrollJournalDetails.Init();
//                         PayrollJournalDetails."Employee Code" := PeriodTrans."Employee Code";
//                         PayrollJournalDetails."Period Month" := PeriodTrans."Period Month";
//                         PayrollJournalDetails."Period Year" := PeriodTrans."Period Year";
//                         PayrollJournalDetails."Payroll Period" := PeriodTrans."Payroll Period";
//                         PayrollJournalDetails."Transaction Code" := EmplCode;
//                         PayrollJournalDetails."Transaction Name" := TransCode."Transaction Name";
//                         PayrollJournalDetails."G/L Account" := TransCode."GL Employee Account";
//                         PayrollJournalDetails."Balancing Account" := TransCode."GL Account";
//                         PayrollJournalDetails."Shortcut Dimension 1 Code" := PeriodTrans."Shortcut Dimension 1 Code";
//                         PayrollJournalDetails."Shortcut Dimension 2 Code" := PeriodTrans."Shortcut Dimension 2 Code";
//                         PayrollJournalDetails."Shortcut Dimension 6 Code" := PeriodTrans."Shortcut Dimension 6 Code";
//                         PayrollJournalDetails."Posting Description" := COPYSTR(rec."Period Name" + ' ' + TransCode."Transaction Name" + '(' + PeriodTrans."Shortcut Dimension 6 Code" + ')', 1, 50);
//                         if TransCode."Transaction Type" = TransCode."Transaction Type"::Deduction then begin
//                             PayrollJournalDetails.Amount := PeriodTrans.Amount;
//                             PayrollJournalDetails."Post as" := PayrollJournalDetails."Post as"::debit;
//                         end;
//                         PayrollJournalDetails.Insert();
//                     end else begin
//                     end;
//                 end;
//             until PeriodTrans.Next() = 0;
//         end;

//     end;

//     procedure SumPerCode()
//     var
//         CurAmount: Decimal;
//     begin
//         PayrollJournalSummary.Reset();
//         PayrollJournalSummary.SetRange("Payroll Period", rec."Payroll Period");
//         if PayrollJournalSummary.Find('-') then
//             PayrollJournalSummary.DeleteAll();
//         PayrollJournalDetails.Reset();
//         PayrollJournalDetails.SetRange("Payroll Period", rec."Payroll Period");
//         if PayrollJournalDetails.Find('-') then begin
//             CurAmount := 0;
//             repeat
//                 PayrollJournalSummary.Reset();
//                 PayrollJournalSummary.SetRange("Payroll Period", PayrollJournalDetails."Payroll Period");
//                 PayrollJournalSummary.SetRange("Transaction Code", PayrollJournalDetails."Transaction Code");
//                 PayrollJournalSummary.SetRange("Shortcut Dimension 1 Code", PayrollJournalDetails."Shortcut Dimension 1 Code");
//                 PayrollJournalSummary.SetRange("Shortcut Dimension 2 Code", PayrollJournalDetails."Shortcut Dimension 2 Code");
//                 if PayrollJournalSummary.Find('-') then begin
//                     CurAmount := PayrollJournalSummary.Amount;
//                     PayrollJournalSummary.Amount := CurAmount + PayrollJournalDetails.Amount;
//                     PayrollJournalSummary.Modify();
//                 end else begin
//                     PayrollJournalSummary."Transaction Code" := PayrollJournalDetails."Transaction Code";
//                     PayrollJournalSummary."Transaction Name" := PayrollJournalDetails."Transaction Name";
//                     PayrollJournalSummary."Payroll Period" := PayrollJournalDetails."Payroll Period";
//                     PayrollJournalSummary."G/L Account" := PayrollJournalDetails."G/L Account";
//                     PayrollJournalSummary."Balancing Account" := PayrollJournalDetails."Balancing Account";
//                     PayrollJournalSummary."Period Month" := PayrollJournalDetails."Period Month";
//                     PayrollJournalSummary."Period YearS" := PayrollJournalDetails."Period Year";
//                     PayrollJournalSummary."Posting Description" := PayrollJournalDetails."Posting Description";
//                     PayrollJournalSummary."Post as" := PayrollJournalDetails."Post as";
//                     PayrollJournalSummary."Shortcut Dimension 1 Code" := PayrollJournalDetails."Shortcut Dimension 1 Code";
//                     PayrollJournalSummary."Shortcut Dimension 2 Code" := PayrollJournalDetails."Shortcut Dimension 2 Code";
//                     PayrollJournalSummary.Amount := PayrollJournalDetails.Amount;
//                     PayrollJournalSummary.INSERT;
//                 end;
//             until PayrollJournalDetails.Next() = 0;
//         end;
//     end;


//     procedure CreateJnlEntry()
//     begin

//         GenJnlBatch.RESET;
//         GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name", 'GENERAL');
//         GenJnlBatch.SETRANGE(GenJnlBatch.Name, 'SALARIES');
//         IF not GenJnlBatch.FIND('-') then BEGIN
//             GenJnlBatch.INIT;
//             GenJnlBatch."Journal Template Name" := 'GENERAL';
//             GenJnlBatch.Name := 'SALARIES';
//             GenJnlBatch.INSERT;
//         END;
//         GeneraljnlLine.Reset();
//         GeneraljnlLine.SETRANGE(GeneraljnlLine."Journal Batch Name", 'SALARIES');
//         IF GeneraljnlLine.FIND('-') THEN
//             GeneraljnlLine.DELETEALL;
//         objPeriod.RESET;
//         objPeriod.SetRange("Date Opened", rec."Payroll Period");
//         if objPeriod.Find('-') then begin
//             PostingDate := CALCDATE('1M-1D', rec."Payroll Period");
//             "Slip/Receipt No" := objPeriod."Period Name";
//         end;
//         LineNumber := 1;
//         PayrollJournalSummary.Reset();
//         PayrollJournalSummary.SetRange("Payroll Period", rec."Payroll Period");
//         if PayrollJournalSummary.Find('-') then begin
//             repeat
//                 GeneraljnlLine.INIT;
//                 GeneraljnlLine."Journal Template Name" := 'GENERAL';
//                 GeneraljnlLine."Journal Batch Name" := 'SALARIES';
//                 GeneraljnlLine."Line No." := GeneraljnlLine."Line No." + LineNumber;
//                 GeneraljnlLine."Document No." := rec."Period Name";
//                 GeneraljnlLine."Posting Date" := PostingDate;
//                 GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
//                 GeneraljnlLine."Account No." := PayrollJournalSummary."G/L Account";
//                 GeneraljnlLine.VALIDATE(GeneraljnlLine."Account No.");
//                 GeneraljnlLine.Description := PayrollJournalSummary."Posting Description";
//                 GeneraljnlLine.Amount := Round(PayrollJournalSummary.Amount);
//                 GeneraljnlLine."Bal. Account No." := PayrollJournalSummary."Balancing Account";
//                 GeneraljnlLine.Validate(GeneraljnlLine."Bal. Account No.");
//                 GeneraljnlLine.Validate(GeneraljnlLine.Amount);
//                 GeneraljnlLine."Gen. Bus. Posting Group" := '';
//                 GeneraljnlLine."Gen. Prod. Posting Group" := '';
//                 GeneraljnlLine."Shortcut Dimension 1 Code" := PayrollJournalSummary."Shortcut Dimension 1 Code";
//                 ;
//                 GeneraljnlLine."Shortcut Dimension 2 Code" := PayrollJournalSummary."Shortcut Dimension 2 Code";
//                 ;
//                 GeneraljnlLine.VALIDATE(GeneraljnlLine."Shortcut Dimension 2 Code", PayrollJournalSummary."Shortcut Dimension 2 Code");
//                 GeneraljnlLine.VALIDATE(GeneraljnlLine."Shortcut Dimension 1 Code", PayrollJournalSummary."Shortcut Dimension 1 Code");
//                 GeneraljnlLine.INSERT;
//             until PayrollJournalSummary.Next() = 0;
//             Message('%1 Journal created successfully', "Slip/Receipt No");
//         end;


//      IF PeriodDate = 0D THEN ERROR('You must specify the period filter');
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
//                     JVHeader := NoSeriesMgt.GetNextNo(gensetup.JVs, 0D, True);
//                      objPeriod."JV No." := JVHeader;
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
//        end;



//     var
//         HrSetup: record "HRM-Setup";
//         EmplCode: Code[50];
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         PeriodTrans: Record "PRL-Period Transactions";
//         objEmp: Record "HRM-Employee C";
//         HrEmp: Record "HRM-Employee C";
//         PeriodName: Text[30];
//         DimenCode: Code[30];
//         PeriodFilter: Date;
//         PeriodMonth: Integer;
//         PeriodYear: Integer;
//         "Payroll Period": Date;
//         objPeriod: Record "PRL-Payroll Periods";
//         DimensionVal: Record "Dimension Value";
//         ControlInfo: Record "HRM-Control-Information";
//         strEmpName: Text[150];
//         GeneraljnlLine: Record "Gen. Journal Line";
//         GenJnlBatch: Record "Gen. Journal Batch";
//         "Slip/Receipt No": Code[50];
//         LineNumber: Integer;
//         SalaryCard: Record "PRL-Salary Card";
//         TaxableAmount: Decimal;
//         PostingGroup: Record "PRL-Employee Posting Group";
//         GlobalDim1: Code[30];
//         GlobalDim2: Code[30];
//         TransCode: Record "PRL-Transaction Codes";
//         AccountType: Enum "Gen. Journal Account Type";
//         PostingDate: Date;
//         AmountToDebit: Decimal;
//         AmountToCredit: Decimal;
//         IntegerPostAs: Integer;
//         SaccoTransactionType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Welfare Contribution","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee","Welfare Contribution 2";
//         EmployerDed: Record "PRL-Employer Deductions";
//         PeriodFilter2: Code[20];
//         PayrollJournalDetails: Record "Payroll Journal Details";
//         PayrollJournalSummary: Record "Payroll Journal Summary";

//         SelectedPeriod: Date;
//         PeriodDate: Date;
//         JVsheader: Record "Journal Voucher Header";
//         JVHeader: code[30];
//         JVSLine: Record "Journals Voucher Lines";


//         sno: integer;

//         prlJournal: Record "Payroll Journal Details";
//         prlApproval: Record "Prl-Approval";
//         gensetup: Record "Cash Office Setup";


//          procedure CreateJnlEntry(AccountType: Enum "Gen. Journal Account Type"; AccountNo: Code[20]; GlobalDime1: Code[20]; GlobalDime2: Code[20]; Description: Text[50]; DebitAmount: Decimal; CreditAmount: Decimal; PostAs: Option " ",Debit,Credit; LoanNo: Code[20]; TransType: Option " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Welfare Contribution","Deposit Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","Shares Capital","Loan Adjustment",Dividend,"Withholding Tax","Administration Fee","Welfare Contribution 2"; staffNo: code[50])
//     begin
//         if "Slip/Receipt No" = '' then Error('No Doc ');
//         //
//         LineNumber := LineNumber + 100;


//                  JVSLine.Init();
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
//         JVSLine."Shortcut Dimension 1 Code" := 'NAKS';
//         JVSLine."Shortcut Dimension 2 Code" := 'NAKS';
//         JVSLine."Staff No." := staffNo;
//         if JVSLine.Amount <> 0 then begin
//               JVSLine.Insert();
//         end;




//     end;










//     procedure ApprovePayroll()
//     begin
//         objPeriod.Reset();
//         objPeriod.SetRange("Date Opened", Rec."Payroll Period");
//         objPeriod.SetRange(Closed, false);
//         if objPeriod.Find('-') then begin
//             objPeriod."Approved For Closure" := true;
//             objPeriod.Modify(true);
//         end;
//     end;
// }







// procedure CreateJnlEntry()
//     begin

//         GenJnlBatch.RESET;
//         GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name", 'GENERAL');
//         GenJnlBatch.SETRANGE(GenJnlBatch.Name, 'SALARIES');
//         IF not GenJnlBatch.FIND('-') then BEGIN
//             GenJnlBatch.INIT;
//             GenJnlBatch."Journal Template Name" := 'GENERAL';
//             GenJnlBatch.Name := 'SALARIES';
//             GenJnlBatch.INSERT;
//         END;
//         objPeriod.RESET;
//         objPeriod.SetRange("Date Opened", rec."Payroll Period");
//         IF objPeriod.find('-') THEN begin
//             begin
//                 PeriodName := objPeriod."Period Name";
//                 "Slip/Receipt No" := format(objPeriod."Period Name");
//                 // "Slip/Receipt No" := objPeriod."Period Name";
//                 if objPeriod."JV No." = '' then begin
//                     gensetup.Get();
//                     JVHeader := NoSeriesMgt.GetNextNo(gensetup.JVs, 0D, True);
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


//             GeneraljnlLine.Reset();
//             // GeneraljnlLine.SETRANGE(GeneraljnlLine."Journal Batch Name", 'SALARIES');
//             GeneraljnlLine.SetRange(GeneraljnlLine."No.", JVHeader);
//             IF GeneraljnlLine.FIND('-') THEN
//                 GeneraljnlLine.DELETEALL;
//             objPeriod.RESET;
//             objPeriod.SetRange("Date Opened", rec."Payroll Period");
//             if objPeriod.Find('-') then begin
//                 PostingDate := CALCDATE('1M-1D', rec."Payroll Period");
//                 "Slip/Receipt No" := objPeriod."Period Name";
//             end;
//             LineNumber := 1000;
//             PayrollJournalSummary.Reset();
//             PayrollJournalSummary.SetRange("Payroll Period", rec."Payroll Period");
//             if PayrollJournalSummary.Find('-') then begin
//                 repeat
//                     GeneraljnlLine.INIT;
//                     // GeneraljnlLine."Journal Template Name" := 'GENERAL';
//                     // GeneraljnlLine."Journal Batch Name" := 'SALARIES';
//                     // GeneraljnlLine."Line No." := GeneraljnlLine."Line No." + LineNumber;
//                     // GeneraljnlLine."Document No." := rec."Period Name";
//                     // GeneraljnlLine."Creation Date" := PostingDate;
//                     // GeneraljnlLine."Account Type" := GeneraljnlLine."Account Type"::"G/L Account";
//                     // GeneraljnlLine."Account No." := PayrollJournalSummary."G/L Account";
//                     // GeneraljnlLine.VALIDATE(GeneraljnlLine."Account No.");
//                     // GeneraljnlLine.Description := PayrollJournalSummary."Posting Description";
//                     // GeneraljnlLine.Amount := Round(PayrollJournalSummary.Amount);
//                     // GeneraljnlLine."Bal. Account No." := PayrollJournalSummary."Balancing Account";
//                     // GeneraljnlLine.Validate(GeneraljnlLine."Bal. Account No.");
//                     // GeneraljnlLine.Validate(GeneraljnlLine.Amount);
//                     // //GeneraljnlLine."Gen. Bus. Posting Group" := '';
//                     // // GeneraljnlLine."Gen. Prod. Posting Group" := '';
//                     // GeneraljnlLine."Shortcut Dimension 1 Code" := PayrollJournalSummary."Shortcut Dimension 1 Code";

//                     // GeneraljnlLine."Shortcut Dimension 2 Code" := PayrollJournalSummary."Shortcut Dimension 2 Code";

//                     // GeneraljnlLine.VALIDATE(GeneraljnlLine."Shortcut Dimension 2 Code", PayrollJournalSummary."Shortcut Dimension 2 Code");
//                     // GeneraljnlLine.VALIDATE(GeneraljnlLine."Shortcut Dimension 1 Code", PayrollJournalSummary."Shortcut Dimension 1 Code");

//                     // GeneraljnlLine.Init();
//                     //GeneraljnlLine."Line No." := LineNumber;
//                     GeneraljnlLine."Line No." := GeneraljnlLine."Line No." + LineNumber;
//                     GeneraljnlLine."No." := JVHeader;
//                     GeneraljnlLine."Creation Date" := PostingDate;
//                     GeneraljnlLine."Document No." := "Slip/Receipt No";
//                     GeneraljnlLine."Account Type" := AccountType;
//                     GeneraljnlLine."Account No." := PayrollJournalSummary."G/L Account";
//                     GeneraljnlLine.Description := PayrollJournalSummary."Posting Description";
//                     if PayrollJournalSummary."Post as" = PayrollJournalSummary."Post as"::Debit then begin
//                         //GeneraljnlLine.Amount := PayrollJournalSummary.Amount;
//                         GeneraljnlLine."Debit Amount" := Round(PayrollJournalSummary.Amount);
//                         GeneraljnlLine.Validate(GeneraljnlLine.Amount);
//                     END ELSE BEGIN
//                         GeneraljnlLine.Amount := -PayrollJournalSummary.Amount;
//                     end;



//                     GeneraljnlLine."Shortcut Dimension 1 Code" := 'NAKS';
//                     GeneraljnlLine."Shortcut Dimension 2 Code" := 'NAKS';
//                     //GeneraljnlLine."Staff No." := staffNo;
//                     if GeneraljnlLine.Amount <> 0 then begin



//                         GeneraljnlLine.INSERT;
//                     end;
//                 until PayrollJournalSummary.Next() = 0;
//                 Message('%1 Journal created successfully', "Slip/Receipt No");
//             end;
//         END;
//     END;










