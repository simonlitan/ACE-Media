// page 52178908 "Gym Role Center"
// {
//     Caption = 'Gym Role Center';
//     PageType = RoleCenter;

//     layout
//     {
//         area(rolecenter)
//         {
//             part(Page; "Approvals Activities")
//             {
//                 ApplicationArea = All;
//             }
//             systempart(Notes; MyNotes)
//             {
//                 ApplicationArea = All;
//             }
//         }
//     }

//     actions
//     {



//         area(reporting)
//         {

//         }




//         area(sections)
//         {

//             group(Common_req)
//             {
//                 Caption = 'Common Requisitions';
//                 Image = Payables;
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
//                 action("My Posted Imprests")
//                 {
//                     RunObject = page "FIN-Posted imprest list";
//                     ApplicationArea = all;
//                 }
//                 action("Imprest Accounting")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Imprest Accounting';
//                     Image = Journal;
//                     RunObject = Page "FIN-Imprest Accounting";
//                     ToolTip = 'Imprest Accounting';
//                 }

//                 action("Purchase  Requisitions")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Purchase Requisitions';
//                     RunObject = Page "FIN-Purchase Requisition";
//                     ToolTip = 'Create purchase requisition from departments.';
//                 }
//                 action("Leave Applications")
//                 {

//                     Caption = 'Leave Applications';
//                     RunObject = Page "HRM-Leave Requisition List";
//                     ApplicationArea = All;
//                 }
//                 action("Training Application")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "HRM-Training Application List";
//                 }
//                 action(Appraisal)
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Employee Perf AppraisalsL";
//                 }
//                 action("My Approved Leaves")
//                 {

//                     Caption = 'My Approved Leaves';

//                     RunObject = Page "HRM-My Approved Leaves List";
//                     ApplicationArea = All;
//                 }
//                 action("Pending Offs and Double Shifts")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Pending Offs & Double Shifts";
//                 }
//                 action("Casual Requisition")
//                 {
//                     ApplicationArea = All;
//                     RunObject = page "Casual Requisition List";
//                 }

//             }

//             group(Gym)
//             {
//                 Caption = 'Gym Membership Management';

//                 action("Gym Membership")
//                 {
//                     ApplicationArea = All;
//                     //RunObject = page "Gym Member List";
//                 }
//             }

//         }
//     }
// }
// // profile PC
// // {
// //     ProfileDescription = 'P Cprofile';
// //     RoleCenter = "PC Role Center";
// //     Caption = 'PC Office';
// // }
