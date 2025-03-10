// page 52178907 "Appointment Parties"
// {
//     Caption = 'Appointment Parties';
//     PageType = ListPart;
//     SourceTable = "Appointment Party";

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Party ID"; Rec."Party ID")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Party ID field.';
//                     trigger OnValidate()
//                     var
//                         AParty: Record "HRM-Employee C";
//                     begin
//                         AParty.Reset;
//                         if AParty.Get(Rec."Party ID") then begin
//                             Rec."Party Name" := AParty."First Name" + ' ' + AParty."Middle Name" + ' ' + AParty."Last Name";
//                             Rec."E-Mail" := AParty."E-Mail";
//                             Rec."Phone No." := AParty."Home Phone Number";
//                         end;
//                     end;
//                 }
//                 field("Party Name"; Rec."Party Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Party Name field.';
//                     Editable = false;
//                 }
//                 field("E-Mail"; Rec."E-Mail")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the E-Mail field.';
//                 }
//                 field("Phone No."; Rec."Phone No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Phone No. field.';
//                 }
//             }
//         }
//     }
// }