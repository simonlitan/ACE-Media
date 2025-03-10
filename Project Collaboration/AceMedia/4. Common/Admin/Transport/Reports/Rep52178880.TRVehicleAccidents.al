report 52178880 "TR Vehicle Accidents1"
{
    Caption = 'TR Vehicle Accidents';
    DefaultLayout = RDLC;
    RDLCLayout = './Admin/Transport/Reports/SSR/TR Vehicle Accidents.rdl';
    dataset
    {
        dataitem(TRAccidents; "TR Accidents")
        {
            RequestFilterFields = "Registration No";
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
            column(TicketNo; "Ticket No")
            {
            }
            column(DateofIncident; "Date of Incident")
            {
            }
            column(DriverNo; "Driver No")
            {
            }
            column(DriverName; "Driver Name")
            {
            }
            column(GeneralDescription; "General Description")
            {
            }
            column(Location; Location)
            {
            }
            column(Casualties; Casualties)
            {
            }
            column(ActionTaken; "Action Taken")
            {
            }
            column(RegistrationNo_TRAccidents; "Registration No")
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
