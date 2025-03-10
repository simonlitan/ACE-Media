// page 52178944 "Legal Role Center"
// {
//     Caption = 'Legal Role Center';
//     PageType = RoleCenter;

//     layout
//     {
//         area(rolecenter)
//         {
//             part("User Tasks Activities"; "User Tasks Activities")
//             {
//                 ApplicationArea = Suite;
//             }
//             part(ApprovalsActivities; "Approvals Activities")
//             {
//                 ApplicationArea = Suite;
//             }

//             part("Approvals1"; "Approvals Activities Initial")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals2"; "Approvals Activities One")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals3"; "Approvals Activities Two")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals4"; "Approvals Activities Three")
//             {
//                 ApplicationArea = Suite;

//             }
//             part("Approvals5"; "Approvals Activities Four")
//             {
//                 ApplicationArea = Suite;

//             }
//             part("Approvals6"; "Approvals Activities Five")
//             {
//                 ApplicationArea = Suite;

//             }
//             part("Approvals7"; "Approvals Activities six")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals8"; "Approvals Activities seven")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals9"; "Approvals Activities Eight")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals10"; "Approvals Activities Nine")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals11"; "Approvals Activities Ten")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals12"; "Approvals Activities Eleven")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals13"; "Approvals Activities Twelve")
//             {
//                 ApplicationArea = Suite;
//             }
//             part("Approvals14"; "Approvals Activities Thirteen")
//             {
//                 ApplicationArea = Suite;
//             }
//             part(Control102; "Headline RC Project Manager")
//             {
//                 ApplicationArea = Jobs;
//             }

//         }
//     }

//     actions
//     {
//         area(Sections)
//         {
//             group("Legal Claims")
//             {
//                 Caption = 'Legal Claims';
//                 action("Pending Claims")
//                 {
//                     Caption = 'Pending  Claims';
//                     Image = List;
//                     RunObject = Page "Legal-Claims List";
//                     ApplicationArea = All;
//                 }
//                 action("Renegotiated Claims")
//                 {
//                     Caption = 'Renegotiated Claims';
//                     Image = List;
//                     RunObject = Page "Legal-Claims List";
//                     ApplicationArea = All;
//                 }
//                 action("Setlled Claims")
//                 {
//                     Caption = 'Setlled Claims';
//                     Image = List;
//                     RunObject = Page "Legal-Claims List";
//                     ApplicationArea = All;
//                 }

//             }
//             group("Court Cases")
//             {
//                 Caption = 'Court Cases';
//                 action("Court Cases List")
//                 {
//                     Caption = 'Court Cases List';
//                     Image = List;
//                     RunObject = Page "Legal-Cases List";
//                     ApplicationArea = All;
//                 }
//                 action("Court CasesOngoing")
//                 {
//                     Caption = 'Ongoing Court Cases';
//                     Image = Process;
//                     RunObject = Page "Legal-Cases Ongoing";
//                     ApplicationArea = All;
//                 }
//                 action("Court CasesClosed")
//                 {
//                     Caption = 'Closed Court Cases';
//                     Image = Process;
//                     RunObject = Page "Legal-Cases Closed";
//                     ApplicationArea = All;
//                 }
//             }
//             group("Contracts")
//             {
//                 Caption = 'Contracts';
//                 action("Contract List")
//                 {
//                     Caption = 'Contract List';
//                     Image = List;
//                     RunObject = Page "Legal-Contract List";
//                     ApplicationArea = All;
//                 }
//                 action("Past Due Date")
//                 {
//                     Caption = 'Past Due Date';
//                     Image = Calendar;
//                     RunObject = Page "Legal-PastDueDate Contracts";
//                     ApplicationArea = All;
//                 }
//                 action("Terminated")
//                 {
//                     Caption = 'Terminated Contracts';
//                     Image = StopPayment;
//                     RunObject = Page "Legal-Terminated Contracts";
//                     ApplicationArea = All;
//                 }
//             }
//             group("MoU Management")
//             {
//                 Caption = 'MoU Management';
//                 action("MoU List")
//                 {
//                     Caption = 'MoU List';
//                     Image = List;
//                     RunObject = Page "Legal-MoU ListPage";
//                     ApplicationArea = All;
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
//                 /*  action(Appraisal)
//                  {
//                      ApplicationArea = all;
//                      RunObject = page "Employee Perf AppraisalsL";
//                  } */
//                 action("My Approved Leaves")
//                 {

//                     Caption = 'My Approved Leaves';
//                     Image = History;
//                     RunObject = Page "HRM-My Approved Leaves List";
//                     ApplicationArea = All;
//                 }

//             }
//         }
//         area(Reporting)
//         {
//             group("Court Cases Reports")
//             {
//                 action("Legal-CaseList Report")
//                 {
//                     Caption = 'Legal Case List';
//                     Image = Report;
//                     RunObject = report "Legal-CaseList Report";
//                     ApplicationArea = All;
//                     //setfilter("No.","No.", true,true);
//                 }
//             }
//             group("Contract Reports")
//             {
//                 action("Contract Report")
//                 {
//                     Caption = 'Contract Report';
//                     Image = ContractPayment;
//                     RunObject = report "Legal-Contract Report";
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }

//     var
//         myInt: Integer;
// }
// profile LEGAL
// {
//     ProfileDescription = 'LEGAL profile';
//     RoleCenter = "Legal Role Center";
//     Caption = 'LEGAL';
// }