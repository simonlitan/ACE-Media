report 52178876 "ICT Support Desk"
{
    ApplicationArea = All;
    Caption = 'ICT Support Desk';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Rmp & ict/ICT DESK/Report Layouts/ICT Support Desk.rdl';
    dataset
    {
        dataitem(ICTSupportDesk; "ICT Support Desk")
        {
            RequestFilterFields = "Issue Area", "Assigned Technician", "Issue Status";
            column(Logo; CompInfo.Picture) { }
            column(CompanyName; CompInfo.Name) { }
            column(Address; CompInfo.Address) { }
            column(Phone; CompInfo."Phone No.") { }
            column(Title; Format(UpperCase(Title))) { }
            column(TicketNo; "No.")
            {
            }
            column(IssueArea; "Issue Area")
            {
            }
            column(IssueDescription; "Issue Description")
            {
            }
            column(IssueStatus; "Issue Status")
            {
            }
            column(AssigniningAdminstrator; "Assignining Adminstrator")
            {
            }
            column(AssignedTechnician; "Assigned Technician")
            {
            }
            column(SolutionMethod; "Solution Method")
            {
            }
            column(EscalationLevels; "Escalation Levels")
            {
            }
            column(Level2USERID; "Level 2 USERID")
            {
            }
            column(Level3USERID; "Level 3 USERID")
            {
            }
            column(ConsultantResolving; "Consultant Resolving")
            {
            }
            column(Raised_Date; Format("Raised Date")) { }
            column(Resolved_Date; Format("Resolved Date")) { }
            column(Escallation_Date; Format("Escallation Date")) { }
            column(RequestingUser; "Requesting User")
            {
            }
            column(AreaDescription; "Area Description")
            {
            }
            column(SolutionDescription; "Solution Description")
            {
            }
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
        Title: Label 'ICT Support Desk Report';
}
