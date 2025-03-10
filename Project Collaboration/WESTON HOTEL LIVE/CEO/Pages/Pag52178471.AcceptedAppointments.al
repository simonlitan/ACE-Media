// page 52178471 "Accepted Appointments"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "CEO-Appointments";
//     CardPageId = "CEO-Appointment Card";
//     PromotedActionCategories = 'New,Process,Reports,Appointment Actions';
//     SourceTableView = where(Status = const(Accepted));
//     InsertAllowed = true;
//     ModifyAllowed = true;
//     layout
//     {
//         area(Content)
//         {
//             repeater(Appointments)
//             {
//                 field("Appointment ID"; Rec."Appointment ID")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Appointment Description"; Rec."Appointment Description")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Start Date"; Rec."Start Date")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("End Date"; Rec."End Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Department; Rec.Department)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Department Name"; Rec."Department Name")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Reason; Rec.Reason)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;

//                 }
//             }
//         }

//     }

//     actions
//     {
//         area(Reporting)
//         {
//             action("Appointment Report")
//             {
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 ApplicationArea = All;
//                 PromotedCategory = Report;
//                 RunObject = report "CEO Appointments";
//             }
//         }
//     }


//     var
//         myInt: Integer;
// }