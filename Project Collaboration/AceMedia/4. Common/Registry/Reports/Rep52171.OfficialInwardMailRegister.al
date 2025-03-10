report 52178923 "Official Inward Mail Register"
{
    Caption = 'Official Inward Mail Register';
    DefaultLayout = RDLC;
    RDLCLayout = './Admin Services/Registry/Report Layouts/Official Inward Mail Register.rdl';
    dataset
    {
        dataitem(DepartmentalFile; "Departmental File")
        {
            RequestFilterFields = "Folio No.", Department, "Received at", "Receieved by", Confidential;
            column(Logo; CompInfo.Picture) { }
            column(CompanyName; CompInfo.Name) { }
            column(Address; CompInfo.Address) { }
            column(Phone; CompInfo."Phone No.") { }
            column(Title; Format(UpperCase(Title))) { }
            column(FolioNo; "Folio No.")
            {
            }
            column(Subject; Subject)
            {
            }
            column(Confidential; Confidential)
            {
            }
            column(Department; Department)
            {
            }
            column(HasExternalDocuments; "Has External Documents")
            {
            }
            column(Sender; Sender)
            {
            }
            column(ReceivedFrom; "Received From")
            {
            }
            column(Receievedby; "Receieved by")
            {
            }
            column(Receivedat; Format("Received at"))
            {
            }
            column(Type; "Type")
            {
            }
            column(Status; Status)
            {
            }
            column(pigeonHoles; "pigeon Holes")
            {
            }
            column(RefNo; "Ref No.")
            {
            }
            column(DateRef; DateRef) { }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                DateRef := Format("Ref No.") + '-' + Format(RoundDateTime("Received at", 1));
                // DepartmentalFile.SetRange(Confidential, false);
            end;
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
        Title: Label 'Official Inward Mail Register';
        DateRef: Text;

}
