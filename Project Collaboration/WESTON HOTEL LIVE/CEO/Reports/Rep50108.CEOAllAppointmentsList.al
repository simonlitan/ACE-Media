report 52178874 "CEO-AllAppointmentsList"
{
    Caption = 'CEO-AllAppointmentsList';
    RDLCLayout = './CEO/Reports/SSR/CEO-AllAppointmentsList.rdl';
    dataset
    {
        dataitem(CEOCalendarEntries; "CEO-Calendar Entries")
        {
            RequestFilterFields = "Status";
            column(companyName; info.Name)
            {
            }

            column(companyAddress; info."Address 2")
            {
            }
            column(pic; info.Picture)
            {
            }
            column(Code; "Code1")
            {
            }
            column(Date; "Date")
            {
            }
            column(Time; "Time")
            {
            }
            column(ExternalRequestingOfficer; "External Requesting Officer")
            {
            }
            column(FullName; "Full Name")
            {
            }
            column(Appointment_Reason; "Reason")
            {
            }

            column(Status; "Status")
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
