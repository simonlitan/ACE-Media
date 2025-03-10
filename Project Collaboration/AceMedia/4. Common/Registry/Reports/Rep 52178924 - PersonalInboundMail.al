report 52178924 "Personal Inbound Mail"
{
    ApplicationArea = All;
    Caption = 'Personal Inbound Mail';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Admin Services/Registry/Report Layouts/Personal Inbound Mail.rdl';

    dataset
    {
        dataitem(PersonalMail; "Personal Mail")
        {
            RequestFilterFields = "Mail ID", "Received From", "Date Posted", "Hole ID";
            column(Logo; CompInfo.Picture) { }
            column(CompanyName; CompInfo.Name) { }
            column(Address; CompInfo.Address) { }
            column(Phone; CompInfo."Phone No.") { }
            column(Title; Format(UpperCase(Title))) { }
            column(MailID; "Mail ID")
            {
            }
            column(HoleID; "Hole ID")
            {
            }
            column(DatePosted; Format("Date Posted"))
            {
            }
            column(Sender; Sender)
            {
            }
            column(Subject; Subject)
            {
            }
            column(Receivedby; "Received by")
            {
            }
            column(ReceivedFrom; "Received From")
            {
            }
            column(Type; "Type")
            {
            }
            column(Collected; "Collected?")
            {
            }
            column(DateCollected; Format("Date Collected"))
            {
            }
            column(Recepient; Recepient)
            {
            }
            column(Status; Status)
            {
            }
            column(Ref_No_; "Ref No.") { }
            column(DateRef; Format("Ref No.") + '-' + Format("Date Posted")) { }
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
        Title: Label 'Personal Inbound Mail';
}
