page 52178978 "Administrator Role Centre"

{

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {


            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

            part("User Tasks Activities"; "User Tasks Activities")
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
            part(Control1904484608; "IT Operations Activities")
            {
                ApplicationArea = Basic, Suite;
            }

            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control58; "CRM Synch. Job Status Part")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control52; "Service Connections Part")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }

            group(Control1900724708)
            {
                ShowCaption = false;
                part(Control36; "Report Inbox Part")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control32; "My Job Queue")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Check on Ne&gative Inventory")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Check on Ne&gative Inventory';
                Image = "Report";
                Visible = false;
                RunObject = Report "Items with Negative Inventory";
                ToolTip = 'View a list of items with negative inventory and open warehouse documents for a location.';
            }
        }
        area(embedding)
        {
            ToolTip = 'Set up users and cross-product values, such as number series and post codes.';


            action("Cases - Dynamics 365 Customer Service")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cases - Dynamics 365 Customer Service';
                RunObject = Page "CRM Case List";
                ToolTip = 'View a list of Microsoft Dynamics 365 Customer Service cases.';
            }
            action("No. Series")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'No. Series';
                RunObject = Page "No. Series";
                ToolTip = 'Set up the number series from which a new number is automatically assigned to new cards and documents, such as item cards and sales invoices.';
            }
            action("Approval User Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval User Setup';
                RunObject = Page "Approval User Setup";
                ToolTip = 'View or edit information about workflow users who are involved in approval processes, such as approval amount limits for specific types of requests and substitute approvers to whom approval requests are delegated when the original approver is absent.';
            }
            action("Workflow User Groups")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Workflow User Groups';
                Image = Users;
                RunObject = Page "Workflow User Groups";
                ToolTip = 'View or edit the list of users that take part in workflows and which workflow user groups they belong to.';
            }
            action(Action57)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Workflows';
                Image = ApprovalSetup;
                RunObject = Page Workflows;
                ToolTip = 'Set up or enable workflows that connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in workflows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical workflow steps.';
            }
            action("Data Templates List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Data Templates List';
                RunObject = Page "Config. Template List";
                ToolTip = 'View or edit template that are being used for data migration.';
            }
            action("Base Calendar List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Base Calendar List';
                RunObject = Page "Base Calendar List";
                ToolTip = 'View the list of calendars that exist for your company and your business partners to define the agreed working days.';
            }
            action("Post Codes")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post Codes';
                RunObject = Page "Post Codes";
                ToolTip = 'Set up the post codes of cities where your business partners are located.';
            }
            action("Reason Codes")
            {
                ApplicationArea = Suite;
                Caption = 'Reason Codes';
                RunObject = Page "Reason Codes";
                ToolTip = 'View or set up codes that specify reasons why entries were created, such as Return, to specify why a purchase credit memo was posted.';
            }
            action("Extended Text")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Extended Text';
                RunObject = Page "Extended Text List";
                ToolTip = 'View or edit additional text for the descriptions of items. Extended text can be inserted under the Description field on document lines for the item.';
            }
        }
        area(sections)
        {
            group("User Management")
            {

                action(Users)
                {
                    ApplicationArea = all;
                    RunObject = page Users;
                }
                action("User Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Setup';
                    Image = UserSetup;
                    RunObject = Page "User Setup";
                    ToolTip = 'Set up users and define their permissions.';
                }
                action("User Settings")
                {
                    Caption = 'Profile Assigning';
                    ApplicationArea = all;
                    RunObject = page "User Settings List";
                }
                action("Portal Passwords")
                {
                    ApplicationArea = all;
                    // RunObject = page "User passwords";
                }


            }
            group("Job Queue")
            {
                Caption = 'Job Queue';
                Image = ExecuteBatch;
                ToolTip = 'Specify how reports, batch jobs, and codeunits are run.';
                action(JobQueue_JobQueueEntries)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Job Queue Entries';
                    RunObject = Page "Job Queue Entries";
                    ToolTip = 'View or edit the tasks that are set up to run business processes automatically at user-defined intervals.';
                }
                action("Job Queue Category List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Job Queue Category List';
                    RunObject = Page "Job Queue Category List";
                    ToolTip = 'View or edit the task categories that are set up to run business processes automatically at user-defined intervals.';
                }
                action("Job Queue Log Entries")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Job Queue Log Entries';
                    RunObject = Page "Job Queue Log Entries";
                    ToolTip = 'View information for job queue entries that have run or have not run due to errors including job queue entries that have the status On Hold.';
                }
            }
            group(Workflow)
            {
                Caption = 'Workflow';
                ToolTip = 'Set up workflow and approval users, and create workflows that govern how the users interact in processes.';
                action(Workflows)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Workflows';
                    Image = ApprovalSetup;
                    RunObject = Page Workflows;
                    ToolTip = 'Set up or enable workflows that connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in workflows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical workflow steps.';
                }
                action("Workflow Templates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Workflow Templates';
                    Image = Setup;
                    RunObject = Page "Workflow Templates";
                    ToolTip = 'View the list of workflow templates that exist in the standard version of Business Central for supported scenarios. The codes for workflow templates that are added by Microsoft are prefixed with MS-. You cannot modify a workflow template, but you use it to create a workflow.';
                }
                action(ApprovalUserSetup)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approval User Setup';
                    RunObject = Page "Approval User Setup";
                    ToolTip = 'View or edit information about workflow users who are involved in approval processes, such as approval amount limits for specific types of requests and substitute approvers to whom approval requests are delegated when the original approver is absent.';
                }
                action(WorkflowUserGroups)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Workflow User Groups';
                    Image = Users;
                    RunObject = Page "Workflow User Groups";
                    ToolTip = 'View or edit the list of users that take part in workflows and which workflow user groups they belong to.';
                }
            }
            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
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
                /* action(Appraisal)
                {
                    ApplicationArea = all;
                    RunObject = page "Employee Perf AppraisalsL";
                } */
                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }


                action("Purchase  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Requisitions';
                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }


                action(Action1000000003)
                {
                    ApplicationArea = all;
                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                }
            }




        }

        area(processing)
        {
            separator(Tasks)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("Com&pany Information")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Com&pany Information';
                Image = CompanyInformation;
                RunObject = Page "Company Information";
                ToolTip = 'Specify basic information about your company, which designates a complete set of accounting information and financial statements for a business entity. You enter information such as name, addresses, and shipping information. The information in the Company Information window is printed on documents, such as sales invoices.';
            }



            action("C&hange Log Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'C&hange Log Setup';
                Image = LogSetup;
                RunObject = Page "Change Log Setup";
                ToolTip = 'Define which contract changes are logged.';
            }
            separator(Action30)
            {
            }




            separator(Action264)
            {
            }

            separator(Action47)
            {
            }
            action("Service Trou&bleshooting")
            {
                ApplicationArea = Service;
                Caption = 'Service Trou&bleshooting';
                Image = Troubleshoot;
                RunObject = Page Troubleshooting;
                ToolTip = 'View or edit information about technical problems with a service item.';
            }

            separator(Action263)
            {
            }

        }
    }
}