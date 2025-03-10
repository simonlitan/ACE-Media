report 52178925 "Outbound Mail"
{
    ApplicationArea = All;
    Caption = 'Outbound Mail Register';
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    RDLCLayout = './Admin Services/Registry/Report Layouts/Outbound Mail Register.rdl';

    dataset
    {
        dataitem(OutboundMail; "Outbound Mail")
        {
            column(Logo; CompInfo.Picture) { }
            column(CompanyName; CompInfo.Name) { }
            column(Address; CompInfo.Address) { }
            column(Phone; CompInfo."Phone No.") { }
            column(Title; Format(UpperCase(Title))) { }
            column(MailID; "Mail ID")
            {
            }
            column(MailDescription; "Mail Description")
            {
            }
            column(Destination; Destination)
            {
            }
            column(From; From)
            {
            }
            column(DateReceived; "Date Received")
            {
            }
            column(DateDispatched; "Date Dispatched")
            {
            }
            column(ModeofDispatch; "Mode of Dispatch")
            {
            }
            column(Weight; "Weight ")
            {
            }
            column(Department; Department)
            {
            }
            column(ReceivingOfficer; "Receiving Officer")
            {
            }
            column(Status; Status)
            {
            }
            column(DispatchingOfficer; "Dispatching Officer")
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
        CompInfo.Get;
        CompInfo.CalcFields(Picture);

    end;

    var
        CompInfo: Record "Company Information";
        Title: Label 'Outbound Mail Register';
}
