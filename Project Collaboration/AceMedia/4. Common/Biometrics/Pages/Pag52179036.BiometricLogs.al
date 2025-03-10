// page 52179036 "Biometric Logs"
// {
//     DeleteAllowed = false;
//     //InsertAllowed = false;
//     //ModifyAllowed = false;
//     PageType = List;
//     SourceTable = "FacePrint Biometric";

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {

//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the No. field.';
//                 }

//                 field("Date"; Rec."Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Date field.';
//                 }
//                 field("Staff Number"; Rec."Staff Number")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Staff Number field.';
//                 }
//                 field("Full Name"; Rec."Full Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Full Name field.';
//                 }

//                 field("Terminal Serial No."; Rec."Terminal Serial No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Terminal Serial No. field.';
//                 }
//                 field("Time"; Rec."Time")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Time field.';
//                 }
//                 field("Punch State"; Rec."Punch State")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Punch State field.';
//                 }
//                 field(Temperature; Rec.Temperature)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Temperature field.';
//                 }

//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action("FacePrint Biometric")
//             {
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = report;
//                 RunObject = Report "FacePrint Biometric";
//             }
//             action("Biometric Analysis Per Period")
//             {
//                 Caption = 'Analysis Per Period';
//                 Image = AdjustItemCost;
//                 Promoted = true;
//                 PromotedCategory = report;
//                 RunObject = Report "Biometric Analysis Per Period";
//             }
//         }
//     }
// }

