page 52179128 "PC Role Center"
{
    Caption = 'Perfomance Contracting';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Page; "Approvals Activities")
            {
                ApplicationArea = All;
            }
            systempart(Notes; MyNotes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {



        area(reporting)
        {

        }




        area(sections)
        {
            /* group("Tasks Management")
            {
                Caption = '&Tasks Management';
                Image = LotInfo;
                action("To-Do List")
                {
                    Caption = '&To-Do List';
                    ApplicationArea = All;
                    RunObject = Page "To-Do List";
                }
                action("Pending Tasks")
                {
                    Caption = 'Pending Tasks';
                    ApplicationArea = All;
                    RunObject = Page "Pending Tasks";
                }
                action("Closed Tasks")
                {
                    Caption = 'Closed Tasks';
                    ApplicationArea = All;
                    RunObject = Page "Closed Tasks";
                }
                action("Cancelled Tasks")
                {
                    Caption = 'Cancelled Tasks';
                    ApplicationArea = All;
                    RunObject = Page "Cancelled Tasks";
                }

                action("Task Group Setup")
                {
                    Caption = '&Task Team';
                    ApplicationArea = All;
                    RunObject = page "Task Group Setup List";
                }
                action(EmployeeList)
                {
                    Caption = 'Employee List';
                    ApplicationArea = All;
                    RunObject = page "HRM-Employee List";
                }
            }
            group(Planning)
            {
                Caption = 'Calendar/Meetings';
                Image = Capacities;

                action(Planning2)
                {
                    Caption = 'Appointments';
                    ApplicationArea = All;
                    RunObject = Page "CEO-Appointments List";
                }
                action("Calendar Entries")
                {
                    Caption = 'Meetings';
                    ApplicationArea = All;
                    RunObject = Page "CEO-Calendar Deytails";
                }
                action(Calendar)
                {
                    Caption = 'Calendar Entries';
                    ApplicationArea = All;
                    RunObject = report "CEO-CalendarEntries";
                    // RunObject = Page "CEO Calendar Names";
                }
            } */
            // group("Perfomance Contracting")
            // {
            //     action("PC Periods")
            //     {
            //         ApplicationArea = all;
            //         RunObject = Page "PC Periods";
            //     }
            //     /* action("PC Quaters")
            //     {
            //         ApplicationArea = All;
            //         RunObject = Page "PC Quaterly Periods";
            //     } */
            //     action("PC SUbmissions")
            //     {
            //         ApplicationArea = All;
            //         RunObject = page "PC Quaterly Filters";
            //     }
            // }
            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = Payables;
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
                action("Salary Advance")
                {
                    ApplicationArea = all;

                    RunObject = page "FIN-Staff Advance List";
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
                // action("Memo applications")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Memo Application';

                //     //  RunObject = Page "FIN-Memo Header List All";
                //     ToolTip = 'Create Memo application from departments.';
                // }
                action("Purchase  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Requisitions';
                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
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
                action(Appraisal)
                {
                    ApplicationArea = all;
                    RunObject = page "Employee Perf AppraisalsL";
                }
                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';

                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }
                action("Pending Offs and Double Shifts")
                {
                    ApplicationArea = all;
                    RunObject = page "Pending Offs & Double Shifts";
                }
                action("Casual Requisition")
                {
                    ApplicationArea = All;
                    RunObject = page "Casual Requisition List";
                }

            }

        }
    }
}
// profile PC
// {
//     ProfileDescription = 'P Cprofile';
//     RoleCenter = "PC Role Center";
//     Caption = 'PC Office';
// }
