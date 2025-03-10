report 52178879 "TR Vehicles1"
{

    RDLCLayout = './Admin/Transport/Reports/SSR/TR Vehicles.rdl';
    DefaultLayout = RDLC;
    Caption = 'TR Vehicles';
    dataset
    {
        dataitem(TRVehicles; "TR Vehicles")
        {
            RequestFilterFields = "FA No", "Registration No";
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
            column(FANo; "FA No")
            {
            }
            column(Description; Description)
            {
            }
            column(DriverNo; "Driver No")
            {
            }
            column(DriverName; "Driver Name")
            {
            }
            column(RegistrationNo; "Registration No")
            {
            }
            column(ChasisNo; "Chasis No")
            {
            }
            column(EngineNo; "Engine No")
            {
            }
            column(FuelConsumption; "Fuel Consumption")
            {
            }
            column(InsuranceEndingDate; "Insurance Ending Date")
            {
            }
            column(InsuranceStartDate; "Insurance Start Date")
            {
            }
            column(InsuranceProvider; "Insurance Provider")
            {
            }
            column(Make; Make)
            {
            }
            column(Model; Model)
            {
            }
            column(Noofpassengers; "No of passengers")
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
        TRVehicles.CalcFields("Fuel Consumption");

    end;

    var
        Compinfo: Record "Company Information";
        Seq: Integer;
}
