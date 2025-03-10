report 52178536 "Returns Report"
{
    DefaultLayout = rdlc;
    RDLCLayout = './Reports/SSR/Returns.rdl';
    dataset
    {
        dataitem("prPeriod Transactions_"; "PRL-Period Transactions")
        {
            DataItemTableView = WHERE("Transaction Code" = FILTER('GPAY'));
            RequestFilterFields = "Employee Code";
            column(EmployeeCode_prPeriodTransactions_; "Employee Code")
            {
            }
            column(EmployeeName; EmployeeName)
            {

            }
            column(TransactionCode_prPeriodTransactions_; "Transaction Code")
            {
            }
            column(GroupText_prPeriodTransactions_; "Group Text")
            {
            }
            column(TransactionName_prPeriodTransactions_; "Transaction Name")
            {
            }
            column(Emp_Pin; objEmp."PIN Number")
            {

            }
            column(Residential_Status; objEmp."Residential Address2")
            {

            }
            column(EmpType; objemp."Employee Type")
            {

            }
              column(FullName;FullName)
            {

            }
            column(Employee_Classification; "Employee Classification")
            {

            }
            column(taxable_pay; "taxable pay")
            {

            }
            column(Housing_Allowance; "Housing Allowance")
            {

            }
            column(Transport_Allowance; "Transport Allowance")
            {

            }
            column(Leave_Allowance; "Leave Allowance")
            {

            }
            column(OT; OT)
            {

            }
            column(Directors_Fees; "Directors Fees")
            {

            }
            column(Lum__Sum; "Lum[ Sum")
            {

            }
            column(other_allowance; "other allowance")
            {

            }
            column(type_of_housing; "type of housing")
            {

            }
            column(Actual_contribution; "Actual contribution")
            {

            }
            column(insurance_relief; "insurance relief")
            {

            }
            column(PAYE; PAYE)
            {

            }
            column(NetPay;ObjNetpay."Net Pay")
            {

            }
            trigger OnAfterGetRecord()
            begin
                mBPAY := 0;
                "Housing Allowance" := 0;
                "Transport Allowance" := 0;
                "Leave Allowance" := 0;
                OT := 0;
                "Directors Fees" := 0;
                "Lum[ Sum" := 0;
                "other allowance" := 0;
                "total cash pay" := 0;
                "value of car" := 0;
                "other non cash" := 0;
                "total non cash" := 0;
                "global income" := 0;
                "type of housing" := 0;
                "rent of house" := 0;
                "Computed Rent" := 0;
                "Rent Recovered" := 0;
                "net Housing" := 0;
                "total gross pay" := 0;
                "30% cash" := 0;
                "Actual contribution" := 0;
                "permisable limit" := 0;
                "mortgage interest" := 0;
                HOSp := 0;
                "Amount of benefit" := 0;
                "taxable pay" := 0;
                "total pable slab" := 0;
                "monthly Relief" := 0;
                "insurance relief" := 0;
                PAYE := 0;
                NetPay :=0;
                //Residential Address2 := 0;

                PeriodTran1.RESET;
                PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", 'TXBP');
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                IF PeriodTran1.FIND('-') THEN BEGIN
                    mBPAY := PeriodTran1.Amount;
                END;
                 begin
                objEmp.Reset();
                objEmp.SetRange("No.", "Employee Code");
                if objEmp.Find('-') then
                    FullName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    //NetPay :=0;
            
                //  ObjNetpay.Reset();
                //  ObjNetpay.SetRange(ObjNetpay."Employee Code", ObjNetpay."Employee Code");
                //  ObjNetpay.SetRange(ObjNetpay."Payroll Period", ObjNetpay."Payroll Period");

                //  if ObjNetpay.Find('_') then
                //  NetPay := ObjNetpay."Net Pay"
            end;
                   //  NetPay
                 ObjNetpay.RESET;
                ObjNetpay.SETRANGE(ObjNetpay."Employee Code", "prPeriod Transactions_"."Employee Code");
              //  ObjNetpay.SETRANGE(ObjNetpay."Transaction Code", '');
                ObjNetpay.SETRANGE(ObjNetpay."Payroll Period", SelectedPeriod);
                ObjNetpay.SETRANGE(ObjNetpay."Payroll Code", "Payroll Code");
                IF ObjNetpay.FIND('-') THEN BEGIN
                    NetPay := ObjNetpay."Net Pay"
                END;
    



                transCode.RESET;
                //  transCode.SETRANGE(transCode."itax Grouping", transCode."itax Grouping"::"House Allowance");
                transCode.SETRANGE(transCode."Transaction Code", 'B001');
                IF transCode.FIND('-') THEN
                    REPEAT
                        PeriodTran1.RESET;
                        PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                        PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                        IF PeriodTran1.FIND('-') THEN BEGIN
                            "Housing Allowance" := "Housing Allowance" + PeriodTran1.Amount;
                        END;
                    UNTIL transCode.NEXT = 0;

                transCode.RESET;
                //  transCode.SETRANGE(transCode."itax Grouping", transCode."itax Grouping"::"Transport Allowance");
                transCode.SETRANGE(transCode."Transaction Code", 'E008');
                IF transCode.FIND('-') THEN
                    REPEAT
                        PeriodTran1.RESET;
                        PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                        PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                        IF PeriodTran1.FIND('-') THEN BEGIN
                            "Transport Allowance" := "Transport Allowance" + PeriodTran1.Amount;
                        END;
                    UNTIL transCode.NEXT = 0;

                // transCode.RESET;
                // //  transCode.SETRANGE(transCode."itax Grouping", transCode."itax Grouping"::OT);
                // // transCode.SETRANGE(transCode."itax Grouping", transCode."itax Grouping"::OT);
                // IF transCode.FIND('-') THEN
                //     REPEAT
                //         PeriodTran1.RESET;
                //         PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                //         PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", transCode."Transaction Code");
                //         PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                //         PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                //         IF PeriodTran1.FIND('-') THEN BEGIN
                //             OT := OT + PeriodTran1.Amount;
                //         END;
                //     UNTIL transCode.NEXT = 0;

                // transCode.RESET;
                // //transCode.SETRANGE(transCode."itax Grouping", transCode."itax Grouping"::"Directors Fee");
                // // transCode.SETRANGE(transCode."itax Grouping", transCode."itax Grouping"::"Directors Fee");
                // IF transCode.FIND('-') THEN
                //     REPEAT
                //         PeriodTran1.RESET;
                //         PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                //         PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", transCode."Transaction Code");
                //         PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                //         PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                //         IF PeriodTran1.FIND('-') THEN BEGIN
                //             "Directors Fees" := "Directors Fees" + PeriodTran1.Amount;
                //         END;
                //     UNTIL transCode.NEXT = 0;

                // //----------------------------------
                // transCode.RESET;
                // transCode.SETRANGE(transCode."itax Grouping", transCode."itax Grouping"::" ");
                // transCode.SETRANGE(transCode."Transaction Type", transCode."Transaction Type"::Income);
                // IF transCode.FIND('-') THEN
                //     REPEAT
                //         PeriodTran1.RESET;
                //         //PeriodTran1.SETRANGE(PeriodTran1."Employee Code","prPeriod Transactions"."Employee Code");
                //         PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", transCode."Transaction Code");
                //         PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                //         PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                //         IF PeriodTran1.FIND('-') THEN BEGIN
                //             "other allowance" := "other allowance" + PeriodTran1.Amount;
                //         END;
                //     UNTIL transCode.NEXT = 0;



                //Actual contribution------------
                transCode.RESET;
                transCode.SETRANGE(transCode."Special Transactions", transCode."Special Transactions"::"Defined Contribution");
                IF transCode.FIND('-') THEN
                    REPEAT
                        PeriodTran1.RESET;
                        PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                        PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", transCode."Transaction Code");
                        PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                        PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                        IF PeriodTran1.FIND('-') THEN BEGIN
                            "Actual contribution" := "Actual contribution" + PeriodTran1.Amount;
                        END;
                    UNTIL transCode.NEXT = 0;

                PeriodTran1.RESET;
                PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", 'NSSF');
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                IF PeriodTran1.FIND('-') THEN BEGIN
                    "Actual contribution" := "Actual contribution" + PeriodTran1.Amount;
                END;

                //"monthly Relief":=0;
                PeriodTran1.RESET;
                PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", 'PSNR');
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                IF PeriodTran1.FIND('-') THEN BEGIN
                    "monthly Relief" := "monthly Relief" + PeriodTran1.Amount;
                END;

                //"insurance relief":=0;  INSR
                PeriodTran1.RESET;
                PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", '');
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                IF PeriodTran1.FIND('-') THEN BEGIN
                    "insurance relief" := "insurance relief" + PeriodTran1.Amount;
                END;

                //PAYE
                PeriodTran1.RESET;
                PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", 'PAYE');
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                IF PeriodTran1.FIND('-') THEN BEGIN
                    PAYE := PAYE + PeriodTran1.Amount;
                END;
                //NPAY
                PeriodTran1.RESET;
                PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", 'NPAY');
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                IF PeriodTran1.FIND('-') THEN BEGIN
                    NetPay := NetPay + PeriodTran1.Amount;
                END;

              //  NetPay
                //      PeriodTran1.RESET;
                // PeriodTran1.SETRANGE(PeriodTran1."Employee Code", "prPeriod Transactions_"."Employee Code");
                // PeriodTran1.SETRANGE(PeriodTran1."Transaction Code", '');
                // PeriodTran1.SETRANGE(PeriodTran1."Payroll Period", SelectedPeriod);
                // PeriodTran1.SETRANGE(PeriodTran1."Payroll Code", "Payroll Code");
                // IF PeriodTran1.FIND('-') THEN BEGIN
                //     NetPay := NetPay + PeriodTran1.Amount;
                // END;


                //MakeExcelDataBody;

            end;

            trigger OnPostDataItem()
            begin
                //  CreateExcelbook;
            end;

            trigger OnPreDataItem()
            begin
                UserSetup.GET(USERID);
                //IF UserSetup."Payroll Accountant"=FALSE THEN ERROR('Under Construction');


                //SETFILTER("Payroll Code",'=%1',UserSetup."Payroll Code");
                SETFILTER("prPeriod Transactions_"."Payroll Period", '=%1', SelectedPeriod);
            end;
        }
    }
    requestpage
    {

        layout
        {
            area(content)
            {
                field("Selected Period"; SelectedPeriod)
                {
                    TableRelation = "PRL-Payroll Periods";
                    ApplicationArea = all;
                }
                field("Payroll Code"; payrollcode)
                {
                    TableRelation = "PRL-Payroll Type";
                    ApplicationArea = all;
                }
            }
        }

        actions
        {
        }
    }


    trigger OnPreReport()
    begin

        IF SelectedPeriod = 0D THEN ERROR('You must specify the period filter');

        //IF PrintToExcel THEN
        // MakeExcelInfo;
    end;

    var

        PeriodTrans: Record "PRL-Period Transactions";
        EmployeeName: Text[100];
        objPeriod: Record "PRL-Payroll Periods";
        UserSetup: Record 91;
        SelectedPeriod: Date;
        PeriodFilter: Text[30];
        objEmp: Record "HRM-Employee C";
        FullName : text;
        controlinfo: Record "HRM-Control-Information";
        NoofEntries: Integer;
        // ExcelBuf: Record 370 temporary;
        //PrintToExcel: Boolean;
        "Period Names": Text[30];
        dimVal: Record 349;
        mCount: Integer;
        mPercDist: Decimal;
        mPercLeave: Decimal;
        "HR Timesheets": Record 18;
        FromDate: Date;
        ToDate: Date;
        mHours: Decimal;
        mPerc: Decimal;
        HRday: Integer;
        totMhours: Decimal;
        mDate: Record 2000000007;
        mPercTotal: Decimal;
        mHorPercTotal: array[100] of Decimal;
        PeriodTran1: Record "PRL-Period Transactions";
        i: Integer;
        approved: Record 18;
        dt1: Date;
        dt2: Date;
        //  objholidays: Record 50192;
        "no of holidays": Integer;
        objbasecalenderchange: Record 7601;
        DATE1: Date;
        DATE2: Date;
        tempDate: Date;
        mtotalGrosspay: Decimal;
        mRealTotals: Decimal;
        mDay: Integer;
        Text000: Label 'Period: %1';
        Text001: Label 'Before';
        Text002: Label 'Salary Distribution';
        Text003: Label 'More than';
        Text004: Label 'Aged by %1';
        Text005: Label 'Total for %1';
        Text006: Label 'Aged as of %1';
        Text007: Label 'Aged by %1';
        Text008: Label 'All Amounts in LCY';
        Text009: Label 'Due Date,Posting Date,Document Date';
        Text010: Label 'The Date Formula %1 cannot be used. Try to restate it. E.g. 1M+CM instead of CM+1M.';
        Text011: Label 'Data';
        Text012: Label 'Aged Accounts Receivable';
        Text013: Label 'Company Name';
        Text014: Label 'Report No.';
        Text015: Label 'Report Name';
        Text016: Label 'User ID';
        Text017: Label 'Date';
        Text018: Label 'Customer Filters';
        Text019: Label 'Cust. Ledger Entry Filters';
        myFilter: Text[1000];
        ObjNetpay: Record "PRL-Employee P9 Info";
        Trans: Record "PRL-Transaction Codes";
        mNetPay: Decimal;
        NetPay: Decimal;
        mPAYE: Decimal;
        mBPAY: Decimal;
        payrollcode: Code[50];
        "Housing Allowance": Decimal;
        "Transport Allowance": Decimal;
        "Leave Allowance": Decimal;
        OT: Decimal;
        "Directors Fees": Decimal;
        "Lum[ Sum": Decimal;
        "other allowance": Decimal;
        "total cash pay": Decimal;
        "value of car": Decimal;
        o: Decimal;
        "other non cash": Decimal;
        "total non cash": Decimal;
        "global non income": Decimal;
        "global income": Decimal;
        "type of housing": Decimal;
        "rent income": Decimal;
        "rent of house": Decimal;
        "Computed Rent": Decimal;
        "Rent Recovered": Decimal;
        "net Housing": Decimal;
        "total Gross": Decimal;
        "total gross pay": Decimal;
        "30% cash": Decimal;
        "Actual contribution": Decimal;
        "permisible interest": Decimal;
        "mortgage interest": Decimal;
        HOSp: Decimal;
        "Amount of benefit": Decimal;
        "taxable pay": Decimal;
        "total pable slab": Decimal;
        "monthly Relief": Decimal;
        "insurance relief": Decimal;
        "permisable limit": Decimal;
        slab: Decimal;
        transCode: Record "PRL-Transaction Codes";
        PAYE: Decimal;
        

}

