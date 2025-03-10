report 52178873 "CEO-AllMeetingsList"
{
    Caption = 'CEO-AllMeetingsList';
    RDLCLayout = './CEO/Reports/SSR/CEO-AllMeetingsList.rdl';
    dataset
    {
        dataitem(CEOCalendarEntries; "CEO-Calendar Entries")
        {
            // DataItemTableView = SORTING("Code1");
            // RequestFilterFields = "Code1";
            column(companyName; info.Name)
            {
            }

            column(companyAddress; info."Address 2")
            {
            }
            column(pic; info.Picture)
            {
            }
            column(Meeting_Code; Code1)
            {
            }
            column(Agenda; Agenda)
            {
            }
            column(Date; "Date")
            {
            }
            column(Description; Description)
            {
            }
            column(Venue; Venue)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
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
