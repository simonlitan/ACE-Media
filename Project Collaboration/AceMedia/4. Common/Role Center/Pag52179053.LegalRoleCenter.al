// page 52179053 "Legal Role Center"
// {
//     Caption = 'Legal Role Center';
//     PageType = RoleCenter;


//     layout
//     {
//         area(RoleCenter)
//         {
//             part(ApprovalsActivities; "Approvals Activities")
//             {
//                 ApplicationArea = Suite;
//             }


//         }
//     }
//     actions
//     {
//          area(Processing)
//         {
//             group(Setups)
//             {
//                 action("Number Setups")
//                 {
//                     ApplicationArea = all;
//                     Image = NumberSetup;
//                     RunObject = page "Case No Series";
//                 }
//                 action("Crime Categories")
//                 {
//                     ApplicationArea = all;
//                     Image = Category;
//                     RunObject = page "Case Crime Categories";
//                 }
//                 action("Members")
//                 {
//                     ApplicationArea = all;
//                     Image = Employee;
//                     RunObject = page "Setup Case List";
//                 }
//                 action("Analysts")
//                 {
//                     ApplicationArea = all;
//                     Image = EmployeeAgreement;
//                     RunObject = page Analysts;
//                 }
//                 action("Reporting Agencies")
//                 {
//                     ApplicationArea = all;
//                     Image = SourceDocLine;
//                     RunObject = page "Reporting Agency";
//                 }

//             }
//             group("Reports")
//             {
                
//                 action("Reported Assets Report")
//                 {
//                     ApplicationArea = all;
//                     image = Report;
//                     RunObject = report "Reported Assets";
//                 }
              
//                 action("ADR Report")
//                 {
//                     ApplicationArea = all;
//                     image = Report;
//                     RunObject = report "Alternative Disputes";
//                 }
//                 action("International Obligations Report")
//                 {
//                     ApplicationArea = all;
//                     image = Report;
//                     RunObject = report "Internal Obligations";
//                 }
//                 action("Court Attendance Reports")
//                 {
//                     ApplicationArea = all;
//                     image = Report;
//                     RunObject = report "Court Attendance";
//                 }
//             }
//         }
//         area(Sections)
//         {
//             group(Legal)
//             {
//                 action("Proceeds of Crime")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Case Legal List";
//                 }
//                 action("Suits Against The Agency")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Internal Case Legal List";
//                 }
//                 action("Mutual Legal Assistance")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "MLA Case Legal List";
//                 }

//             }
//             group(Appeals)
//             {
//                 action("Appeals List")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Appeals List";

//                 }
//             }
//             group("International Obligations")
//             {
//                 action("Obligations List")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "International Obligations List";
//                 }
//             }
//             group("Alternative Dispute Resolution")
//             {
//                 action("Dispute List")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Alternative DisputeList";
//                 }

//             }

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
//                 action("Memo applications")
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Memo Application';

//                     RunObject = Page "FIN-Memo Header List All";
//                     ToolTip = 'Create Memo application from departments.';
//                 }
//                 action("Leave Reliever")
//                 {

//                     Caption = 'Leave Reliever Requests';
//                     RunObject = Page "HRM-Leave Reliever";
//                     ApplicationArea = All;
//                 }
//                 action("Leave Planner")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "Individual Leave Planner List";
//                 }
//                 action("Leave Applications")
//                 {

//                     Caption = 'Leave Applications';
//                     RunObject = Page "HRM-Leave Requisition List";
//                     ApplicationArea = All;
//                 }
//                 action("Individual Training Projections")
//                 {
//                     ApplicationArea = all;

//                     RunObject = Page "Individual Projection List";
//                 }
//                 action("Training Application")
//                 {
//                     ApplicationArea = all;
//                     RunObject = page "HRM-Training Application List";
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


//             }
//         }
//     }
// }
