report 50022 "Annual Leave Balances"
{
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/Leave Balances.rdl';

    dataset
    {
        dataitem(HLE; "HRM-Leave Ledger")
        {
            //DataItemTableView = where("Posting Group" = filter('Salary'));
            RequestFilterFields = "Employee No", "Leave Period";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }

            /* column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            } */
            column(USERID; UserId)
            {
            }
            column(Entry_No_; "Entry No.")
            {

            }
            column(Leave_Type; "Leave Type")
            {
            }
            column(Leave_Period; "Leave Period")
            {
            }
            column(Employee_No; "Employee No")
            {
            }
            column(Employee_Name; "Employee Name")
            {

            }
            column(Transaction_Type; "Transaction Type")
            {

            }
            column(Transaction_Description; "Transaction Description")
            {

            }
            column(Transaction_Date; "Transaction Date")
            {

            }
            column(No__of_Days; "No. of Days")
            {

            }


            column(Leave_TypesCaption; Leave_TypesCaptionLbl)
            {
            }
            column(Picture; compinfo.Picture)
            {

            }
            column(Compemail; compinfo."E-Mail")
            { }
            column(compaddress; compinfo.Address)
            { }
            column(compphone; compinfo."Phone No.")
            { }
            column(compname; compinfo.Name)
            { }

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
    trigger OnInitReport()
    begin
        if Compinfo.GET() THEN BEGIN
            compinfo.CALCFIELDS(compinfo.Picture);
        END;
    end;

    var
        Compinfo: Record "Company Information";
        Leave_TypesCaptionLbl: Label 'Leave Types';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Inc__HolidaysCaptionLbl: Label 'Inc. Holidays';
        Inc__Sat_CaptionLbl: Label 'Inc. Sat.';
        Inc__SundayCaptionLbl: Label 'Inc. Sunday';
        Off_Holidays_LeaveCaptionLbl: Label 'Off/Holidays Leave';
}
