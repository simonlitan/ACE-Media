// report 52178533 "Casual List Report"

// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './priTaxcasual.rdlc';

//     dataset
//     {
//         dataitem(DataItem1000000000; 50147)
//         {
//             DataItemTableView = WHERE (Transaction Code=FILTER(GPAY));
//             RequestFilterFields = "Employee Code";

//             trigger OnAfterGetRecord()
//             begin
//                 mBPAY:=0;
//                 "Housing Allowance":=0;
//                 "Transport Allowance":=0;
//                 "Leave Allowance":=0;
//                 OT:=0;
//                 "Directors Fees":=0;
//                 "Lum[ Sum":=0;
//                 "other allowance":=0;
//                 "total cash pay":=0;
//                 "value of car":=0;
//                 "other non cash":=0;
//                 "total non cash":=0;
//                 "global income":=0;
//                 "type of housing":=0;
//                 "rent of house":=0;
//                 "Computed Rent":=0;
//                 "Rent Recovered":=0;
//                 "net Housing":=0;
//                 "total gross pay":=0;
//                 "30% cash":=0;
//                 "Actual contribution":=0;
//                 "permisable limit":=0;
//                 "mortgage interest":=0;
//                 HOSp:=0;
//                 "Amount of benefit":=0;
//                 "taxable pay":=0;
//                 "total pable slab":=0;
//                 "monthly Relief":=0;
//                 "insurance relief":=0;
//                 PAYE:=0;
                
//                   PeriodTran1.RESET;
//                   PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                   PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                   PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",'TXBP');
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                   IF PeriodTran1.FIND('-') THEN BEGIN
//                    mBPAY:=PeriodTran1.Amount;
//                   END;
                
//                   transCode.RESET;
//                   transCode.SETRANGE(transCode."itax Grouping",transCode."itax Grouping"::"House Allowance");
//                   IF transCode.FIND('-') THEN REPEAT
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",transCode."Transaction Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "Housing Allowance":="Housing Allowance"+PeriodTran1.Amount;
//                     END;
//                    UNTIL transCode.NEXT=0;
                
//                   transCode.RESET;
//                   transCode.SETRANGE(transCode."itax Grouping",transCode."itax Grouping"::"Transport Allowance");
//                   IF transCode.FIND('-') THEN REPEAT
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",transCode."Transaction Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "Transport Allowance":="Transport Allowance"+PeriodTran1.Amount;
//                     END;
//                    UNTIL transCode.NEXT=0;
                
//                   transCode.RESET;
//                   transCode.SETRANGE(transCode."itax Grouping",transCode."itax Grouping"::OT);
//                   IF transCode.FIND('-') THEN REPEAT
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",transCode."Transaction Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      OT:=OT+PeriodTran1.Amount;
//                     END;
//                    UNTIL transCode.NEXT=0;
                
//                   transCode.RESET;
//                   transCode.SETRANGE(transCode."itax Grouping",transCode."itax Grouping"::"Directors Fee");
//                   IF transCode.FIND('-') THEN REPEAT
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",transCode."Transaction Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "Directors Fees":="Directors Fees"+PeriodTran1.Amount;
//                     END;
//                    UNTIL transCode.NEXT=0;
//                 /*
//                 //----------------------------------
//                   transCode.RESET;
//                   transCode.SETRANGE(transCode."itax Grouping",transCode."itax Grouping"::" ");
//                   transCode.SETRANGE(transCode."Transaction Type",transCode."Transaction Type"::Income);
//                   IF transCode.FIND('-') THEN REPEAT
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",transCode."Transaction Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "other allowance":="other allowance"+PeriodTran1.Amount;
//                     END;
//                    UNTIL transCode.NEXT=0;
//                  */
                
//                   //Actual contribution------------
//                   transCode.RESET;
//                   transCode.SETRANGE(transCode."Special Transactions",transCode."Special Transactions"::"Defined Contribution");
//                   IF transCode.FIND('-') THEN REPEAT
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",transCode."Transaction Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "Actual contribution":="Actual contribution"+PeriodTran1.Amount;
//                     END;
//                    UNTIL transCode.NEXT=0;
                
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",'NSSF');
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "Actual contribution":="Actual contribution"+PeriodTran1.Amount;
//                     END;
                
//                    //"monthly Relief":=0;
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",'PSNR');
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "monthly Relief":="monthly Relief"+PeriodTran1.Amount;
//                     END;
                
//                    //"insurance relief":=0;  INSR
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",'INSR');
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      "insurance relief":="insurance relief"+PeriodTran1.Amount;
//                     END;
                
//                 //PAYE
//                     PeriodTran1.RESET;
//                     PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions_"."Employee Code");
//                     PeriodTran1.SETRANGE(PeriodTran1."Transaction Code",'PAYE');
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Period",SelectedPeriod);
//                     PeriodTran1.SETRANGE(PeriodTran1."Payroll Code","Payroll Code");
//                     IF PeriodTran1.FIND('-') THEN BEGIN
//                      PAYE:=PAYE+PeriodTran1.Amount;
//                     END;
                
                
//                   MakeExcelDataBody;

//             end;

//             trigger OnPostDataItem()
//             begin
//                 CreateExcelbook;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 UserSetup.GET(USERID);
//                 //IF UserSetup."Payroll Accountant"=FALSE THEN ERROR('Under Construction');


//                 //SETFILTER("Payroll Code",'=%1',UserSetup."Payroll Code");
//                 SETFILTER("prPeriod Transactions_"."Payroll Period",'=%1',SelectedPeriod);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field("Selected Period";SelectedPeriod)
//                 {
//                     TableRelation = "prPayroll Periods";
//                 }
//                 field("Payroll Code";payrollcode)
//                 {
//                     TableRelation = "prPayroll Type";
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

//         IF SelectedPeriod=0D THEN ERROR('You must specify the period filter');

//         //IF PrintToExcel THEN
//          MakeExcelInfo;
//     end;

//     var
//         PeriodTrans: Record "50147";
//         EmployeeName: Text[100];
//         objPeriod: Record "50136";
//         UserSetup: Record "91";
//         SelectedPeriod: Date;
//         PeriodFilter: Text[30];
//         objEmp: Record "50169";
//         controlinfo: Record "50170";
//         NoofEntries: Integer;
//         ExcelBuf: Record "370" temporary;
//         PrintToExcel: Boolean;
//         "Period Names": Text[30];
//         dimVal: Record "349";
//         mCount: Integer;
//         mPercDist: Decimal;
//         mPercLeave: Decimal;
//         "HR Timesheets": Record "18";
//         FromDate: Date;
//         ToDate: Date;
//         mHours: Decimal;
//         mPerc: Decimal;
//         HRday: Integer;
//         totMhours: Decimal;
//         mDate: Record "2000000007";
//         mPercTotal: Decimal;
//         mHorPercTotal: array [100] of Decimal;
//         PeriodTran1: Record "50147";
//         i: Integer;
//         approved: Record "18";
//         dt1: Date;
//         dt2: Date;
//         objholidays: Record "50192";
//         "no of holidays": Integer;
//         objbasecalenderchange: Record "7601";
//         DATE1: Date;
//         DATE2: Date;
//         tempDate: Date;
//         mtotalGrosspay: Decimal;
//         mRealTotals: Decimal;
//         mDay: Integer;
//         Text000: Label 'Period: %1';
//         Text001: Label 'Before';
//         Text002: Label 'Salary Distribution';
//         Text003: Label 'More than';
//         Text004: Label 'Aged by %1';
//         Text005: Label 'Total for %1';
//         Text006: Label 'Aged as of %1';
//         Text007: Label 'Aged by %1';
//         Text008: Label 'All Amounts in LCY';
//         Text009: Label 'Due Date,Posting Date,Document Date';
//         Text010: Label 'The Date Formula %1 cannot be used. Try to restate it. E.g. 1M+CM instead of CM+1M.';
//         Text011: Label 'Data';
//         Text012: Label 'Aged Accounts Receivable';
//         Text013: Label 'Company Name';
//         Text014: Label 'Report No.';
//         Text015: Label 'Report Name';
//         Text016: Label 'User ID';
//         Text017: Label 'Date';
//         Text018: Label 'Customer Filters';
//         Text019: Label 'Cust. Ledger Entry Filters';
//         myFilter: Text[1000];
//         Trans: Record "50137";
//         mNetPay: Decimal;
//         mPAYE: Decimal;
//         mBPAY: Decimal;
//         payrollcode: Code[50];
//         "Housing Allowance": Decimal;
//         "Transport Allowance": Decimal;
//         "Leave Allowance": Decimal;
//         OT: Decimal;
//         "Directors Fees": Decimal;
//         "Lum[ Sum": Decimal;
//         "other allowance": Decimal;
//         "total cash pay": Decimal;
//         "value of car": Decimal;
//         o: Decimal;
//         "other non cash": Decimal;
//         "total non cash": Decimal;
//         "global non income": Decimal;
//         "global income": Decimal;
//         "type of housing": Decimal;
//         "rent income": Decimal;
//         "rent of house": Decimal;
//         "Computed Rent": Decimal;
//         "Rent Recovered": Decimal;
//         "net Housing": Decimal;
//         "total Gross": Decimal;
//         "total gross pay": Decimal;
//         "30% cash": Decimal;
//         "Actual contribution": Decimal;
//         "permisible interest": Decimal;
//         "mortgage interest": Decimal;
//         HOSp: Decimal;
//         "Amount of benefit": Decimal;
//         "taxable pay": Decimal;
//         "total pable slab": Decimal;
//         "monthly Relief": Decimal;
//         "insurance relief": Decimal;
//         "permisable limit": Decimal;
//         slab: Decimal;
//         transCode: Record "50137";
//         PAYE: Decimal;

//     [Scope('Internal')]
//     procedure MakeExcelInfo()
//     begin
//         //ExcelBuf.SetUseInfoSheed;
//         ExcelBuf.ClearNewRow;
//         MakeExcelDataHeader;
//     end;

//     local procedure MakeExcelDataHeader()
//     begin
//         ExcelBuf.NewRow;
//         ExcelBuf.AddColumn('Pin of Employee',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Name of Employee',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Residential status',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Type of Employee',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Taxable Pay',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Housing Allowance',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Transport Allowance',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Leave Allowance',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('OT',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Directors Fees',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Lum[ sum',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('oter allowance',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('total cash pay',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Value of Car',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('other non cash',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('total non cash',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Global income',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('type of Housing',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Rent of house',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('computed  Rent',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Rent Recovered',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('net housing',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('total gross  pay',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('30% cash',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Actual contribution',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('permisable limit',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('mortgage interest',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('HOSp',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('Amount of Benefit',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('taxable pay',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('total pable, slab',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('monthly relief',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('insurance relief',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.AddColumn('PAYE',FALSE,'',FALSE,FALSE,FALSE,'',0);
//         ExcelBuf.NewRow;
//     end;

//     [Scope('Internal')]
//     procedure MakeExcelDataBody()
//     var
//         BlankFiller: Text[250];
//     begin
//         objEmp.RESET;
//         objEmp.SETRANGE(objEmp."No.","prPeriod Transactions_"."Employee Code");
//         IF objEmp.FIND('-') THEN BEGIN
//           ExcelBuf.AddColumn(objEmp."PIN No.",FALSE,'',FALSE,FALSE,TRUE,'',0);
//           ExcelBuf.AddColumn(objEmp."First Name"+' '+objEmp."Middle Name"+' '+objEmp."Last Name",FALSE,'',FALSE,FALSE,TRUE,'',1);

//           ExcelBuf.AddColumn(objEmp."Residential status",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn(objEmp."Employee Type",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn(mBPAY,FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Housing Allowance",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Transport Allowance",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Leave Allowance",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn(OT,FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Directors Fees",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Lum[ Sum",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("other allowance",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("total cash pay",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("value of car",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("other non cash",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("total non cash",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("global income",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn('Benefit not given',FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("rent of house",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Computed Rent",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Rent Recovered",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("net Housing",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("total gross pay",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("30% cash",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Actual contribution",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("permisable limit",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("mortgage interest",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn(HOSp,FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("Amount of benefit",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("taxable pay",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("total pable slab",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("monthly Relief",FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn("insurance relief",FALSE,'',FALSE,FALSE,FALSE,'',0);
//             ExcelBuf.AddColumn(0,FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.AddColumn(PAYE,FALSE,'',FALSE,FALSE,FALSE,'',0);
//           ExcelBuf.NewRow;
//         END;
//     end;

//     [Scope('Internal')]
//     procedure CreateExcelbook()
//     begin
        
//         ExcelBuf.CreateBook('iTax');
//            ExcelBuf.CreateBookAndOpenExcel('Sheet1','Sheet1','iTax',USERID);
//           // ExcelBuf.CreateBookAndOpenExcel(SheetName,ReportHeader,CompanyName,UserID2)
//           // ExcelBuf.CreateBookAndOpenExcel(FileName,SheetName,ReportHeader,CompanyName2,UserID2)
//         //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
//         ExcelBuf.GiveUserControl;
//         MESSAGE('DONE');
//           /*
//         ExcelBuf.CreateBook('iTax');
//            ExcelBuf.CreateBookAndOpenExcel('Sheet1','Sheet1','iTax',USERID);
//           // ExcelBuf.CreateBookAndOpenExcel(SheetName,ReportHeader,CompanyName,UserID2)
//           // ExcelBuf.CreateBookAndOpenExcel(FileName,SheetName,ReportHeader,CompanyName2,UserID2)
//         //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
//         ExcelBuf.GiveUserControl;
//         MESSAGE('DONE');
//             */

//     end;
// }


