report 52178877 "TR Workticket"
{
    Caption = 'TR Workticket';
    DefaultLayout = RDLC;
    RDLCLayout = './Admin/Transport/Reports/SSR/Work Ticket.rdl';
    dataset
    {
        dataitem(TRWorkticketHeader; "TR Workticket Header")
        {
            RequestFilterFields = "Ticket No";
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
            column(PreviousTicketNo; "Previous Ticket No")
            {
            }
            column(RegistrationNo; "Registration No")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(Station; Station)
            {
            }
            column(OdometeratStart; "Odometer at Start")
            {
            }
            column(Make_TRWorkticketHeader; Make)
            {
            }
            dataitem("TR Workticket Lines"; "TR Workticket Lines")
            {
                DataItemLink = "Ticket No" = field("Ticket No"), "Registration No" = field("Registration No");
                column(Date_TRWorkticketLines; "Date")
                {
                }
                column(DriverNo_TRWorkticketLines; "Driver No")
                {
                }
                column(DriverName_TRWorkticketLines; "Driver Name")
                {
                }
                column(AuthorizingOfficerName_TRWorkticketLines; "Authorizing Officer Name")
                {
                }
                column(Route_TRWorkticketLines; Route)
                {
                }
                column(AuthorizingOfficerNo_TRWorkticketLines; "Authorizing Officer No")
                {
                }
                column(OilDrawn_TRWorkticketLines; "Oil Drawn")
                {
                }
                column(FuelDrawn_TRWorkticketLines; "Fuel Drawn")
                {
                }
                column(TimeOut_TRWorkticketLines; "Time Out")
                {
                }
                column(TimeIn_TRWorkticketLines; "Time In")
                {
                }
                column(OdometerReading_TRWorkticketLines; "Odometer Reading")
                {
                }
                column(DistanceCovered_TRWorkticketLines; "Distance Covered")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields("Driver Name");

                end;

                trigger OnPreDataItem()
                begin
                    CalcFields("Driver Name");

                end;
            }
            dataitem("TR Vehicle Defects"; "TR Vehicle Defects")
            {
                DataItemLink = "Ticket No" = field("Ticket No"), "Registration No" = field("Registration No");
                column(Date_TRVehicleDefects; "Date")
                {
                }
                column(Defects_TRVehicleDefects; Defects)
                {
                }
                column(Actionstaken_TRVehicleDefects; "Actions taken")
                {
                }
            }
            trigger OnPreDataItem()
            begin
                CalcFields("Fuel Consumed")
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
        "TR Workticket Lines".CalcFields("Driver Name");
        TRWorkticketHeader.CalcFields("Fuel Consumed");
    end;

    var
        Compinfo: Record "Company Information";
}
