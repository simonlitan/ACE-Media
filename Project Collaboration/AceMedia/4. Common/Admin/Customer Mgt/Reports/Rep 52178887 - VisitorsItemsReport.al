report 52178887 "Visitors Items Report"
{
    RDLCLayout = './Admin/Customer Mgt/Reports/SSR/Visitors Items.rdl';
    DefaultLayout = RDLC;
    Caption = 'Visitors Items Report';
    dataset
    {
        dataitem(CMItems; "CM Items")
        {
            RequestFilterFields = "No.", Collected;
            column(No; "No.")
            {
            }
            column(CheckedInBy; "Checked In By")
            {
            }
            column(Description; Description)
            {
            }
            column(Collected; Collected)
            {
            }
            column(FirearmType; "Firearm Type")
            {
            }
            column(ModelNo; "Model No")
            {
            }
            column(NoofMagazine; "No of Magazine")
            {
            }
            column(NoofRounds; "No of Rounds")
            {
            }
            column(Select; Select)
            {
            }
            column(SerialNo; "Serial No")
            {
            }
            column(ShelfNo; "Shelf No")
            {
            }
            column(ButtNo; "Butt No")
            {
            }
            column(CheckedOutBy; "Checked Out By")
            {
            }
            column(TimeIn; "Time In")
            {
            }
            column(TimeOut; "Time Out")
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
