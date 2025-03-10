page 52179099 "Common Requisition"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;


    layout
    {
        area(RoleCenter)
        {

            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

            /*  part("Approvals1"; "Approvals Activities Initial")
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
             } */



        }
    }

    actions
    {
        area(Sections)
        {
            group("Common Requisitions")
            {
                Caption = 'Requisitions';
                Image = LotInfo;
                action(" PettyCash User Application")
                {
                    ApplicationArea = ALL;
                    Image = Journal;
                    RunObject = Page "Petty Cash List";
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
                action("Memo applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'Memo Application';

                    RunObject = Page "FIN-Memo Header List All";
                    ToolTip = 'Create Memo application from departments.';
                }
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

                action("My Approved Leaves")
                {

                    Caption = 'My Approved Leaves';

                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        myInt: Integer;
}