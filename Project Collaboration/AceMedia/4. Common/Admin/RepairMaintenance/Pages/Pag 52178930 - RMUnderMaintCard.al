// page 52178930 "RM-Under Maint Card"
// {
//     Caption = 'Under Maintenance';
//     PageType = Card;
//     SourceTable = RepairMaintenance;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field(No; Rec.No)
//                 {
//                     ToolTip = 'Specifies the value of the No field.';
//                     ApplicationArea = All;
//                 }
//                 field("Date Created"; Rec."Date Created")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Date Created field.';
//                 }
//                 field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
//                 }
//                 field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Description field.';
//                 }



//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Status field.';
//                 }
//                 field("Created By"; Rec."Created By")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Created By field.';
//                 }
//                 field(Remarks; Rec.Remarks)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Remarks field.';
//                 }


//             }
//             group("Request Description")
//             {
//                 field("Request Description "; Rec."Request Description")
//                 {
//                     ShowCaption = false;
//                     MultiLine = true;
//                     ShowMandatory = true;
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Request Description field.';
//                 }

//             }

//         }
//     }
//     actions
//     {
//         area(Processing)
//         {
//             action(Completed)
//             {
//                 ApplicationArea = All;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 Image = Approve;
//                 Caption = 'Work Completed';

//                 trigger OnAction()
//                 begin
//                     //if "Repair Status" <> Rec."Repair Status"::
//                     Rec.SetRange(No, Rec.No);
//                     rec.SetRange(Status, rec.Status::Approved);
//                     if Rec.Find('-') then
//                         if rec.Remarks <> '' then begin
//                             Rec."Repair Status" := Rec."Repair Status"::"Maintenance Completed";
//                             Message('Work completed successfully');
//                         end else
//                             Error('Please give remarks before marking as complete');
//                 end;
//             }
//         }
//     }
//     trigger OnInit()
//     begin
//         PurchLinesEditable := FALSE;
//     end;

//     var
//         PurchLinesEditable: Boolean;
// }
