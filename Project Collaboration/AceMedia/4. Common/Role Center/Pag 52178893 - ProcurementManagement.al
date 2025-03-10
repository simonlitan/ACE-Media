/// <summary>
/// Page Procurement Management (ID 52179117).
/// </summary>
page 52178893 "Procurement Management"

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
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }



            action(PurchaseOrdersPendConf)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Order';
                RunObject = Page "Purchase Order List";
                //  RunPageView = WHERE(Status = FILTER(Open));
                ToolTip = 'View the list of purchase orders that await the vendor''s confirmation. ';
            }
            /*
            action(PurchaseOrdersPartDeliv)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Partially Delivered';
                RunObject = Page "Purchase Order List";
                RunPageView = WHERE(Status = FILTER(Released),
                                    Receive = FILTER(true),
                                    "Completely Received" = FILTER(false));
                ToolTip = 'View the list of purchases that are partially received.';
            } */
            /* 
             action("Blanket Purchase Orders")
             {
                 ApplicationArea = Suite;
                 Caption = 'Blanket Purchase Orders';
                 RunObject = Page "Blanket Purchase Orders";
                 ToolTip = 'Use blanket purchase orders as a framework for a long-term agreement between you and your vendors to buy large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a purchase order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes..';
             } */
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


        }
        area(sections)
        {
            group("Purchase Order")
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
                action(PurchaseOrdersendConf)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pending Order Confirmation';
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
            }
            group("Planning/Requisitions")
            {
                group("Procurement Plan ")
                {

                    action("Plan Periods")
                    {
                        ApplicationArea = all;
                        RunObject = page "Proc Plan Periods";
                    }
                    action("Directorate Plan")
                    {
                        ApplicationArea = Suite;

                        RunObject = Page "PROC-Procurement Plan List";
                        ToolTip = 'Create purchase requisition from departments.';
                    }
                    action("Consolidated Plan")
                    {
                        ApplicationArea = Suite;
                        RunObject = Page "Proc Consolidated List";
                        ToolTip = 'Create purchase requisition from departments.';
                    }

                }
                /* action("Purchase Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'All Internal Requisitions';
                    RunObject = Page "All Purchase Requisitions";
                    // RunPageView = where("Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
                    ToolTip = 'Create purchase requisition from departments.';
                } */
                action(PRN)
                {
                    Image = Purchase;
                    ApplicationArea = Suite;
                    Caption = 'Approved Requisitions';
                    RunObject = page "Approved Prns";
                    // RunPageView = where(status = filter(Released), "Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
                    ToolTip = 'Create purchase Quotes from Vendors.';
                }
                action("Approved PRN Lines")
                {
                    Caption = 'Approved Requisition Lines';
                    ApplicationArea = all;
                    RunObject = page "Approved Prn Lines";
                }
            }

            group("Committee Selection")
            {
                action("Committee Appointments")
                {
                    ApplicationArea = all;
                    RunObject = page "Proc-Committee List";
                    RunPageView = where(Status = filter(<> Approved));
                }

                action("Approved Committee Appointments")
                {
                    ApplicationArea = all;
                    RunObject = page "Proc-Committee List";
                    RunPageView = where(Status = filter(Approved));
                }
            }
            group("Tender Opening & Evaluation")
            {

                action("Tender/RFQ Opening")
                {
                    ApplicationArea = All;
                    Image = OpenWorksheet;
                    RunObject = page "Proc-Tender Opening";
                }
                group("Evaluations")
                {
                    action("Preliminary Evaluation")
                    {
                        ApplicationArea = All;
                        Image = OpenWorksheet;
                        RunObject = page "Proc-PreliminaryQEval";
                    }
                    action("Technical Evaluation")
                    {
                        ApplicationArea = All;
                        Image = OpenWorksheet;
                        RunObject = page "Proc-TechnicalQEval";
                    }
                    action("Demonstration Evaluation")
                    {
                        ApplicationArea = All;
                        Image = OpenWorksheet;
                        RunObject = page "Proc-DemoQEval";
                    }
                    action("Evaluation Report")
                    {
                        ApplicationArea = All;
                        Image = Evaluate;
                        RunObject = page "Proc-Evaluation report";
                    }

                }


            }
            group("Store Requisition")
            {
                Caption = 'Store Requisitions';

                action("Storess Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Stores Requisitions Pending Approval';
                    RunObject = Page "PROC-Store Requisition2";
                    RunPageView = where(status = filter("Pending Approval"));
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
                    ApplicationArea = All;
                    Image = PostedOrder;
                    RunObject = report "Inventory - Transaction Detail";

                }


            }



            group("General Activities")
            {
                group(Appraisal)
                {
                    action("Self Workplan")
                    {
                        ApplicationArea = all;
                        RunObject = page "Staff Workplan";
                    }
                    action("Self Appraisal")
                    {
                        ApplicationArea = all;
                        RunObject = page "Staff Self Appraisal";
                    }
                }

                action("Memo applications")
                {
                    ApplicationArea = Suite;
                    Caption = 'Memo Application';

                    RunObject = Page "FIN-Memo Header List All";
                    ToolTip = 'Create Memo application from departments.';
                }
                action("Approved Memo applications")
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Approved Memo Application';

                    RunObject = Page "FIN-Memo List All";
                    ToolTip = 'Create Memo application from departments.';
                }





                action("Imprest Requisitions")
                {

                    Caption = 'Imprest Requisitions';
                    ApplicationArea = all;
                    RunObject = page "FIN-Imprests List";

                }
                action("My Approved Imprest")
                {
                    Visible = false;
                    ApplicationArea = all;
                    RunObject = Page "FIN-Imprest List UP";

                }
                action("My Posted Imprests")
                {
                    Visible = false;
                    RunObject = page "FIN-Posted imprest list";
                    ApplicationArea = all;
                }



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
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'My Approved Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "Approved Imprest Surrender";
                    ToolTip = 'Imprest Surrender';
                }
                action("ImprestAccounting1")
                {
                    Visible = false;
                    ApplicationArea = Basic, Suite;
                    Caption = 'My Posted Imprest Accounting';
                    Image = Journal;
                    RunObject = Page "Posted Imprest Surrender";
                    ToolTip = 'Imprest Surrender';


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

                action("Leave Applications")
                {

                    Caption = 'Leave Applications';
                    RunObject = Page "HRM-All Leave Requisitions";
                    ApplicationArea = All;
                }
                action("Training Projection & Development")
                {
                    ApplicationArea = all;
                    RunObject = page "Training & Development List";
                }
                action("Approved Leave Applications")
                {
                    Visible = false;

                    Caption = 'My Approved Leave Applications';
                    RunObject = Page "HRM-My Approved Leaves List";
                    ApplicationArea = All;
                }
                action("Posted Leave Applications")
                {
                    Visible = false;

                    Caption = 'My Posted Leave Applications';
                    RunObject = Page "HRM-Leave Requisition List";
                    ApplicationArea = All;
                }



                action("Purchase  Requisitions")
                {
                    ApplicationArea = Suite;
                    Caption = 'Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }
                action("Approved Purchase  Requisitions")
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Approved Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }
                action("Posted Purchase  Requisitions")
                {
                    Visible = false;
                    ApplicationArea = Suite;
                    Caption = 'Posted Purchase Requisitions';

                    RunObject = Page "FIN-Purchase Requisition";
                    ToolTip = 'Create purchase requisition from departments.';
                }


                action("Stores Requisitions")
                {

                    Caption = 'Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition";
                    ApplicationArea = All;
                }
                action("Approved Stores Requisitions")
                {
                    Visible = false;

                    Caption = 'Approved Stores Requisitions';
                    RunObject = Page "PROC-Store Requisition2";
                    ApplicationArea = All;

                }
                action("Posted Stores Requisitions")
                {
                    Visible = false;

                    Caption = 'Posted Stores Requisitions';
                    RunObject = Page "PROC-Posted Store Req List";
                    ApplicationArea = All;
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

                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }

            }
            group("Archived Documents")
            {
                action("Purchase Orders")
                {
                    ApplicationArea = all;
                    RunObject = page "Purchase Order Archives";
                }
                action("Purchase Quote")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Purchase Quote Archives';
                    RunObject = page "Purchase Quote Archives";
                }
            }
        }
        area(creation)
        {

            group("Prequalification Setups")
            {
                Caption = 'Setups';
                action("Document Serialization")
                {
                    Image = SetupLines;
                    ApplicationArea = all;
                    RunObject = page "Proc Number Setups";
                }
                action("Vendor Categories")
                {
                    Image = Category;
                    ApplicationArea = all;
                    //RunObject = page "Vendor Categories";
                }
                action("Prequalification Periods")
                {
                    ApplicationArea = All;
                    Image = CreateYear;
                    RunObject = Page "Proc-Prequalification Years";

                }
                action("Goods Categories")
                {
                    ApplicationArea = All;
                    Image = Category;
                    RunObject = Page "Proc-Goods Classification";
                }
            }

            group("Vendor Management")
            {

                action("Prequalification Applications")
                {
                    ApplicationArea = All;
                    Image = CreateInteraction;
                    RunObject = page "Prequalification Application";
                }
                action("Prequalified Applications")
                {
                    ApplicationArea = All;
                    Image = CreateInteraction;
                    RunObject = page "Proc-Preq. Suppliers/Category";

                }
                action("Supplier/Vendor List")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Vendor;
                    RunObject = Page "Vendor List";
                    ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
                }
            }
            group("Procurement Methods")
            {

                action("DirectProcurement")
                {
                    Caption = 'Direct Procurement';
                    Image = MakeOrder;
                    ApplicationArea = All;
                    RunObject = page "Proc-Purchase Direct List";
                    // RunObject = Page "Purchase Order List";
                }
                action(FRQs)
                {
                    Image = CoupledQuote;
                    ApplicationArea = all;
                    Caption = 'Request For Quotation(s)';
                    RunObject = Page "PROC-Purchase Quote List";
                    ToolTip = 'Create purchase requisition from departments.';
                }
                group("Open Tender(s)")
                {
                    Image = OpenJournal;
                    action("Tender(s)")
                    {
                        Caption = 'Tender List';
                        ApplicationArea = All;
                        Image = OpenWorksheet;
                        RunObject = page "PROC Open.Tender List";
                    }
                    action("Bidders")
                    {
                        Image = DesignCodeBehind;
                        ApplicationArea = basic, suite;
                        RunObject = Page "Tender Applicants List";
                    }
                }

                action("Restricted Tendering ")
                {
                    Image = SparkleFilled;
                    ApplicationArea = All;
                    RunObject = Page "PROC-Purchase Restricted List";
                }

                action("Two Stage Tendering")
                {
                    Image = CompareCosttoCOA;
                    ApplicationArea = All;
                    RunObject = Page "PROC-Two Stage.Tender List";
                }
                action("Low Value")
                {

                    applicationarea = all;
                    Image = Log;
                    runobject = page "Proc-Low Value List";

                }
                action("Counsultancy Services")
                {
                    Image = ContactPerson;
                    applicationarea = all;
                    runobject = page "Proc-Consultancy Services List";
                }
                action("Framework Agreement")
                {
                    Image = FileContract;
                    applicationarea = all;
                    runobject = page "Proc Framework Agreement list";
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
    // layout
    // {
    //     area(rolecenter)
    //     {
    //         part(ApprovalsActivities; "Approvals Activities")
    //         {
    //             ApplicationArea = Suite;
    //         }
    //         part("Approvals1"; "Approvals Activities Initial")
    //         {
    //             ApplicationArea = Suite;
    //         }
    //         part("Approvals2"; "Approvals Activities One")
    //         {
    //             ApplicationArea = Suite;
    //         }
    //         part("Approvals3"; "Approvals Activities Two")
    //         {
    //             ApplicationArea = Suite;

    //         }
    //         part("Approvals4"; "Approvals Activities Three")
    //         {
    //             ApplicationArea = Suite;

    //         }
    //         part("Approvals5"; "Approvals Activities Four")
    //         {
    //             ApplicationArea = Suite;

    //         }
    //         part("Approvals6"; "Approvals Activities Five")
    //         {
    //             ApplicationArea = Suite;

    //         }
    //         part("Approvals7"; "Approvals Activities six")
    //         {
    //             ApplicationArea = Suite;
    //         }
    //         part("Approvals8"; "Approvals Activities seven")
    //         {
    //             ApplicationArea = Suite;
    //         }
    //         part("Approvals9"; "Approvals Activities Eight")
    //         {
    //             ApplicationArea = Suite;
    //         }
    //         part("Approvals10"; "Approvals Activities Nine")
    //         {
    //             ApplicationArea = Suite;
    //         }
    //         part("Approvals11"; "Approvals Activities Ten")
    //         {
    //             ApplicationArea = Suite;
    //         }


    //     }
    // }

    // actions
    // {
    //     area(reporting)
    //     {

    //         separator(Action28)
    //         {
    //         }
    //         action("Inventory - &Availability Plan")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Inventory - &Availability Plan';
    //             Image = ItemAvailability;
    //             RunObject = Report "Inventory - Availability Plan";
    //             ToolTip = 'View a list of the quantity of each item in customer, purchase, and transfer orders and the quantity available in inventory. The list is divided into columns that cover six periods with starting and ending dates as well as the periods before and after those periods. The list is useful when you are planning your inventory purchases.';
    //         }


    //     }
    //     area(embedding)
    //     {

    //         action(PurchaseOrders)
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Purchase Orders';
    //             RunObject = Page "Purchase Order List";
    //             ToolTip = 'Create purchase orders to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase orders dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase orders allow partial receipts, unlike with purchase invoices, and enable drop shipment directly from your vendor to your customer. Purchase orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
    //         }


    //         action("Blanket Purchase Orders")
    //         {
    //             ApplicationArea = Suite;
    //             Caption = 'Blanket Purchase Orders';
    //             RunObject = Page "Blanket Purchase Orders";
    //             ToolTip = 'Use blanket purchase orders as a framework for a long-term agreement between you and your vendors to buy large quantities that are to be delivered in several smaller shipments over a certain period of time. Blanket orders often cover only one item with predetermined delivery dates. The main reason for using a blanket order rather than a purchase order is that quantities entered on a blanket order do not affect item availability and thus can be used as a worksheet for monitoring, forecasting, and planning purposes..';
    //         }
    //         action("Purchase Invoices")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Purchase Invoices';
    //             RunObject = Page "Purchase Invoices";
    //             ToolTip = 'Create purchase invoices to mirror sales documents that vendors send to you. This enables you to record the cost of purchases and to track accounts payable. Posting purchase invoices dynamically updates inventory levels so that you can minimize inventory costs and provide better customer service. Purchase invoices can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature.';
    //         }
    //         action("Purchase Return Orders")
    //         {
    //             ApplicationArea = PurchReturnOrder;
    //             Caption = 'Purchase Return Orders';
    //             RunObject = Page "Purchase Return Order List";
    //             ToolTip = 'Create purchase return orders to mirror sales return documents that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. Purchase return orders enable you to ship back items from multiple purchase documents with one purchase return and support warehouse documents for the item handling. Purchase return orders can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
    //         }
    //         action("Purchase Credit Memos")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Purchase Credit Memos';
    //             RunObject = Page "Purchase Credit Memos";
    //             ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
    //         }
    //         action("Vendor Categories")
    //         {
    //             ApplicationArea = all;
    //             RunObject = page "Vendor Categories";
    //         }


    //         action(Vendors)
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Vendors';
    //             Image = Vendor;
    //             RunObject = Page "Vendor List";
    //             ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
    //         }
    //         action(Items)
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Items';
    //             Image = Item;
    //             RunObject = Page "Item List";
    //             ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
    //         }

    //         action("Purchase Analysis Reports")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Purchase Analysis Reports';
    //             RunObject = Page "Analysis Report Purchase";
    //             RunPageView = WHERE("Analysis Area" = FILTER(Purchase));
    //             ToolTip = 'Analyze the dynamics of your purchase volumes. You can also use the report to analyze your vendors'' performance and purchase prices.';
    //         }
    //         action("Inventory Analysis Reports")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Inventory Analysis Reports';
    //             RunObject = Page "Analysis Report Inventory";
    //             RunPageView = WHERE("Analysis Area" = FILTER(Inventory));
    //             ToolTip = 'Analyze the dynamics of your inventory according to key performance indicators that you select, for example inventory turnover. You can also use the report to analyze your inventory costs, in terms of direct and indirect costs, as well as the value and quantities of your different types of inventory.';
    //         }
    //         action("Item Journals")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Item Journals';
    //             RunObject = Page "Item Journal Batches";
    //             RunPageView = WHERE("Template Type" = CONST(Item),
    //                                 Recurring = CONST(false));
    //             ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
    //         }
    //         action("Purchase Journals")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Purchase Journals';
    //             RunObject = Page "General Journal Batches";
    //             RunPageView = WHERE("Template Type" = CONST(Purchases),
    //                                 Recurring = CONST(false));
    //             ToolTip = 'Post any purchase-related transaction directly to a vendor, bank, or general ledger account instead of using dedicated documents. You can post all types of financial purchase transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a purchase journal.';
    //         }

    //     }
    //     area(sections)
    //     {

    //         group("Store Requisition")
    //         {
    //             Caption = 'Store Requisitions';
    //             action("Storess Requisitions ")
    //             {
    //                 ApplicationArea = all;
    //                 Caption = 'New Stores Requisitions';
    //                 RunObject = Page "PROC-Store Requisition2";
    //                 RunPageView = where(status = filter(open));
    //             }

    //             action("Storess Requisitions")
    //             {
    //                 ApplicationArea = all;
    //                 Caption = 'Stores Requisitions Pending Approval';
    //                 RunObject = Page "PROC-Store Requisition2";
    //                 RunPageView = where(status = filter("Pending Approval"));
    //             }
    //             action("Released Stores Requisitions")
    //             {
    //                 ApplicationArea = all;
    //                 Caption = 'Released Stores Requisitions';
    //                 RunObject = Page "PROC-Store Requisition2";
    //                 RunPageView = where(status = filter(Released));
    //             }

    //             action("Posted Store Requisitions")
    //             {
    //                 Caption = 'Posted Store Requisitions';
    //                 ApplicationArea = All;
    //                 Image = PostedOrder;
    //                 RunObject = Page "PROC-Posted Store Req List";


    //             }
    //             action("Stock Report")
    //             {
    //                 ApplicationArea = All;
    //                 Image = PostedOrder;
    //                 RunObject = report "Inventory - Transaction Detail";

    //             }


    //         }


    //         group("Posted Documents")
    //         {
    //             Caption = 'Posted Documents';
    //             Image = FiledPosted;
    //             action("Posted Purchase Receipts")
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Posted Purchase Receipts';
    //                 RunObject = Page "Posted Purchase Receipts";
    //                 ToolTip = 'Open the list of posted purchase receipts.';
    //             }
    //             action("Posted Purchase Invoices")
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Posted Purchase Invoices';
    //                 RunObject = Page "Posted Purchase Invoices";
    //                 ToolTip = 'Open the list of posted purchase invoices.';
    //             }
    //             action("Posted Return Shipments")
    //             {
    //                 ApplicationArea = PurchReturnOrder;
    //                 Caption = 'Posted Return Shipments';
    //                 RunObject = Page "Posted Return Shipments";
    //                 ToolTip = 'Open the list of posted return shipments.';
    //             }
    //             action("Posted Purchase Credit Memos")
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Posted Purchase Credit Memos';
    //                 RunObject = Page "Posted Purchase Credit Memos";
    //                 ToolTip = 'Open the list of posted purchase credit memos.';
    //             }

    //         }
    //         group("Archived Documents")
    //         {
    //             action("Purchase Orders")
    //             {
    //                 ApplicationArea = all;
    //                 RunObject = page "Purchase Order Archives";
    //             }
    //             action("Purchase Quote")
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Purchase Quote Archives';
    //                 RunObject = page "Purchase Quote Archives";
    //             }
    //         }
    //         group(Common_req)
    //         {
    //             Caption = 'Common Requisitions';
    //             Image = LotInfo;
    //             action("Stores Requisitions")
    //             {

    //                 Caption = 'Stores Requisitions';
    //                 RunObject = Page "PROC-Store Requisition";
    //                 ApplicationArea = All;
    //             }
    //             action("Imprest Requisitions")
    //             {

    //                 Caption = 'Imprest Requisitions';
    //                 RunObject = Page "FIN-Imprest List UP";
    //                 ApplicationArea = All;
    //             }
    //             action("My Posted Imprests")
    //             {
    //                 RunObject = page "FIN-Posted imprest list";
    //                 ApplicationArea = all;
    //             }
    //             action("Imprest Accounting")
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Imprest Surrender';
    //                 Image = Journal;
    //                 RunObject = Page "FIN-Imprest Accounting";
    //                 ToolTip = 'Imprest Surrender';
    //             }
    //             action("Memo applications")
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Memo Application';

    //                 RunObject = Page "FIN-Memo Header List All";
    //                 ToolTip = 'Create Memo application from departments.';
    //             }
    //             action(Claims)
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Claims Application';
    //                 Image = Journal;
    //                 RunObject = Page "FIN-Staff Claim List";
    //                 ToolTip = 'Claims List';
    //                 //FIN-Staff Claim List Posted
    //             }
    //             action("Salary Advance")
    //             {
    //                 ApplicationArea = all;

    //                 RunObject = page "FIN-Staff Advance List";
    //             }
    //             action("Training Application")
    //             {
    //                 ApplicationArea = all;
    //                 RunObject = page "HRM-Training Application List";
    //             }
    //             action("Departmental Workplans")
    //             {
    //                 ApplicationArea = all;
    //                 RunObject = page "Annual Workplan List";
    //             }
    //             action("Appraisal List")
    //             {
    //                 ApplicationArea = all;
    //                 RunObject = page "Appraisal List";
    //             }

    //             action("Leave Applications")
    //             {

    //                 Caption = 'Leave Applications';
    //                 RunObject = Page "HRM-Leave Requisition List";
    //                 ApplicationArea = All;
    //             }
    //             action("My Approved Leaves")
    //             {

    //                 Caption = 'My Approved Leaves';
    //                 Image = History;
    //                 RunObject = Page "HRM-My Approved Leaves List";
    //                 ApplicationArea = All;
    //             }


    //             action("Purchase  Requisitions")
    //             {
    //                 ApplicationArea = Suite;
    //                 Caption = 'Purchase Requisitions';
    //                 RunObject = Page "FIN-Purchase Requisition";
    //                 ToolTip = 'Create purchase requisition from departments.';
    //             }


    //             action(Action1000000003)
    //             {
    //                 ApplicationArea = all;
    //                 Caption = 'Leave Applications';
    //                 RunObject = Page "HRM-Leave Requisition List";
    //             }
    //         }
    //     }
    //     area(creation)
    //     {
    //         action("Purchase Requisitions")
    //         {
    //             ApplicationArea = Suite;
    //             Caption = 'Internal Requisitions';
    //             RunObject = Page "All Purchase Requisitions";
    //             // RunPageView = where("Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
    //             ToolTip = 'Create purchase requisition from departments.';
    //         }
    //         action(FRQs)
    //         {
    //             ApplicationArea = all;
    //             Caption = 'RFQs';
    //             RunObject = Page "PROC-Purchase Quote List";
    //             ToolTip = 'Create purchase requisition from departments.';
    //         }



    //         action(PRN)
    //         {
    //             Image = Purchase;
    //             ApplicationArea = Suite;
    //             Caption = 'Approved PRNS';
    //             RunObject = page "Approved Prns";
    //             // RunPageView = where(status = filter(Released), "Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
    //             ToolTip = 'Create purchase Quotes from Vendors.';

    //         }
    //         action("Approved PRN Lines")
    //         {
    //             Caption = 'Approved Prn Lines';
    //             ApplicationArea = all;
    //             RunObject = page "Approved PRN Lines";
    //         }




    //     }
    //     area(processing)
    //     {
    //         separator(Tasks)
    //         {
    //             Caption = 'Tasks';
    //             IsHeader = true;
    //         }
    //         action("&Purchase Journal")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = '&Purchase Journal';
    //             Image = Journals;
    //             RunObject = Page "Purchase Journal";
    //             ToolTip = 'Post purchase transactions directly to the general ledger. The purchase journal may already contain journal lines that are created as a result of related functions.';
    //         }
    //         action("Item &Journal")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Item &Journal';
    //             Image = Journals;
    //             RunObject = Page "Item Journal";
    //             ToolTip = 'Adjust the physical quantity of items on inventory.';
    //         }
    //         action("Order Plan&ning")
    //         {
    //             ApplicationArea = Planning;
    //             Caption = 'Order Plan&ning';
    //             Image = Planning;
    //             RunObject = Page "Order Planning";
    //             ToolTip = 'Plan supply orders order by order to fulfill new demand.';
    //         }
    //         separator(Action38)
    //         {
    //         }
    //         action("Requisition &Worksheet")
    //         {
    //             ApplicationArea = Planning;
    //             Caption = 'Requisition &Worksheet';
    //             Image = Worksheet;
    //             RunObject = Page "Req. Wksh. Names";
    //             RunPageView = WHERE("Template Type" = CONST("Req."),
    //                                 Recurring = CONST(false));
    //             ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
    //         }


    //         separator(History)
    //         {
    //             Caption = 'History';
    //             IsHeader = true;
    //         }
    //         action("Navi&gate")
    //         {
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'Find entries...';
    //             Image = Navigate;
    //             RunObject = Page Navigate;
    //             ShortCutKey = 'Shift+Ctrl+I';
    //             ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
    //         }
    //     }
    // }
}