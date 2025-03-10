report 52178878 "TR Drivers1"
{
    Caption = 'TR Drivers';
    RDLCLayout = './Admin/Transport/Reports/SSR/TR Drivers.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(TRDrivers; "TR Drivers")
        {
            RequestFilterFields = "Driver No", Active;
            column(Compinfopic; Compinfo.Picture)
            {
            }

            column(CompName; Compinfo.Name)
            {
            }
            column(CompinfoAddress; Compinfo.Address + ',' + Compinfo."Address 2")
            {
            }
            column(CompinfoPhones; Compinfo."Phone No." + ' ' + Compinfo."Phone No. 2")
            {
            }
            column(Compinfomails; Compinfo."E-Mail")
            {
            }
            column(CompinfoWebpage; Compinfo."Home Page")
            {

            }
            column(DriverNo; "Driver No")
            {
            }
            column(DriversName; "Drivers Name")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(LastLicenseRenewal; "Last License Renewal")
            {
            }
            column(LicenseNo; "License No")
            {
            }
            column(LicenseClass; "License Class")
            {
            }
            column(NextLicenseRenewal; "Next License Renewal")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(YearsOfExperience; "Years Of Experience")
            {
            }
            column(Seq; Seq)
            {

            }
            trigger OnAfterGetRecord()
            begin
                seq := Seq + 1;
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
        Compinfo.get();
        Compinfo.CalcFields(Picture);
        Clear(seq);

    end;

    var
        Compinfo: Record "Company Information";
        Seq: Integer;
}

