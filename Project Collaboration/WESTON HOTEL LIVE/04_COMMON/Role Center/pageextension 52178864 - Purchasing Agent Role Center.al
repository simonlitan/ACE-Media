// pageextension 52178864 "Purchasing Agent Role Center" extends "Purchasing Agent Role Center"
// {
//     layout
//     {

//         addfirst(rolecenter)
//         {
//             group(approval)
//             {
//                 part(approvals; "Approvals Activities")
//                 {
//                     ApplicationArea = all;

//                 }
//             }
//         }
//     }
//     actions
//     {

//         addbefore("Purchase &Quote")
//         {
//             action("Procurement Plan")
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Procurement Plan';
//                 RunObject = Page "PROC-Procurement Plan List";
//                 ToolTip = 'Create purchase requisition from departments.';
//             }
//         }
//         addbefore("Purchase &Quote")
//         {
//             action("Purchase Requisitions")
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Internal Requisitions';
//                 RunObject = Page "All Purchase Requisitions";
//                 // RunPageView = where("Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
//                 ToolTip = 'Create purchase requisition from departments.';
//             }
//         }
//         addafter("Purchase Requisitions")
//         {
//             action(FRQs)
//             {
//                 Image = Purchase;
//                 ApplicationArea = Suite;
//                 Caption = 'RFQs';
//                 RunObject = Page "PROC-Purchase Quote List";
//                 ToolTip = 'Create purchase requisition from departments.';
//             }
//             action(Quotes)
//             {
//                 Image = Purchase;
//                 ApplicationArea = Suite;
//                 Caption = 'Quotes';
//                 RunObject = Page "Proc-Purchase Quotes List";
//                 ToolTip = 'Create purchase Quotes from Vendors.';

//             }
//             action(PRN)
//             {
//                 Image = Purchase;
//                 ApplicationArea = Suite;
//                 Caption = 'Approved PRNS';
//                 RunObject = page "Approved Prns";
//                 // RunPageView = where(status = filter(Released), "Document Type" = FILTER(Quote), DocApprovalType = FILTER(Requisition));
//                 ToolTip = 'Create purchase Quotes from Vendors.';

//             }
//             action("Approved PRN Lines")
//             {
//                 ApplicationArea = all;
//                 RunObject = page "Approved PRN Lines";
//             }

//         }
//         modify("Purchase &Order")
//         {
//             Visible = false;
//         }
//         modify("Purchase &Quote")
//         {
//             Visible = false;
//         }
//         addafter("Purchase &Invoice")
//         {
//             action("Procurement &Order")
//             {
//                 ApplicationArea = Suite;
//                 Caption = 'Procurement &Order';
//                 Image = Document;

//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = Process;
//                 RunObject = Page "Purchase Order List";

//                 ToolTip = 'Create a new purchase order.';
//             }

//         }
//         addbefore("Posted Documents")
//         {
//             group("Store Requisition")
//             {
//                 Caption = 'Store Requisitions';
//                 action("Storess Requisitions")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Stores Requisitions';
//                     RunObject = Page "PROC-Store Requisition2";
//                     RunPageView = where(status = filter(<> Released));
//                 }
//                 action("Released Stores Requisitions")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Released Stores Requisitions';
//                     RunObject = Page "PROC-Store Requisition2";
//                     RunPageView = where(status = filter(Released));
//                 }

//                 action("Posted Store Requisitions")
//                 {
//                     Caption = 'Posted Store Requisitions';
//                     ApplicationArea = All;
//                     Image = PostedOrder;
//                     RunObject = Page "PROC-Posted Store Req List";

//                 }
//                 action("Stock Report")
//                 {
//                     ApplicationArea = all;
//                     RunObject = report "Stock Report";
//                 }



//             }

//         }
//         addafter("Posted Documents")
//         {
//             group(Common_req)
//             {
//                 Caption = 'Common Requisitions';
//                 Image = LotInfo;
//                 action("Stores Requisitions")
//                 {

//                     Caption = 'Stores Requisitions';
//                     RunObject = Page "PROC-Store Requisition";
//                     ApplicationArea = All;
//                 }
//                 action("Imprest Requisitions")
//                 {

//                     Caption = 'Imprest Requisitions';
//                     RunObject = Page "FIN-Imprest List UP";
//                     ApplicationArea = All;
//                 }
//                 action("Memo applications")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Memo Application';

//                     RunObject = Page "FIN-Memo Header List All";
//                     ToolTip = 'Create Memo application from departments.';
//                 }
//                 action("Leave Applications")
//                 {

//                     Caption = 'Leave Applications';
//                     RunObject = Page "HRM-Leave Requisition List";
//                     ApplicationArea = All;
//                 }
//                 action("My Approved Leaves")
//                 {

//                     Caption = 'My Approved Leaves';
//                     Image = History;
//                     RunObject = Page "HRM-My Approved Leaves List";
//                     ApplicationArea = All;
//                 }


//                 action("Purchase  Requisitions")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Purchase Requisitions';
//                     RunObject = Page "FIN-Purchase Requisition";
//                     ToolTip = 'Create purchase requisition from departments.';
//                 }


//                 action(Action1000000003)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Leave Applications';
//                     RunObject = Page "HRM-Leave Requisition List";
//                 }


//             }
//         }

//     }


// }
