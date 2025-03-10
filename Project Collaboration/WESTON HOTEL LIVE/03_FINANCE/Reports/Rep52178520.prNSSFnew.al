report 52178520 "prNSSF - new"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/prNSSFnew.rdlc';

    dataset
    {
        dataitem("PR Salary Card"; "PRL-Salary Card")
        {
            RequestFilterFields = "Period Filter";
            column(USERID; USERID)
            {
            }
            column(TODAY; TODAY)
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(CurrReport_PAGENO; 1)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_phone; CompanyInfo."Phone No.")
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(PeriodName_Control1102756011; PeriodName)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(Volume_Amount_; "Volume Amount")
            {
            }
            column(IDNumber; IDNumber)
            {
            }
            column(EmployeeName; EmployeeName)
            {
            }
            column(prSalary_Card__prSalary_Card___Employee_Code_; "Employee Code")
            {
            }
            column(NssfAmount_2; NssfAmount)
            {
            }
            column(NssfNo; NssfNo)
            {
            }
            column(PIN; PIN)
            {
            }
            column(NssfAmount_2_Control1102756008; NssfAmount)
            {
            }
            column(TotNssfAmount_2; TotNssfAmount)
            {
            }
            column(totTotalAmount; totTotalAmount)
            {
            }
            column(TotVolume_Amount_; "TotVolume Amount")
            {
            }
            column(TotNssfAmount_2_Control1102756015; TotNssfAmount)
            {
            }
            column(NATIONAL_SOCIAL_SECURITY_FUNDCaption; NATIONAL_SOCIAL_SECURITY_FUNDCaptionLbl)
            {
            }
            column(User_Name_Caption; User_Name_CaptionLbl)
            {
            }
            column(Print_Date_Caption; Print_Date_CaptionLbl)
            {
            }
            column(Period_Caption; Period_CaptionLbl)
            {
            }
            column(Page_No_Caption; Page_No_CaptionLbl)
            {
            }
            column(PERIOD_Caption_Control1102755031; PERIOD_Caption_Control1102755031Lbl)
            {
            }
            column(EMPLOYER_NO_Caption; objEmp."No.")
            {
            }
            column(EMPLOYER_NAME_Caption; EMPLOYER_NAME_CaptionLbl)
            {
            }
            column(Payroll_No_Caption; Payroll_No_CaptionLbl)
            {
            }
            column(Employee_NameCaption; Employee_NameCaptionLbl)
            {
            }
            column(NSSF_No_Caption; NSSF_No_CaptionLbl)
            {
            }
            column(ID_Number_Caption; IDNumber)
            {
            }
            column(Vol_AmountCaption; Vol_AmountCaptionLbl)
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
            {
            }
            column(Employee_AmountCaption; Employee_AmountCaptionLbl)
            {
            }
            column(Employer_AmountCaption; Employer_AmountCaptionLbl)
            {
            }
            column(Total_Amounts_Caption; Total_Amounts_CaptionLbl)
            {
            }
            column(Prepared_by_______________________________________Date_________________Caption; Prepared_by_______________________________________Date_________________CaptionLbl)
            {
            }
            column(Checked_by________________________________________Date_________________Caption; Checked_by________________________________________Date_________________CaptionLbl)
            {
            }
            column(Authorized_by____________________________________Date_________________Caption; Authorized_by____________________________________Date_________________CaptionLbl)
            {
            }
            column(Approved_by______________________________________Date_________________Caption; Approved_by______________________________________Date_________________CaptionLbl)
            {
            }
            column(KRA_Pin; CompanyInfo."VAT Registration No.")
            {
            }
            column(Employer_NSSF_Number; CompanyInfo."N.S.S.F No.")
            {
            }
            column(Surname; objEmp."Last Name")
            {
            }
            column(Gross_PAY; GPAY)
            {
            }
            column(Total_Gross_Pay; TGPAY)
            {
            }
            column(Total_Member; TMEMBER)
            {
            }
            column(Total_Contributions; TCONTRIBUTIONS)
            {
            }
            column(Total_Records; TRECORDS)
            {
            }

            trigger OnAfterGetRecord()
            begin

                objEmp.RESET;
                objEmp.SETRANGE(objEmp."No.", "Employee Code");
                IF objEmp.FIND('-') THEN BEGIN
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    NssfNo := objEmp."NSSF No.";
                    IDNumber := objEmp."ID Number";
                    PIN := objEmp."PIN Number";

                END;
                /*
                //Volume Amount****************************************************************************
                PeriodTrans.RESET;
                PeriodTrans.SETRANGE(PeriodTrans."Employee Code","Employee Code");
                PeriodTrans.SETRANGE(PeriodTrans."Payroll Period",SelectedPeriod);
                PeriodTrans.SETFILTER(PeriodTrans."Transaction Code",'NSSFVOL');  ///Nssf Code
                PeriodTrans.SETCURRENTKEY(PeriodTrans."Employee Code",PeriodTrans."Period Month",PeriodTrans."Period Year",
                PeriodTrans."Group Order",PeriodTrans."Sub Group Order");
                
                "Volume Amount":=0;
                IF PeriodTrans.FIND('-') THEN
                   BEGIN
                      "Volume Amount":=PeriodTrans.Amount;
                   END;
                
                "TotVolume Amount":="TotVolume Amount"+"Volume Amount";
                  */
                //Standard Amount**************************************************************************
                PeriodTrans.RESET;
                PeriodTrans.SETRANGE(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SETRANGE(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SETFILTER(PeriodTrans."Group Order", '=7');
                PeriodTrans.SETFILTER(PeriodTrans."Sub Group Order", '=2');
                PeriodTrans.SETCURRENTKEY(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                PeriodTrans."Group Order", PeriodTrans."Sub Group Order");

                NssfAmount := 0;
                IF PeriodTrans.FIND('-') THEN BEGIN
                    //      NssfAmount:=PeriodTrans.Amount+PeriodTrans.Amount;
                    NssfAmount := PeriodTrans.Amount;
                END;

                //Total Amount=NssfAmount+Volume Amount**************************************************
                //TotalAmount:=NssfAmount+NssfAmount+"Volume Amount";


                //Summation Total Amount=****************************************************************
                //totTotalAmount:=totTotalAmount+TotalAmount;

                //TotNssfAmount:=TotNssfAmount+NssfAmount;

                //Gross Income;
                PeriodTrans.RESET;
                PeriodTrans.SETRANGE(PeriodTrans."Employee Code", "Employee Code");
                PeriodTrans.SETRANGE(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SETRANGE(PeriodTrans."Transaction Code", 'GPAY');
                GPAY := 0;
                IF PeriodTrans.FIND('-') THEN BEGIN
                    GPAY := PeriodTrans.Amount;
                END;

                IF NssfAmount <= 0 THEN
                    CurrReport.SKIP;

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        PeriodFilter := "PR Salary Card".GETFILTER("Period Filter");
        IF PeriodFilter = '' THEN ERROR('You must specify the period filter');

        SelectedPeriod := "PR Salary Card".GETRANGEMIN("Period Filter");
        objPeriod.RESET;
        IF objPeriod.GET(SelectedPeriod) THEN PeriodName := objPeriod."Period Name";


        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

        TotNssfAmount := 0;
        TGPAY := 0;
        TMEMBER := 0;
        TCONTRIBUTIONS := 0;

        //Total Gross Income;
        PeriodTrans.RESET;
        PeriodTrans.SETRANGE(PeriodTrans."Payroll Period", SelectedPeriod);
        PeriodTrans.SETRANGE(PeriodTrans."Transaction Code", 'GPAY');
        IF PeriodTrans.FIND('-') THEN BEGIN
            REPEAT
                TGPAY := TGPAY + PeriodTrans.Amount;
            UNTIL PeriodTrans.NEXT = 0;
        END;
    end;

    var
        PeriodTrans: Record "PRL-Period Transactions";
        NssfAmount: Decimal;
        TotNssfAmount: Decimal;
        objEmp: Record "HRM-Employee C";
        EmployeeName: Text[30];
        NssfNo: Text[30];
        IDNumber: Text[30];
        objPeriod: Record "PRL-Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        "Volume Amount": Decimal;
        "TotVolume Amount": Decimal;
        TotalAmount: Decimal;
        totTotalAmount: Decimal;
        CompanyInfo: Record "HRM-Control-Information";
        NATIONAL_SOCIAL_SECURITY_FUNDCaptionLbl: Label 'NATIONAL SOCIAL SECURITY FUND';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        PERIOD_Caption_Control1102755031Lbl: Label 'PERIOD:';
        EMPLOYER_NO_CaptionLbl: Label 'EMPLOYER NO:';
        EMPLOYER_NAME_CaptionLbl: Label 'EMPLOYER NAME:';
        Payroll_No_CaptionLbl: Label 'Payroll No:';
        Employee_NameCaptionLbl: Label 'Employee Name';
        NSSF_No_CaptionLbl: Label 'NSSF No:';
        ID_Number_CaptionLbl: Label 'ID Number:';
        Vol_AmountCaptionLbl: Label 'Vol Amount';
        Total_AmountCaptionLbl: Label 'Total Amount';
        Employee_AmountCaptionLbl: Label 'Employee Amount';
        Employer_AmountCaptionLbl: Label 'Employer Amount';
        Total_Amounts_CaptionLbl: Label 'Total Amounts:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared by……………………………………………………..                 Date……………………………………………';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked by…………………………………………………..                   Date……………………………………………';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized by……………………………………………………..              Date……………………………………………';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved by……………………………………………………..                Date……………………………………………';
        GPAY: Decimal;
        TGPAY: Decimal;
        TMEMBER: Decimal;
        TCONTRIBUTIONS: Decimal;
        TRECORDS: Integer;
        PIN: Text;
}

