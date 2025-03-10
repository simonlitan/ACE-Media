page 52178977 "CA-RoleCenter"
{
    PageType = RoleCenter;
    Caption = 'Corporate Affairs Role Center';

    layout
    {
        area(RoleCenter)
        {
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

            part("Approvals1"; "Approvals Activities Initial")
            {
                ApplicationArea = Suite;
            }
            part("Approvals2"; "Approvals Activities One")
            {
                ApplicationArea = Suite;
            }
            part("Approvals3"; "Approvals Activities Two")
            {
                ApplicationArea = Suite;
            }
            part("Approvals4"; "Approvals Activities Three")
            {
                ApplicationArea = Suite;

            }
            part("Approvals5"; "Approvals Activities Four")
            {
                ApplicationArea = Suite;

            }
            part("Approvals6"; "Approvals Activities Five")
            {
                ApplicationArea = Suite;

            }
            part("Approvals7"; "Approvals Activities six")
            {
                ApplicationArea = Suite;
            }
            part("Approvals8"; "Approvals Activities seven")
            {
                ApplicationArea = Suite;
            }
            part("Approvals9"; "Approvals Activities Eight")
            {
                ApplicationArea = Suite;
            }
            part("Approvals10"; "Approvals Activities Nine")
            {
                ApplicationArea = Suite;
            }
            part("Approvals11"; "Approvals Activities Ten")
            {
                ApplicationArea = Suite;
            }
            part("Approvals12"; "Approvals Activities Eleven")
            {
                ApplicationArea = Suite;
            }
            part("Approvals13"; "Approvals Activities Twelve")
            {
                ApplicationArea = Suite;
            }
            part("Approvals14"; "Approvals Activities Thirteen")
            {
                ApplicationArea = Suite;
            }
            part(Control102; "Headline RC Project Manager")
            {
                ApplicationArea = Jobs;
            }


        }
    }

    actions
    {
        area(Sections)
        {
            /*  group(Complaints)
             {
                 Caption = 'Complaints';
                 Image = Alerts;
                 action(Grievances)
                 {
                     ApplicationArea = all;
                     Caption = 'Complaints List';
                     RunObject = Page "Complaints List";
                 }
                 action(Pending)
                 {
                     ApplicationArea = all;
                     Caption = 'Pending Complaints';
                     RunObject = Page "Complaints Pending";
                 }
                 action(ClosedCasesEnd)
                 {
                     ApplicationArea = all;
                     Caption = 'Closed Cases';
                     RunObject = Page "Complaints Closed";
                 }

             } */
            group("Branding")
            {
                Caption = 'Branding';
                action("Branding List")
                {
                    Caption = 'Branding Requisition';
                    Image = MovementWorksheet;
                    RunObject = Page "CA-Branding Req. List";
                    ApplicationArea = All;
                }
                action("Posted Branding List")
                {
                    Caption = 'Posted Branding Requisitions';
                    Image = MovementWorksheet;
                    RunObject = Page "CA-Branding Req. List-Posted";
                    ApplicationArea = All;
                }
            }
            group("CSR")
            {
                action("CSR List")
                {
                    Caption = 'CSR Memo';
                    Image = PlannedOrder;
                    RunObject = page "CA-CSR Req. List";
                    ApplicationArea = All;
                }
                action("Approved CSR List")
                {
                    Caption = 'Approved CSR Memo';
                    Image = PlannedOrder;
                    RunObject = page "CA-CSR Req. Approved";
                    ApplicationArea = All;
                }
            }
            group("Feedback")
            {
                action("Feedback2")
                {
                    Caption = 'Feedback List';
                    Image = Users;
                    RunObject = page "CA-Feedback List";
                    ApplicationArea = All;
                }
            }
            group("Risks Register")
            {
                Image = RegisteredDocs;
                action("Risk List")
                {
                    ApplicationArea = All;
                    //      RunObject = Page 63202;
                }
                action("Submitted Risks Under Audit")
                {
                    ApplicationArea = All;
                    //   RunObject = Page 63203;
                }
            }
            group("Audit Planner")
            {
                Image = Job;
                action("Audit-Plan-Master")
                {
                    ApplicationArea = All;
                    //  RunObject = Page "Audit-Plan-Master";
                }
            }
            group("Audit Assessment")
            {
                Image = AnalysisView;
                action("Audit Assessment List")
                {
                    ApplicationArea = All;
                    //  RunObject = Page 63290;
                }
                action("Audit Review List")
                {
                    ApplicationArea = All;
                    //  RunObject = Page 62345;
                }
                action("Archived Audit List")
                {
                    ApplicationArea = All;
                    //      RunObject = Page 62346;
                }
            }
        }
    }

    var
        myInt: Integer;
}