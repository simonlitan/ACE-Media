/// <summary>
/// Page ICT Support Desk RoleCenter (ID 52178456).
/// </summary>
page 52178906 "ICT Support Desk RoleCenters"

{
    Caption = 'Administration of users,Support Desk';
    Description = 'Manage users, Support Desk';
    Editable = false;
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control6; "Headline RC Security Admin")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control7; "User Security Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }

            part(Control15; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control12; "Users in User Groups Chart")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Subscription Plans"; "Plans FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Subscription Plans';
                Editable = false;
            }
            part(Control4; "User Groups FactBox")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
            }
            part("Plan Permission Set"; "Plan Permission Set")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Plan Permission Set';
                Editable = false;
            }
            part("Power BI Report Spinner Part"; "Power BI Report Spinner Part")
            {
                AccessByPermission = TableData "Power BI User Configuration" = I;
                ApplicationArea = Basic, Suite;
            }
            part("My Job Queue"; "My Job Queue")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control37; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = R;
                ApplicationArea = Basic, Suite;
            }
            systempart(MyNotes; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Approval Tracker")
            {
                ApplicationArea = All;
                RunObject = page "Approvals Tracker";
            }

            action("User Groups")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'User Groups';
                RunObject = Page "User Groups";
                ToolTip = 'Define user groups so that you can assign permission sets to multiple users easily. You can use a function to copy all permission sets from an existing user group to your new user group.';
            }
            action(Users)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Users';
                RunObject = Page Users;
                ToolTip = 'Set up the database users and assign their permission sets to define which database objects, and thereby which UI elements, they have access to, and in which companies. You can add users to user groups to make it easier to assign the same permission sets to multiple users. In the User Setup window, administrators can define periods of time during which specified users are able to post, and also specify if the system logs when users are logged on.';
            }
            action("User Review Log")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'User Review Log';
                RunObject = Page "Activity Log";
                RunPageView = WHERE("Table No Filter" = FILTER(9062));
                ToolTip = 'Monitor users'' activities in the database by reviewing changes that are made to data in tables that you select to track. Change log entries are chronologically ordered and show changes that are made to the fields on the specified tables. ';
            }
            action("Permission Sets")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Permission Sets';
                RunObject = Page "Permission Sets";
                ToolTip = 'Define collections of permissions each representing different access rights to certain database objects, and review which permission sets are assigned to users of the database to enable them to perform their tasks in the user interface. Users are assigned permission sets according to the Office 365 subscription plan.';
            }
            action(Plans)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Plans';
                RunObject = Page Plans;
                RunPageMode = View;
                ToolTip = 'View the details of your Office 365 subscription, including your different user profiles and their assigned licenses, such as the Team Member license. Note that users are created in Office 365 and then imported into Business Central with the Get Users from Office 365 action.';
            }
            // action("Approval Tracker")
            // {
            //     ApplicationArea = All;
            //     RunObject = page "Approvals Tracker";
            // }
        }

        area(sections)
        {
            group("User Management")
            {

                Caption = 'User Management';
                action(Action30)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Users';

                    RunObject = Page Users;
                    ToolTip = 'View or edit users that will be configured in the database.';
                }
                action(Action31)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Setup';

                    RunObject = Page "User Setup";
                    ToolTip = 'Set up or modify user setupd as a fast way of giving users access to the functionality that is relevant to their work.';
                }
                action(Action28)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Settings';

                    RunObject = Page "User Settings List";
                    ToolTip = 'View or edit which feature objects that users need to access and set up the related permissions in permission sets that you can assign to the users of the database.';
                }

                action(Action27)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Plans';

                    RunObject = Page Plans;
                    RunPageMode = View;
                    ToolTip = 'View subscription plans.';
                }
                action(Roles)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Profiles (Roles)';
                    RunObject = Page "Profile List";
                    RunPageMode = View;
                    ToolTip = 'View Profiles and Roles';
                }
                action(Action29)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Review Log';
                    RunObject = Page "Activity Log";
                    RunPageView = WHERE("Table No Filter" = FILTER(9062));
                    ToolTip = 'View a log of users'' activities in the database.';
                }
            }
            group("ICT Support")
            {
                Visible = false;
                action("Support Team")
                {
                    // RunObject = page "ICT Support Desk team";
                    ApplicationArea = All;
                }
                group(SupportDesk)
                {
                    Caption = 'Support Desk';
                    action(New)
                    {
                        Caption = 'New Requests';
                        Image = OpenJournal;
                        //  RunObject = page "ICT Support Desk";
                        ApplicationArea = Basic, Suite;
                    }
                    action(Submitted)
                    {
                        Caption = 'Submitted Requests';
                        Image = OpenJournal;
                        //   RunObject = page "ICT Support Desk Sub.List";
                        ApplicationArea = Basic, Suite;
                    }
                    action(Assigned)
                    {
                        ApplicationArea = Basic, Suite;
                        Image = AssessFinanceCharges;
                        // RunObject = page "Assigned Support  List ";
                    }
                    action(Resolved)
                    {
                        Caption = 'Resolved Issues';
                        Image = ResourceJournal;
                        // RunObject = page "Resolved Support List";
                        ApplicationArea = Basic, Suite;
                    }
                    action(Escallated)
                    {
                        Caption = 'Escalated Support';
                        Image = IssueFinanceCharge;
                        //  RunObject = page "ICT Support Escalate List";
                        ApplicationArea = Basic, Suite;
                    }
                    action(Closed)
                    {
                        //  RunObject = page "Closed Support List";
                        ApplicationArea = Basic, Suite;
                        Image = Closed;
                    }
                }
                action("ICT Support Desk Report")
                {
                    ApplicationArea = All;
                    //  RunObject = report "ICT Support Desk";
                }
            }

            group(WorkFlowMngnt)
            {
                Caption = 'Workflow Management';
                action(Workflows)
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = page Workflows;
                }
                action("Workflow User Groups")
                {
                    ApplicationArea = Basic, Suite;
                    RunObject = page "Workflow User Groups";
                }
                action("Approval User Setup")
                {
                    ApplicationArea = All;
                    RunObject = page "Approval User Setup";
                }
            }

            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Advance PettyCash.")
                {
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Advance PettyCash List";
                }

                action("PettyCash Surrender.")
                {
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Petty Cash Surrender List";
                }
                action("Stores Requisitions")
                {

                    Caption = 'Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition";
                    ApplicationArea = All;
                }
                action("Imprest Requisitions")
                {

                    Caption = 'Imprest Requisitions';
                    RunObject = Page "FIN-Imprest List UP";
                    ApplicationArea = All;
                }
                action("My Posted Imprests")
                {
                    RunObject = page "FIN-Posted imprest list";
                    ApplicationArea = all;
                }
                action("Imprest Accounting")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "FIN-Imprest Accounting";
                    ToolTip = 'Imprest Accounting';
                }
                action("Purchase  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }
                action("Memo applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'Memo Application';

                    RunObject = Page "FIN-Memo Header List All";
                    ToolTip = 'Create Memo application from departments.';
                }
                action("Leave Applications")
                {

                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                    ApplicationArea = All;
                }
                action("Training Application")
                {
                    ApplicationArea = all;
                    RunObject = page "HRM-Training Application List";
                }

                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }


                action("Pending Offs and Double Shifts")
                {
                    ApplicationArea = all;
                    RunObject = page "Pending Offs & Double Shifts";
                    Visible = false;
                }
                action("Casual Requisition")
                {
                    ApplicationArea = All;
                    RunObject = page "Casual Requisition List";
                }
                action("Staff Requisition")
                {
                    ApplicationArea = All;
                    RunObject = page "HRM-Employee Requisitions List";
                }

            }


            group(Companies)
            {
                action(Company)
                {
                    ApplicationArea = All;
                    Image = Company;
                    RunObject = page Companies;
                    Caption = 'Companies';
                }
            }
            // group("ICT Setups")
            // {
            //     action("ICT &Setups")
            //     {
            //         ApplicationArea = All;
            //         RunObject = page "ICT Setup";
            //     }
            //}

        }
        area(processing)
        {
            group(Flow)
            {
                Caption = 'Power Automate';
                action("Manage Flows")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Manage flows';
                    Image = Flow;
                    RunObject = Page "Flow Selector";
                    ToolTip = 'View or edit automated flows created with Power Automate.';
                }
            }
        }
    }
}