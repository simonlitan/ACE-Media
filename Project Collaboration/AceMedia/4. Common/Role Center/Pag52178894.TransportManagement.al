page 52178894 "Transport Management"
{
    Caption = 'Transport Management';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {

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

        }
    }

    actions
    {
        area(Embedding)
        {


        }



        area(sections)
        {

            group(Approvals)
            {
                Caption = 'Approvals';
                Image = Alerts;

                action("Pending Approval")
                {
                    ApplicationArea = all;
                    Caption = 'Requests to Approval';
                    RunObject = Page "Requests to Approve";
                }
                action("Pending My Approval")
                {
                    ApplicationArea = all;
                    Caption = 'Pending My Approval';
                    RunObject = Page "Approval Entries";
                }
                action("My Approval requests")
                {
                    ApplicationArea = all;
                    Caption = 'My Approval requests';
                    RunObject = Page "Approval Request Entries";
                }

            }
            group("Transport Management")
            {

                action("Drivers")
                {
                    ApplicationArea = all;
                    RunObject = page "TR Drivers List";
                }
                action("Vehicles")
                {
                    ApplicationArea = all;
                    RunObject = page "TR Vehicle List";

                }

                group("Transport Requests")
                {

                    action("     ")
                    {

                    }
                    action("New Transport Requests")
                    {
                        ApplicationArea = all;
                        RunObject = page "TR Transport Request List";

                    }
                    action("Transport Requests Pending Approval")
                    {
                        ApplicationArea = all;
                        RunObject = page "TR Pending Approval List";

                    }
                    action("Approved Transport Requests")
                    {
                        ApplicationArea = all;
                        RunObject = page "TR Approved Transport List";

                    }

                }
                group("Work Tickets")
                {
                    action("      ")
                    {

                    }
                    action("Open Worktickets")
                    {
                        ApplicationArea = all;
                        RunObject = page "TR Workticket List";
                    }
                    action("Closed Worktickets")
                    {
                        ApplicationArea = all;
                        RunObject = page "TR Closed Worktickets";
                    }
                }
                group("Transport Reports")
                {
                    action("Drivers Report")
                    {
                        applicationarea = all;
                        runobject = report "TR Drivers1";
                    }
                    action("Vehicle Report")
                    {
                        applicationarea = all;
                        runobject = report "TR Vehicles1";
                    }
                    action("Workticket Report")
                    {
                        applicationarea = all;
                        runobject = report "TR Workticket";
                    }
                    action("Accident Report")
                    {
                        applicationarea = all;
                        runobject = report "TR Vehicle Accidents1";
                    }
                }

            }
            group("General Activities")
            {
                group("Memo Application.")
                {
                    action("Memo applications")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Memo Application';

                        RunObject = Page "FIN-Memo Header List All";
                        ToolTip = 'Create Memo application from departments.';
                    }
                    action("Approved Memo applications")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Approved Memo Application';

                        RunObject = Page "FIN-Memo List All";
                        ToolTip = 'Create Memo application from departments.';
                    }



                }
                group("Imprest Application")
                {
                    action("Imprest Requisitions")
                    {

                        Caption = 'Imprest Requisitions';
                        ApplicationArea = all;
                        RunObject = page "FIN-Imprests List";

                    }
                    action("My Approved Imprest")
                    {
                        ApplicationArea = all;
                        RunObject = Page "FIN-Imprest List UP";

                    }
                    action("My Posted Imprests")
                    {
                        RunObject = page "FIN-Posted imprest list";
                        ApplicationArea = all;
                    }

                }
                group("Imprest Accounting.")
                {

                    action("ImprestAccounting")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Imprest Surrender';
                        Image = Journal;
                        RunObject = Page "FIN-Imprest Accounting";
                        ToolTip = 'Imprest Surrender';
                    }
                    action("ImprestAccounting.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'My Approved Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "Approved Imprest Surrender";
                        ToolTip = 'Imprest Surrender';
                    }
                    action("ImprestAccounting1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'My Posted Imprest Accounting';
                        Image = Journal;
                        RunObject = Page "Posted Imprest Surrender";
                        ToolTip = 'Imprest Surrender';
                    }

                }
                action(SalaryAdvance8)
                {
                    Caption = 'Salary Advance';
                    ApplicationArea = all;
                    RunObject = page "Staff Advance";

                }
                action(ClaimReq1)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Claim Request List';
                    Image = Journal;
                    RunObject = Page "Staff Claim";
                    //ToolTip = 'Travel Request List';
                    //  FIN-Staff Claim List Posted
                }
                group("Leave Application")
                {
                    action("Leave Applications")
                    {

                        Caption = 'Leave Applications';
                        RunObject = Page "HRM-All Leave Requisitions";
                        ApplicationArea = All;
                    }
                    action("Approved Leave Applications")
                    {

                        Caption = 'My Approved Leave Applications';
                        RunObject = Page "HRM-My Approved Leaves List";
                        ApplicationArea = All;
                    }
                    action("Posted Leave Applications")
                    {

                        Caption = 'My Posted Leave Applications';
                        RunObject = Page "HRM-Leave Requisition List";
                        ApplicationArea = All;
                    }

                }
                group("Purchase Requisition")
                {
                    action("Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }
                    action("Approved Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Approved Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }
                    action("Posted Purchase  Requisitions")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Posted Purchase Requisitions';

                        RunObject = Page "FIN-Purchase Requisition";
                        ToolTip = 'Create purchase requisition from departments.';
                    }

                }
                group("Store Requisitions")
                {
                    action("Stores Requisitions")
                    {

                        Caption = 'Stores Requisitions';
                        RunObject = Page "PROC-Store Requisition";
                        ApplicationArea = All;
                    }
                    action("Approved Stores Requisitions")
                    {

                        Caption = 'Approved Stores Requisitions';
                        RunObject = Page "PROC-Store Requisition2";
                        ApplicationArea = All;

                    }
                    action("Posted Stores Requisitions")
                    {

                        Caption = 'Posted Stores Requisitions';
                        RunObject = Page "PROC-Posted Store Req List";
                        ApplicationArea = All;
                    }

                }
            }
        }


    }
}


