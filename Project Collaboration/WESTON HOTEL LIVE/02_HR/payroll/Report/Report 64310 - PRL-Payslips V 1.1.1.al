report 64310 "PRL-Payslips V 1.1.1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/PRL-Payslips V 1.1.1.rdl';

    dataset
    {


        // RequestFilterFields = "No.";

        dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
        {

            // = "Employee Code" = FIELD("No.");
            RequestFilterFields = "Employee Code", "Payroll Period";

            column(CompanyInfoName; CompInfo.Name)
            {
            }
            column(CompanyInfoAddress; CompInfo.Address)
            {
            }
            column(CompanyInfoPicture; CompInfo.Picture)
            {
            }
            column(CompanyInfoPhone1; CompInfo."Phone No.")
            {
            }
            column(CompanyInfoPhone2; CompInfo."Contact Person")
            {
            }
            column(CompanyInfoAdress; CompInfo.Address)
            {
            }
            column(CompanyInfoPostal; CompInfo."Post Code")
            {
            }
            column(CompanyInfoEmail; CompInfo."E-Mail")
            {
            }
            column(CompanyInfoWebpage; CompInfo."Home Page")
            {
            }
            column(CompanyInfoCity; CompInfo.City)
            {
            }


            column(CompName; compInfo.Name)
            {
            }
            column(CompPic; compInfo.Picture)
            {
            }
            column(Address; compInfo.Address)
            {
            }
            column(City; compInfo.City)
            {
            }
            column(Website; compInfo."Home Page")
            {
            }
            column(EmpNo; ObjEmp."No.")
            {
            }
            column(JobTitle_HRMEmployeeC; objEmp."Job Title")
            {
            }
            column(SalaryGrade_HRMEmployeeC; objEmp."Salary Grade")
            {
            }
            column(Names; HRMEmployeeC."Last Name" + ' ' + ObjEmp."Middle Name" + ' ' + ObjEmp."First Name")
            {
            }
            column(DOJ; ObjEmp."Date Of Join")
            {
            }
            column(UserId; "Userid")
            {
            }
            column(Age_HRMEmployeeC; ObjEmp.Age)
            {
            }
            column(IDnNHIF; strID + strNhifNo)
            {
            }
            column(PinNo; ObjEmp."PIN Number")
            {
            }
            column(Retirement_date; objEmp."Retirement date")
            {

            }
            column(PerName; PerName)
            {
            }
            column(PerName2; PerName2)
            {


            }


            column(LegnthOfService; LegnthOfService)
            {
            }
            column(PayslipMessage; PRLPayrollPeriods."Payslip Message")
            {
            }
            column(ClosureSectionRemark; ' ')
            {
            }
            column(BankName; ObjEmp."Main Bank Name")
            {
            }
            column(BankBranch; ObjEmp."Branch Bank Name")
            {

            }
            column(NSSF; ObjEmp."NSSF No.")
            {

            }
            column(DepartmentName_HRMEmployeeC; objEmp."Department Name")
            {
            }
            column(NHIF; objEmp."NHIF No.")
            {

            }
            column(AccNo; objEmp."Bank Account Number")
            {
            }
            column(PeriodName; PeriodName)
            {
            }
            column(GroupText; "PRL-Period Transactions"."Group Text")
            {
            }
            column(PeriodFilter; "PRL-Period Transactions"."Payroll Period")
            {
            }
            column(DeptAndLeaveBal; dept)
            {
            }
            column(TransCode; "PRL-Period Transactions"."Transaction Code")
            {
            }
            column(GText; "PRL-Period Transactions"."Group Text")
            {
            }
            column(TransName; "PRL-Period Transactions"."Transaction Name")
            {
            }
            column(TransAmount; "PRL-Period Transactions".Amount)
            {
            }
            column(TransBalance; "PRL-Period Transactions".Balance)
            {
            }
            column(PeriodMonth; "PRL-Period Transactions"."Period Month")
            {
            }


            column(Periodyear; "PRL-Period Transactions"."Period Year")
            {
            }

            column(GO; "PRL-Period Transactions"."Group Order")
            {
            }
            column(strBank; 'Paid to: ' + strBank)
            {
            }
            column(strBranch; 'Branch: ' + strBranch)
            {
            }
            column(strAccountNo; 'A/C No.: ' + strAccountNo)
            {
            }
            column(EmpPin; strPin)
            {
            }
            column(strNssfNo; strNssfNo)
            {
            }
            /*       trigger OnAfterGetRecord()
                  begin
                      //"PRL-Period Transactions".SETCURRENTKEY("PRL-Period Transactions"."Group Order");
                      if "PRL-Period Transactions"."Group Text" = 'Gross Pay|Nita|Gratuity|NSSF EMPLOYER|GEmprPension|NEmprPension' then CurrReport.Skip;
                      if "PRL-Period Transactions"."Group Text" = 'STATUTORIES' then "PRL-Period Transactions"."Group Text" := 'DEDUCTIONS';
                  end;

                  trigger OnPreDataItem()
                  begin
                      if "PRL-Period Transactions"."Group Text" = 'Gross Pay|Nita|Gratuity|NSSF EMPLOYER|GEmprPension|NEmprPension' then CurrReport.Skip;
                      "PRL-Period Transactions".SetFilter("PRL-Period Transactions"."Payroll Period", '=%1', PRLPayrollPeriods."Date Opened");
                      //"PRL-Period Transactions".SETCURRENTKEY("PRL-Period Transactions"."Group Order");
                  end; */





            trigger OnAfterGetRecord()
            begin
                emp1.Reset;
                emp1.SetRange("No.", "PRL-Period Transactions"."Employee Code");
                if emp1.Find('-') then;

                strNssfNo := '. ';
                strNhifNo := '. ';
                strBank := '. ';
                strBranch := '. ';
                strAccountNo := '. ';
                strPin := '. ';
                strAge := '.';
                Clear(strID);
                Clear(strJobG);
                Clear(strReg);
                Clear(strPF);
                PRLPayrollPeriods.Reset;
                PRLPayrollPeriods.SetRange("Date Opened", Prtransactions."Payroll Period");
                if PRLPayrollPeriods.Find('-') then
                    PerName2 := PRLPayrollPeriods."Period Name";
                //PeriodTrans."Payroll Period" := PRLPayrollPeriods."Date Opened";

                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", Prtransactions."Employee Code");
                if objEmp.Find('-') then begin
                    if objEmp."Department Code" <> '' then begin
                        Dimm.Reset;
                        Dimm.SetRange(Dimm."Dimension Code", 'DEPARTMENT');
                        Dimm.SetRange(Dimm.Code, objEmp."Department Code");
                        if Dimm.Find('-') then begin
                            if Dimm.Name <> '' then
                                dept := 'Dept.:   ' + Dimm.Name;
                        end;
                    end;
                    objEmp.CalcFields(objEmp."Department NameS");
                    //dept:=objEmp."Department NameS";
                    strEmpName := objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";
                    strPF := objEmp."No.";
                    strReg := objEmp.Region;
                    strJobG := objEmp."Grade Level";
                    if objEmp."ID Number" <> '' then
                        strID := 'ID: ' + objEmp."ID Number";
                    if objEmp."PAYE Number" <> '' then
                        strPin := objEmp."PAYE Number";
                    if objEmp."Date Of Join" <> 0D then
                        dtDOE := objEmp."Date Of Join";
                    //STATUS := Format(objEmp.Status);
                    "Served Notice Period" := objEmp."Served Notice Period";
                    if objEmp."Date Of Leaving" = 0D then
                        dtOfLeaving := DMY2Date(31, 12, 9999)
                    else
                        dtOfLeaving := objEmp."Date Of Leaving";
                    if objEmp."NSSF No." <> '' then
                        strNssfNo := 'N.S.S.F: ' + objEmp."NSSF No.";
                    if objEmp."NHIF No." <> '' then
                        strNhifNo := '  N.H.I.F: ' + objEmp."NHIF No.";
                    if objEmp."PIN Number" <> '' then
                        strPin := 'PIN: ' + objEmp."PIN Number";
                    if ((objEmp."Date Of Birth" <> 0D) and (objPeriod."Date Opened" <> 0D)) then
                        strAge := HrDate.DetermineAge_Years(objEmp."Date Of Birth", objPeriod."Date Opened");


                    //Get the staff banks in the payslip - Dennis ***************************************************
                    strBankno := objEmp."Main Bank";
                    strBranchno := objEmp."Branch Bank";
                    bankStruct.SetRange(bankStruct."Bank Code", strBankno);
                    bankStruct.SetRange(bankStruct."Branch Code", strBranchno);
                    if bankStruct.Find('-') then begin
                        strAccountNo := objEmp."Bank Account Number";
                        strBank := bankStruct."Bank Name";
                        strBranch := bankStruct."Branch Name";
                    end;
                    //*************************************************************************************************

                end;
                Prtransactions.Reset;
                Prtransactions.SetRange("Payroll Period", PeriodFilter);
                if Prtransactions.Find('-') then
                    PerName2 := PRLPayrollPeriods."Period Name";


                HRMEmployeeC.Reset;
                HRMEmployeeC.SetRange("No.", "PRL-Period Transactions"."Employee Code");
                if HRMEmployeeC.Find('-') then begin
                    HRMEmployeeC.CalcFields("Leave Balance");
                end;
            end;


            trigger OnPreDataItem()

            begin
                If "PRL-Period Transactions".GETFILTER("PRL-Period Transactions"."Payroll Period") = '' THEN ERROR('You must specify the period filter');


                CLEAR(PeriodFilter);
                IF EVALUATE(PeriodFilter, ("PRL-Period Transactions".GETFILTER("PRL-Period Transactions"."Payroll Period"))) THEN;

                objPeriod.RESET;
                objPeriod.SETRANGE(objPeriod."Date Opened", PeriodFilter);
                IF objPeriod.FIND('-') THEN;
                SelectedPeriod := PeriodFilter;
                objPeriod.Reset;
                if objPeriod.Get(Prtransactions."Payroll Period") then PerName2 := objPeriod."Period Name";// PeriodName := objPeriod."Period Name";
                Clear(PayslipMessage);
                PayslipMessage := objPeriod."Payslip Message";
                strNssfNo := '.';
                strNhifNo := '.';
                strBank := '.';
                strBranch := '.';
                strAccountNo := '.';
                Prtransactions.Reset();
                Prtransactions.SetRange("Payroll Period", PeriodFilter);
                if Prtransactions.Find('-') then begin
                    PerName2 := PRLPayrollPeriods."Period Name"

                end;



            end;

            trigger OnPostDataItem()
            begin
                PRLPayrollPeriods.Reset();
                PRLPayrollPeriods.SetRange("Date Opened", Prtransactions."Payroll Period");
                if PRLPayrollPeriods.Find('-') then
                    PerName2 := PRLPayrollPeriods."Period Name";

            end;
        }


    }

    requestpage
    {

        layout
        {
            area(Content)
            {

                field(Periods; Periods)
                {
                    ApplicationArea = all;
                    Visible = false;
                    TableRelation = "PRL-Period Transactions"."Payroll Period";
                }
                field(PeriodFilter; PeriodFilter)
                {
                    ApplicationArea = all;
                    Visible = false;
                    TableRelation = "PRL-Period Transactions"."Payroll Period";

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

    trigger OnInitReport()
    begin
        /* PRLPayrollPeriods.Reset;
        PRLPayrollPeriods.SetRange(Closed, false);
        PRLPayrollPeriods.SetFilter("Payroll Code", 'PAYROLL');
        if PRLPayrollPeriods.Find('-') then
            Periods := PRLPayrollPeriods."Date Opened";
        PeriodTrans."Payroll Period" := PRLPayrollPeriods."Date Opened"; */
    end;

    trigger OnPreReport()
    begin
        CompInfo.GET;
        CompInfo.CALCFIELDS(Picture);

        PRLPayrollPeriods.Reset;
        PRLPayrollPeriods.SetRange("Date Opened", Prtransactions."Payroll Period");
        if PRLPayrollPeriods.Find('-') then begin
            PerName2 := PRLPayrollPeriods."Period Name";
        end;
    end;

    var
        strAge: Text[100];
        emp1: Record "HRM-Employee C";
        HRDates: Codeunit "HR Dates";
        PerName: text[50];
        Periods: Date;
        LegnthOfService: Code[50];
        compInfo: Record "Company Information";
        PRLBankStructure: Record "PRL-Bank Structure";
        dept: Text[100];
        strID: Text[100];
        strNhifNo: Text[30];
        PeriodName: Code[50];
        strBank: Text[100];
        strBranch: Text[100];
        strAccountNo: Text[100];
        strPin: Text[30];
        strNssfNo: Text[30];
        PerName2: text[50];
        PeriodFilter: Date;
        compn: Code[150];
        groupFilter: Code[20];
        Addr: array[2, 12] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        intInfo: Integer;
        i: Integer;
        PeriodTrans: Record "PRL-Period Transactions";
        intRow: Integer;
        Index: Integer;
        objEmp: Record "HRM-Employee C";
        strEmpName: Text[250];
        Trans: array[2, 80] of Text[250];
        TransAmt: array[2, 80] of Text[250];
        TransBal: array[2, 80] of Text[250];
        strGrpText: Text[100];
        strMessage: Text[100];
        strPF: Text[100];
        strJobG: Text[100];
        strReg: Text[100];
        Prtransactions: Record "PRL-Period Transactions";
        PRLPayrollPeriods: Record "PRL-Payroll Periods";
        SelectedPeriod: Date;
        objPeriod: Record "PRL-Payroll Periods";
        dtDOE: Date;
        strEmpCode: Text[30];
        STATUS: Text[30];
        ControlInfo: Record "HRM-Control-Information";
        dtOfLeaving: Date;
        "Served Notice Period": Boolean;
        bankStruct: Record "PRL-Bank Structure";
        emploadva: Record "PRL-Period Transactions";
        strBankno: Text[30];
        strBranchno: Text[30];
        CompanyInfo: Record "Company Information";
        objOcx: Codeunit prPayrollProcessing;
        Dimm: Record "Dimension Value";
        HrDate: Codeunit "HR Dates";
        PayslipMessage: Text[100];
        HRMEmployeeC: Record "HRM-Employee C";
}


