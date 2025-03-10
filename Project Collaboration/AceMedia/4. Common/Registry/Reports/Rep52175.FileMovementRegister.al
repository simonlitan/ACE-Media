report 52178926 "File Movement Register"
{
    ApplicationArea = All;
    Caption = 'File Movement Register';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Admin Services/Registry/Report Layouts/File Movement Register.rdl';
    dataset
    {
        dataitem(FileMovementRegister; "File Movement Register")
        {
            RequestFilterFields = "File ID", "Movement Type", Officer, Department;
            column(Logo; CompInfo.Picture) { }
            column(CompanyName; CompInfo.Name) { }
            column(Address; CompInfo.Address) { }
            column(Phone; CompInfo."Phone No.") { }
            column(Title; Format(UpperCase(Title))) { }
            column(FileFilterLbl; StrSubstNo(FileFilterLbl, StartDate, EndDate)) { }
            column(FileID; "File ID")
            {
            }
            column(FileDescription; "File Description")
            {
            }
            column(MovementType; "Movement Type")
            {
            }
            column(MovementDate; "Movement Date")
            {
            }
            column(Officer; Officer)
            {
            }
            column(FileType; "File Type")
            {
            }
            column(Department; Department)
            {
            }
            column(PHKey; PHKey) { }
            column(StartDate; StartDate) { }
            column(EndDate; EndDate) { }
            trigger OnAfterGetRecord()
            begin
                FileMovementRegister.Reset();
                FileMovementRegister.SetFilter("Movement Date", '=%1|>%1', StartDate);
                FileMovementRegister.SetFilter("Movement Date", '=%1|<%1', EndDate);
                // FileMovementRegister.SetRange("File Type", "File Type");
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("File Movement Date Filters")
                {
                    field("Start DateTime"; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field("End DateTime"; EndDate)
                    {
                        ApplicationArea = ALl;
                    }
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
        Title: Label 'File Movement Register';
        StartDate, EndDate : DateTime;
        FileFilterLbl: Label 'File Movement activities from %1 to %2.';
        PHKey: Label 'PH => Pigeon Hole';
}
