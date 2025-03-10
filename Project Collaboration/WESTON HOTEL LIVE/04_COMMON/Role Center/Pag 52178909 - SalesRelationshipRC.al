page 52178909 "Sales Relationship RC"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {

            part(Control1; "Sales & Relationship Mgr. Act.")
            {
                ApplicationArea = RelationshipMgmt;
            }

            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = RelationshipMgmt;
            }

            part(Control4; "Opportunity Chart")
            {
                ApplicationArea = RelationshipMgmt;
            }
            part(Control11; "Relationship Performance")
            {
                ApplicationArea = RelationshipMgmt;
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action(Salespersons)
            {
                ApplicationArea = Suite, RelationshipMgmt;
                Caption = 'Salespersons';
                RunObject = Page "Salespersons/Purchasers";
                ToolTip = 'View or edit information about the sales people that work for you and which customers they are assigned to.';
            }

            action(Contacts)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Contacts';
                Image = CustomerContact;
                RunObject = Page "Contact List";
                ToolTip = 'View a list of all your contacts.';
            }
            action(Opportunities)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Opportunities';
                RunObject = Page "Opportunities List";
                ToolTip = 'View the sales opportunities that are handled by salespeople for the contact. Opportunities must involve a contact and can be linked to campaigns.';
            }
            action("Sales Quotes")
            {
                ApplicationArea = RelationshipMgmt;
                Caption = 'Sales Quotes';
                Image = Quote;
                RunObject = Page "Sales Quote List";
                ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
            }
            action("Sales Invoice")
            {
                ApplicationArea = RelationshipMgmt;
                Image = Quote;
                RunObject = Page "Sales Invoice.List";
                ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
            }




        }
        area(Reporting)
        {
            group("Crm Setups")
            {
                action("Confrence Type Setup")
                {
                    ApplicationArea = All;
                    //Image = SetupPayment;
                    RunObject = page "Confrence Type Setup";
                }
                action("Series Setup")
                {
                    ApplicationArea = All;
                    Image = SetupPayment;
                    RunObject = page "Loyalty Series Setups";
                }
                action(Blocks)
                {
                    ApplicationArea = All;
                    Image = BookingsLogo;
                    RunObject = page Blocks;
                }
                action("Loyalty Periods")
                {
                    ApplicationArea = All;
                    Image = LotProperties;
                    RunObject = page "Loyalty Periods";

                }
                action("Sales Cycles")
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Sales Cycles';

                    RunObject = Page "Sales Cycles";
                    ToolTip = 'View the different sales cycles that you use to manage sales opportunities.';
                }
                action(Salesperson)
                {
                    ApplicationArea = Suite, RelationshipMgmt;
                    Caption = 'Salespersons';
                    RunObject = Page "Salespersons/Purchasers";
                    ToolTip = 'View or edit information about the sales people that work for you and which customers they are assigned to.';
                }
                group("Loyalty Setup")
                {
                    action("Loyalty Programmes")
                    {
                        ApplicationArea = All;
                        Image = PostedVoucherGroup;
                        RunObject = page "Loyalty Programmes";
                    }
                }


            }
        }
        area(sections)
        {
            group("SalesPerson WorkPlan")
            {
                action(WorkPlan)
                {
                    ApplicationArea = all;
                    RunObject = page "Workplan List";
                }

                action("Closed WorkPlan")
                {
                    ApplicationArea = all;
                    RunObject = page "Closed Workplan";
                }
            }
            group(Action257)
            {

                Caption = 'Sales Process';

                action(Action66)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Opportunities';

                    RunObject = Page "Opportunities List";
                    ToolTip = 'View the sales opportunities that are handled by salespeople for the contact. Opportunities must involve a contact and can be linked to campaigns.';
                }
                action(Action67)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Contacts';
                    Image = CustomerContact;
                    RunObject = Page "Contact List";
                    ToolTip = 'View or edit detailed information about the contact persons at your business partners that you use to communicate business activities with or that you target marketing activities towards.';
                }

                action(Action65)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Sales Quotes';
                    Image = Quote;

                    RunObject = Page "Sales Quotes";
                    ToolTip = 'Make offers to customers to sell certain products on certain delivery and payment terms. While you negotiate with a customer, you can change and resend the sales quote as much as needed. When the customer accepts the offer, you convert the sales quote to a sales invoice or a sales order in which you process the sale.';
                }

                action("Sales Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Invoices';

                    RunObject = Page "Sales Invoice.List";
                    ToolTip = 'Register your sales to customers and invite them to pay according to the delivery and payment terms by sending them a sales invoice document. Posting a sales invoice registers shipment and records an open receivable entry on the customer''s account, which will be closed when payment is received. To manage the shipment process, use sales orders, in which sales invoicing is integrated.';
                }
            }



            group(Analysis)
            {
                Visible = false;
                Caption = 'Analysis';

                action("Sales Budgets")
                {
                    ApplicationArea = SalesBudget;
                    Caption = 'Sales Budgets';

                    RunObject = Page "Budget Names Sales";
                    ToolTip = 'Enter item sales values of type amount, quantity, or cost for expected item sales in different time periods. You can create sales budgets by items, customers, customer groups, or other dimensions in your business. The resulting sales budgets can be reviewed here or they can be used in comparisons with actual sales data in sales analysis reports.';
                }
                action(Action38)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Contacts';
                    Image = CustomerContact;

                    RunObject = Page "Contact List";
                    ToolTip = 'View a list of all your contacts.';
                }
                action(Action21)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Customers';
                    Image = Customer;

                    RunObject = Page "Customer List";
                    ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
                }
            }

            group("Loyalty Program")
            {

                action("Loyalty Subscriptions")
                {
                    ApplicationArea = All;
                    Image = Delivery;
                    RunObject = page "Loyalty Subscription";
                }

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
                    Visible = false;

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
                action("Staff Requisition")
                {
                    ApplicationArea = All;
                    RunObject = page "HRM-Employee Requisitions List";
                }
            }
        }


    }
}

