page 52178573 "Loyalty Programme RC"
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
        }
    }

    actions
    {
        area(Reporting)
        {

        }


        area(Sections)
        {
            group(Setups)
            {
                action("Series Setup")
                {
                    ApplicationArea = All;
                    Image = SetupPayment;
                    RunObject = page "Loyalty Series Setups";
                }
                action("Loyalty Periods")
                {
                    ApplicationArea = All;
                    Image = LotProperties;
                    RunObject = page "Loyalty Periods";

                }
                action("Loyalty Programmes")
                {
                    ApplicationArea = All;
                    Image = PostedVoucherGroup;
                    RunObject = page "Loyalty Programmes";
                }
            }
            group("Subscribed Customers")
            {
                action("Loyalty Subscriptions")
                {
                    ApplicationArea = All;
                    Image = Delivery;
                    RunObject = page "Loyalty Subscription";
                }
            }
            group("Sale programmes")
            {
                action("Points Subscription")
                {
                    ApplicationArea = All;
                    Image = SubcontractingWorksheet;
                    RunObject = page "Loyalty Sales Capture";
                }
                action("Membership Subscription")
                {
                    ApplicationArea = All;
                    Image = SubcontractingWorksheet;
                    RunObject = page "Loyalty Sales Subscriptions";
                }
            }

            group("Common Requisitions")
            {
                Caption = 'Common Requisitions';
                Image = LotInfo;
                action("Stores RequSSisitions")
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