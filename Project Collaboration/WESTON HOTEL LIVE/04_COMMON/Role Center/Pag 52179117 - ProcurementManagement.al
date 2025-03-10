/// <summary>
/// Page Procurement Management (ID 52179117).
/// </summary>
page 52179117 "Procurement Management"
{
    Caption = 'Purchasing Agent', Comment = '{Dependency=Match,"ProfileDescription_PURCHASINGAGENT"}';
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
        area(reporting)
        {

            separator(Action28)
            {
            }
            action("Inventory - &Availability Plan")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory - &Availability Plan';
                Image = ItemAvailability;
                RunObject = Report "Inventory - Availability Plan";
                ToolTip = 'View a list of the quantity of each item in customer, purchase, and transfer orders and the quantity available in inventory. The list is divided into columns that cover six periods with starting and ending dates as well as the periods before and after those periods. The list is useful when you are planning your inventory purchases.';
            }


        }
        area(embedding)
        {
            action("Purchase Quotes")
            {
                ApplicationArea = Suite;
                Caption = 'Purchase Quotes';
                // RunObject = Page "Purchase Quotes";
                RunObject = page "Proc-Purchase Quotes List";
                ToolTip = 'Create purchase quotes to represent your request for quotes from vendors. Quotes can be converted to purchase orders.';
            }

            action(PurchaseOrders)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Orders';
                RunObject = Page "Purchase Order List";
                ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action(PurchaseOrdersPendConf)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pending Confirmation';
                RunObject = Page "Purchase Order List";
                RunPageView = WHERE(Status = FILTER(Open));
                ToolTip = 'View the list of purchase orders that await the vendor''s confirmation. ';
            }
            action(PurchaseOrdersPartDeliv)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Partially Delivered';
                RunObject = Page "Purchase Order List";
                RunPageView = WHERE(Status = FILTER(Released),
                                    Receive = FILTER(true),
                                    "Completely Received" = FILTER(false));
                ToolTip = 'View the list of purchases that are partially received.';
            }

            action("Blanket Purchase Orders")
            {
                ApplicationArea = Suite;
                Caption = 'Blanket Purchase Orders';
                RunObject = Page "Blanket Purchase Orders";
                ToolTip = 'Use blanket purchase orders as a framework for a long-term agreement between you and your vendors to buy large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a purchase order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes..';
            }
            action("Purchase Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Invoices';
                RunObject = Page "Purchase Invoices";
                ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
            }
            action("Purchase Return Orders")
            {
                ApplicationArea = PurchReturnOrder;
                Caption = 'Purchase Return Orders';
                RunObject = Page "Purchase Return Order List";
                ToolTip = 'Create purchase return orders to mirror sales return documents that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. Purchase return orders enable you to ship back items from multiple purchase documents with one purchase return and support warehouse documents for the item handling. Purchase return orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
            }
            action("Purchase Credit Memos")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Credit Memos';
                RunObject = Page "Purchase Credit Memos";
                ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
            }
            action("Assembly Orders")
            {
                ApplicationArea = Assembly;
                Caption = 'Assembly Orders';
                RunObject = Page "Assembly Orders";
                ToolTip = 'View ongoing assembly orders.';
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action(Vendors)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendors';
                Image = Vendor;
                RunObject = Page "Vendor List";
                ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Catalog Items")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Catalog Items';
                Image = NonStockItem;
                RunObject = Page "Catalog Item List";
                ToolTip = 'View the list of items that you do not carry in inventory. ';
            }
            action("Stockkeeping Units")
            {
                ApplicationArea = Warehouse;
                Caption = 'Stockkeeping Units';
                Image = SKU;
                RunObject = Page "Stockkeeping Unit List";
                ToolTip = 'Open the list of item SKUs to view or edit instances of item at different locations or with different variants. ';
            }
            action("Purchase Analysis Reports")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Analysis Reports';
                RunObject = Page "Analysis Report Purchase";
                RunPageView = WHERE("Analysis Area" = FILTER(Purchase));
                ToolTip = 'Analyze the dynamics of your purchase volumes. You can also use the report to analyze your vendors'' performance and purchase prices.';
            }
            action("Inventory Analysis Reports")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory Analysis Reports';
                RunObject = Page "Analysis Report Inventory";
                RunPageView = WHERE("Analysis Area" = FILTER(Inventory));
                ToolTip = 'Analyze the dynamics of your inventory according to key performance indicators that you select, for example inventory turnover. You can also use the report to analyze your inventory costs, in terms of direct and indirect costs, as well as the value and quantities of your different types of inventory.';
            }
            action("Item Journals")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Item),
                                    Recurring = CONST(false));
                ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
            }
            action("Purchase Journals")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Purchases),
                                    Recurring = CONST(false));
                ToolTip = 'Post any purchase-related transaction directly to a vendor, bank, or general ledger account instead of using dedicated documents. You can post all types of financial purchase transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a purchase journal.';
            }
            action(RequisitionWorksheets)
            {
                ApplicationArea = Planning;
                Caption = 'Requisition Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = WHERE("Template Type" = CONST("Req."),
                                    Recurring = CONST(false));
                ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
            }
            action(SubcontractingWorksheets)
            {
                ApplicationArea = Planning;
                Caption = 'Subcontracting Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = WHERE("Template Type" = CONST("For. Labor"),
                                    Recurring = CONST(false));
                ToolTip = 'Calculate the needed production supply, find the production orders that have material ready to send to a subcontractor, and automatically create purchase orders for subcontracted operations from production order routings.';
            }
            action("Standard Cost Worksheets")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Standard Cost Worksheets';
                RunObject = Page "Standard Cost Worksheet Names";
                ToolTip = 'Review or update standard costs. Purchasers, production or assembly managers can use the worksheet to simulate the effect on the cost of the manufactured or assembled item if the standard cost for consumption, production capacity usage, or assembly resource usage is changed. You can set a cost change to take effect on a specified date.';
            }
        }
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
                    RunObject = report "Stock Report";
                }


            }
            group("Archived Documents1")
            {
                action("Purchase Order Archive")
                {
                    ApplicationArea = all;
                    RunObject = page "Purchase Order Archives";
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
                action(" PettyCash User Application")
                {
                    Visible = false;
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
        area(creation)
        {
            action("Procurement Plan")
            {
                ApplicationArea = Suite;
                Caption = 'Procurement Plan';
                RunObject = Page "PROC-Procurement Plan List";
                ToolTip = 'Create purchase requisition from departments.';
            }
            action("Purchase Requisitions")
            {
                ApplicationArea = Suite;
                Caption = 'Internal Requisitions';
                RunObject = Page "All Purchase Requisitions";
                // RunPageView = where("Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
                ToolTip = 'Create purchase requisition from departments.';
            }



            action(PRN)
            {
                Image = Purchase;
                ApplicationArea = Suite;
                Caption = 'Approved PRNS';
                RunObject = page "Approved Prns";
                // RunPageView = where(status = filter(Released), "Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
                ToolTip = 'Create purchase Quotes from Vendors.';

            }
            action("Approved PRN Lines")
            {
                Visible = false;
                ApplicationArea = all;
                RunObject = page "Approved PRN Lines";
            }
            action(RFQ)
            {
                ApplicationArea = all;
                Caption = 'RFQ';
                RunObject = page "PROC-Purchase Quote List";
            }
            action("Purchase Quotes1")
            {
                ApplicationArea = Suite;
                Caption = 'Purchase Quotes';
                RunObject = Page "Purchase Quotes";
                ToolTip = 'Create purchase quotes to represent your request for quotes from vendors. Quotes can be converted to purchase orders.';
            }

            action("Procurement &Order")
            {
                ApplicationArea = Suite;
                Caption = 'Procurement &Order';
                Image = Document;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Order List";
                RunPageView = where("Document Type" = filter(Order));
                ToolTip = 'Create a new purchase order.';
            }
            action(PurchaseOrdersPartDelive)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Partially Delivered';
                RunObject = Page "Purchase Order List";
                RunPageView = WHERE(Status = FILTER(Released),
                                    Receive = FILTER(true),
                                    "Completely Received" = FILTER(false));
                ToolTip = 'View the list of purchases that are partially received.';
            }

            action("Purchase &Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase &Invoice';
                Image = NewPurchaseInvoice;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Purchase Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new purchase invoice.';
            }
        }
        area(processing)
        {
            separator(Tasks)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("&Purchase Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Purchase Journal';
                Image = Journals;
                RunObject = Page "Purchase Journal";
                ToolTip = 'Post purchase transactions directly to the general ledger. The purchase journal may already contain journal lines that are created as a result of related functions.';
            }
            action("Item &Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item &Journal';
                Image = Journals;
                RunObject = Page "Item Journal";
                ToolTip = 'Adjust the physical quantity of items on inventory.';
            }
            action("Order Plan&ning")
            {
                ApplicationArea = Planning;
                Caption = 'Order Plan&ning';
                Image = Planning;
                RunObject = Page "Order Planning";
                ToolTip = 'Plan supply orders order by order to fulfill new demand.';
            }
            separator(Action38)
            {
            }
            action("Requisition &Worksheet")
            {
                ApplicationArea = Planning;
                Caption = 'Requisition &Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Wksh. Names";
                RunPageView = WHERE("Template Type" = CONST("Req."),
                                    Recurring = CONST(false));
                ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
            }


            separator(History)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find entries...';
                Image = Navigate;
                RunObject = Page Navigate;
                ShortCutKey = 'Shift+Ctrl+I';
                ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
        }
    }
}