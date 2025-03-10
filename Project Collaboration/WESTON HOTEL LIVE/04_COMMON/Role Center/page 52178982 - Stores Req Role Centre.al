page 52178982 "Stores Req Role Centre"
{
    Caption = 'STORE MANAGEMENT';
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
        }
    }

    actions
    {
        area(sections)
        {
            group("Store Requisition")
            {
                Caption = 'Store Requisitions';

                action("Storess Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition2";
                    RunPageView = where(status = filter(<> Released));
                }
                action("Released Stores Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Released Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition2";
                    RunPageView = where(status = filter(Released));
                }

                action("Posted Store Requisitions")
                {
                    Caption = 'Posted Store Requisitions';
                    ApplicationArea = All;
                    Image = PostedOrder;
                    RunObject = Page "PROC-Posted Store Req List";

                }
                action("Stock Report")
                {
                    ApplicationArea = all;
                    //RunObject = report "Stock Report";
                    RunObject = report "Stock Summary";
                }


            }


            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }
                action("Posted Return Shipments")
                {
                    Visible = false;
                    ApplicationArea = PurchReturnOrder;
                    Caption = 'Posted Return Shipments';
                    RunObject = Page "Posted Return Shipments";
                    ToolTip = 'Open the list of posted return shipments.';
                }
                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Posted Assembly Orders")
                {
                    Visible = false;
                    ApplicationArea = Assembly;
                    Caption = 'Posted Assembly Orders';
                    RunObject = Page "Posted Assembly Orders";
                    ToolTip = 'View completed assembly orders.';
                }
            }
            group("Archived Documents")
            {
                action("Purchase Order Archives")
                {
                    ApplicationArea = all;
                    RunObject = page "Purchase Order Archives";
                }
            }


            group(Common_req)
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;

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

                action("My Approved Leaves")
                {
                    ApplicationArea = all;
                    Caption = 'My Approved Leaves';
                    Image = History;
                    RunObject = Page "HRM-My Approved Leaves List";
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
                /*  action(Appraisal)
                 {
                     ApplicationArea = all;
                     RunObject = page "Employee Perf AppraisalsL";
                 } */


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


        area(Processing)
        {
            group("purchase Order")
            {
                action(LPO)
                {
                    ApplicationArea = ALL;
                    RunObject = page "Purchase Order List";
                }
                action("Credit Memo")
                {
                    ApplicationArea = all;
                    RunObject = page "Purchase Credit Memos";
                }
            }

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
        }


    }
}

