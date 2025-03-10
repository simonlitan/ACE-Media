// table 52179077 "Prl-Approval"
// {
//     LookupPageId = "Prl-Approval List";
//     DrillDownPageId = "Prl-Approval List";

//     fields
//     {
//         field(1; "Payroll Period"; Date)
//         {
//             TableRelation = "PRL-Payroll Periods"."Date Opened" where(Closed = filter(false));
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

//     var
//         objPeriod: Record "PRL-Payroll Periods";
        
//         prlApproval: Record "Prl-Approval20";
//         periodTrans: Record "PRL-Period Transactions";
//         jnLine: Record 81;
//         GenJnlBatch: Record 232;
//         LineNumber: Integer;
//         sno: integer;


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

//     procedure GetPayrollJournal()
//     begin
//         prlApproval.reset;
//         prlApproval.setrange("Payroll Period", Rec."Payroll Period");
//         prlApproval.SetRange(Status, prlApproval.Status::Approved);
//         if prlApproval.Find('-') then begin
//             sno := 0;
//             periodTrans.Reset();
//             periodTrans.SetRange("Payroll Period", prlApproval."Payroll Period");
//             periodTrans.SetFilter("Transaction Code", '<>%1&<>%2&<>%3&<>%4&<>%5&<>%6&<>%7&<>%8&<>%9', 'TXBP', 'TXCHRG', 'DEFCON1', 'DEFCON2', 'INSR', 'NHIFINSR', 'PSNR', 'PNSR', 'GPAY');

//             if periodTrans.Find('-') then begin
//                 repeat

//                     prlJournal.Reset();
//                     prlJournal.SetRange("Transaction Code", periodTrans."Transaction Code");
//                     prlJournal.SetRange("Payroll Period", periodTrans."Payroll Period");
//                     if not prlJournal.Find('-') then begin

//                         sno := sno + 1;
//                         prlJournal.Init();
//                         prlJournal."Payroll Period" := prlApproval."Payroll Period";
//                         prlJournal."Document No." := periodTrans."Transaction Code" + '-' + Format(periodTrans."Payroll Period");
//                         prlJournal."Transaction Code" := periodTrans."Transaction Code";
//                         prlJournal."Transaction Name" := periodTrans."Transaction Name";
//                         prlJournal."GL Account" := periodTrans."Journal Account Code";
//                         prlJournal."Group Text" := periodTrans."Group Text";
//                         prlJournal."Line No." := jnLine."Line No." + sno;
//                         //if ((prlJournal."Transaction Code" <> 'DEFCON1') or (prlJournal."Transaction Code" <> 'DEFCON2')) then
//                         prlJournal.Insert();
//                     end;
//                 until periodTrans.Next() = 0;
//             end;

//             Message('Generated');
//         end;


//     end;

//     procedure PostPayrollJournal()
//     begin
//         prlApproval.reset;
//         prlApproval.setrange("Payroll Period", Rec."Payroll Period");
//         prlApproval.SetRange(Status, prlApproval.Status::Approved);
//         //prlApproval.SetRange("Journals Posted", false);
//         if prlApproval.Find('-') then begin



//             objPeriod.Reset();
//             objPeriod.SetRange("Date Opened", prlApproval."Payroll Period");
//             //objPeriod.SetRange(Closed, false);
//             if objPeriod.Find('-') then begin
//                 sno := 0;
//                 jnLine.Reset();
//                 jnLine.SetRange("Journal Template Name", 'GENERAL');
//                 jnLine.SetRange("Journal Batch Name", 'SALARIES');
//                 jnLine.DeleteAll();

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'EARNINGS');
//                 if prlJournal.Find('-') then begin
//                     repeat
//                         prlJournal.CalcFields(Amount);
//                         sno := sno + 1;
//                         jnLine.INIT;
//                         jnLine."Journal Template Name" := 'GENERAL';
//                         jnLine."Journal Batch Name" := 'SALARIES';
//                         jnLine."Line No." := jnLine."Line No." + sno;
//                         jnLine."Posting Date" := objPeriod."Date Opened";
//                         jnLine."Document No." := (objPeriod."Period Name");
//                         jnLine.Description := prlJournal."Transaction Name";
//                         jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                         jnLine."Account No." := prlJournal."GL Account";
//                         jnLine.Amount := round(prlJournal.Amount, 0.2);
//                         jnLine.Insert();
//                     until prlJournal.Next() = 0;
//                 end;

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'DEDUCTIONS');
//                 if prlJournal.Find('-') then begin
//                     repeat
//                         sno := sno + 1;

//                         prlJournal.CalcFields(Amount);
//                         jnLine.INIT;
//                         jnLine."Journal Template Name" := 'GENERAL';
//                         jnLine."Journal Batch Name" := 'SALARIES';
//                         jnLine."Line No." := jnLine."Line No." + sno;
//                         jnLine."Posting Date" := objPeriod."Date Opened";
//                         jnLine."Document No." := (objPeriod."Period Name");
//                         jnLine.Description := prlJournal."Transaction Name";
//                         jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                         jnLine."Account No." := prlJournal."GL Account";
//                         jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                         jnLine.Insert();

//                     until prlJournal.Next() = 0;
//                 end;

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'STATUTORIES');
//                 if prlJournal.Find('-') then begin
//                     repeat
//                         sno := sno + 1;

//                         prlJournal.CalcFields(Amount);
//                         jnLine.INIT;
//                         jnLine."Journal Template Name" := 'GENERAL';
//                         jnLine."Journal Batch Name" := 'SALARIES';
//                         jnLine."Line No." := jnLine."Line No." + sno;
//                         jnLine."Posting Date" := objPeriod."Date Opened";
//                         jnLine."Document No." := (objPeriod."Period Name");
//                         jnLine.Description := prlJournal."Transaction Name";
//                         jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                         jnLine."Account No." := prlJournal."GL Account";
//                         jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                         jnLine.Insert();

//                     until prlJournal.Next() = 0;
//                 end;

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'NET PAY');
//                 if prlJournal.Find('-') then begin
//                     repeat
//                         sno := sno + 1;

//                         prlJournal.CalcFields(Amount);
//                         jnLine.INIT;
//                         jnLine."Journal Template Name" := 'GENERAL';
//                         jnLine."Journal Batch Name" := 'SALARIES';
//                         jnLine."Line No." := jnLine."Line No." + sno;
//                         jnLine."Posting Date" := objPeriod."Date Opened";
//                         jnLine."Document No." := (objPeriod."Period Name");
//                         jnLine.Description := prlJournal."Transaction Name";
//                         jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                         jnLine."Account No." := prlJournal."GL Account";
//                         jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                         jnLine.Insert();

//                     until prlJournal.Next() = 0;
//                 end;

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'NITA');
//                 if prlJournal.Find('-') then begin
//                     repeat
//                         sno := sno + 1;

//                         prlJournal.CalcFields(Amount);
//                         jnLine.INIT;
//                         jnLine."Journal Template Name" := 'GENERAL';
//                         jnLine."Journal Batch Name" := 'SALARIES';
//                         jnLine."Line No." := jnLine."Line No." + sno;
//                         jnLine."Posting Date" := objPeriod."Date Opened";
//                         jnLine."Document No." := (objPeriod."Period Name");
//                         jnLine.Description := prlJournal."Transaction Name";
//                         jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                         jnLine."Account No." := '5000077';
//                         jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                         jnLine.Insert();

//                     until prlJournal.Next() = 0;
//                 end;



//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1|=%2|=%3|=%4|=%5|=%6', 'GEMPRPENSION', 'GRATUITY', 'NEMPRPENSION', 'NITA', 'NSSF EMPLOYER', 'HE-LEVI');
//                 if prlJournal.Find('-') then begin
//                     repeat
//                         sno := sno + 1;
//                         prlJournal.CalcFields(Amount);
//                         jnLine.INIT;
//                         jnLine."Journal Template Name" := 'GENERAL';
//                         jnLine."Journal Batch Name" := 'SALARIES';
//                         jnLine."Line No." := jnLine."Line No." + sno;
//                         jnLine."Posting Date" := objPeriod."Date Opened";
//                         jnLine."Document No." := (objPeriod."Period Name");
//                         jnLine.Description := prlJournal."Transaction Name";
//                         jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                         jnLine."Account No." := prlJournal."GL Account";
//                         jnLine.Amount := round(prlJournal.Amount, 0.2);
//                         jnLine.Insert();
//                     until prlJournal.Next() = 0;
//                 end;

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'GEMPRPENSION');
//                 if prlJournal.Find('-') then begin
//                     sno := sno + 1;
//                     prlJournal.CalcFields(Amount);
//                     jnLine.INIT;
//                     jnLine."Journal Template Name" := 'GENERAL';
//                     jnLine."Journal Batch Name" := 'SALARIES';
//                     jnLine."Line No." := jnLine."Line No." + sno;
//                     jnLine."Posting Date" := objPeriod."Date Opened";
//                     jnLine."Document No." := (objPeriod."Period Name");
//                     jnLine.Description := prlJournal."Transaction Name";
//                     jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                     jnLine."Account No." := '5000067';
//                     jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                     jnLine.Insert();
//                 end;
//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'NEMPRPENSION');
//                 if prlJournal.Find('-') then begin
//                     sno := sno + 1;
//                     prlJournal.CalcFields(Amount);
//                     jnLine.INIT;
//                     jnLine."Journal Template Name" := 'GENERAL';
//                     jnLine."Journal Batch Name" := 'SALARIES';
//                     jnLine."Line No." := jnLine."Line No." + sno;
//                     jnLine."Posting Date" := objPeriod."Date Opened";
//                     jnLine."Document No." := (objPeriod."Period Name");
//                     jnLine.Description := prlJournal."Transaction Name";
//                     jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                     jnLine."Account No." := '5000067';
//                     jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                     jnLine.Insert();
//                 end;


//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'GRATUITY');
//                 if prlJournal.Find('-') then begin
//                     sno := sno + 1;
//                     prlJournal.CalcFields(Amount);
//                     jnLine.INIT;
//                     jnLine."Journal Template Name" := 'GENERAL';
//                     jnLine."Journal Batch Name" := 'SALARIES';
//                     jnLine."Line No." := jnLine."Line No." + sno;
//                     jnLine."Posting Date" := objPeriod."Date Opened";
//                     jnLine."Document No." := (objPeriod."Period Name");
//                     jnLine.Description := prlJournal."Transaction Name";
//                     jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                     jnLine."Account No." := '5000003';
//                     jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                     jnLine.Insert();
//                 end;

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'NSSF EMPLOYER');
//                 if prlJournal.Find('-') then begin
//                     sno := sno + 1;
//                     prlJournal.CalcFields(Amount);
//                     jnLine.INIT;
//                     jnLine."Journal Template Name" := 'GENERAL';
//                     jnLine."Journal Batch Name" := 'SALARIES';
//                     jnLine."Line No." := jnLine."Line No." + sno;
//                     jnLine."Posting Date" := objPeriod."Date Opened";
//                     jnLine."Document No." := (objPeriod."Period Name");
//                     jnLine.Description := prlJournal."Transaction Name";
//                     jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                     jnLine."Account No." := '5000072';
//                     jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                     jnLine.Insert();
//                 end;

//                 prlJournal.Reset();
//                 prlJournal.SetRange("Payroll Period", prlApproval."Payroll Period");
//                 prlJournal.SetFilter("Group Text", '=%1', 'HE-LEVI');
//                 if prlJournal.Find('-') then begin
//                     sno := sno + 1;
//                     prlJournal.CalcFields(Amount);
//                     jnLine.INIT;
//                     jnLine."Journal Template Name" := 'GENERAL';
//                     jnLine."Journal Batch Name" := 'SALARIES';
//                     jnLine."Line No." := jnLine."Line No." + sno;
//                     jnLine."Posting Date" := objPeriod."Date Opened";
//                     jnLine."Document No." := (objPeriod."Period Name");
//                     jnLine.Description := prlJournal."Transaction Name";
//                     jnLine."Account Type" := jnLine."Account Type"::"G/L Account";
//                     jnLine."Account No." := '5000080';
//                     jnLine.Amount := -round(prlJournal.Amount, 0.2);
//                     jnLine.Insert();
//                 end;
//             end;

//             prlApproval."Journals Posted" := true;
//             prlApproval.Modify();
//             Message('Journals Generated');
//         end else
//             error('Check if approved or already posted');
//     end;


//     procedure GetLastEntryNo(): Integer;
//     var
//         EntNo: Record "Payroll Journal Lines";
//     begin
//         EntNo.Reset();
//         if EntNo.FindLast() then
//             exit(EntNo."Line No.")
//         else
//             exit(0);
//     end;


// }

