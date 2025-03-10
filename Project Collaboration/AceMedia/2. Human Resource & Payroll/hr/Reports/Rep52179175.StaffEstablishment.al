report 52179175 "Staff Establishment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/Staff Establishment.rdl';
    Caption = 'Staff Establishment';
    dataset
    {
        dataitem(HRMJobs; "HRM-Jobs")
        {
            RequestFilterFields = "Job ID";
            DataItemTableView = order(ascending);
            column(GlobalDimension1Code_HRMJobs; "Global Dimension 1 Code")
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
            column(OccupiedPositions_HRMJobs; "Occupied Positions")
            {
            }
            column(JobID; "Job ID")
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(Grade; Grade)
            {
            }
            column(NoofPosts; "No of Posts")
            {
            }
            column(Category; Category)
            {
            }
            column(VacantPositions; "Occupied Positions" - "No of Posts")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(Seq1; Seq1)

            {

            }
            column(ProjectName; ProjectName)
            {

            }
            column(Divisioname; Divisioname)
            {

            }
            trigger OnAfterGetRecord()
            begin
                Seq1 := Seq1 + 1;
                Dimension.Reset();
                Dimension.SetRange(code, HRMJobs."Global Dimension 1 Code");
                if Dimension.Find('-') then begin
                    ProjectName := Dimension.Name;
                end;
                Dimension.Reset();
                Dimension.SetRange(code, HRMJobs."Shortcut Dimension 3 Code");
                if Dimension.Find('-') then
                    Divisioname := Dimension.Name;
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
        Clear(seq1);
        HRMJobs.CalcFields("Occupied Positions");


    end;

    var
        Compinfo: Record "Company Information";
        Seq: Integer;
        Seq1: Integer;
        ProjectName: Text[250];
        Divisioname: Text[250];
        Dimension: Record "Dimension Value";
}
