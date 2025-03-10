report 52178862 "CEO-CalendarEntries"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    EnableExternalImages = true;
    RDLCLayout = './CEO/Reports/SSR/CEO-AllCalendarEntries Report.rdl';

    dataset
    {
        dataitem("All Meetings"; "CEO-Calendar Entries")
        {
            DataItemTableView = SORTING("Code");
            RequestFilterFields = "Date";
            PrintOnlyIfDetail = true;

            column(companyName; info.Name)
            {
            }
            column(companyAddress; info."Address 2")
            {
            }
            column(pic; info.Picture)
            {
            }
            column(Meeting_Code; Code)
            {
            }
            column(Agenda; "Agenda")
            {
            }
            column(Meeting_date; "Period Start")
            {
            }

            //Appointments table
            // column(Appointment_Code; "Code1")
            // {
            // }
            // column(Appointment_with; "Full Name")
            // {
            // }
            // column(Appointment_Date; "Date")
            // {
            // }






        }
        dataitem("All Meetings2"; "CEO-Calendar Entries2")
        {
            DataItemTableView = SORTING("Code1");
            RequestFilterFields = "Date";
            PrintOnlyIfDetail = true;
            column(Appointment_Code; "Code1")
            {
            }
            column(Appointment_with; "Full Name")
            {
            }
            column(Appointment_Date; "Date")
            {
            }
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

    trigger OnInitReport()
    begin
        DateFilter := TODAY;
    end;

    trigger OnPreReport()
    begin
        info.reset;
        if info.get() then
            info.CalcFields(Picture);

    end;


    var
        myInt: Integer;
        info: Record "Company Information";
        DateFilter: Date;
}