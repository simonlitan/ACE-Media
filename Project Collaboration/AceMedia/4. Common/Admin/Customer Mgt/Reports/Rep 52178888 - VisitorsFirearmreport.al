report 52178888 "Visitors Firearm report"
{
    RDLCLayout = './Admin/Customer Mgt/Reports/SSR/Firearm Report.rdl';
    DefaultLayout = RDLC;
    Caption = 'Visitors Firearm report';
    dataset
    {
        dataitem(CMItems; "CM Items")
        {
            RequestFilterFields = "Firearm Type";
            column(No; "No.")
            {
            }
            column(ShelfNo; "Shelf No")
            {
            }
            column(NoofMagazine; "No of Magazine")
            {
            }
            column(NoofRounds; "No of Rounds")
            {
            }
            column(SerialNo; "Serial No")
            {
            }
            column(TimeIn; "Time In")
            {
            }
            column(TimeOut; "Time Out")
            {
            }
            column(ButtNo; "Butt No")
            {
            }
            column(Collected; Collected)
            {
            }
            column(FirearmType; "Firearm Type")
            {
            }
            column(Description; Description)
            {
            }
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
