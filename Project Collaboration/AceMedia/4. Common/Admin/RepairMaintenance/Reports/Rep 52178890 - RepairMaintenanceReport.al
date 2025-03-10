report 52178890 "Repair/Maintenance Report"
{
    RDLCLayout = './Admin/RepairMaintenance/Reports/SSR/RepairMaintenance Report.rdl';
    DefaultLayout = RDLC;
    Caption = 'Repair/Maintenance Report';
    dataset
    {
        dataitem(RepairMaintenance; RepairMaintenance)
        {
            column(No; No)
            {
            }
            column(RequestDescription; "Request Description")
            {
            }
            column(Remarks; Remarks)
            {
            }
            column(RepairStatus; "Repair Status")
            {
            }
            column(Status; Status)
            {
            }
            column(DateCreated; "Date Created")
            {
            }
            column(Description; Description)
            {
            }
            column(CreatedBy_RepairMaintenance; "Created By")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
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
