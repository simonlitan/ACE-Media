// page 52178906 "CEO Appointment Card"
// {
//     PageType = Card;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//   //  SourceTable = "CEO-Appointments";
//     PromotedActionCategories = 'New,Process,Report,Attachment, Notifications,Create Task';

//     layout
//     {
//         area(Content)
//         {
//             group("Appointment Card")
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
//                     trigger OnValidate()
//                     begin

//                     end;
//                 }
//                 field("End Date"; Rec."End Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Reason; Rec.Reason)
//                 {
//                     MultiLine = true;
//                     ApplicationArea = All;
//                 }
//                 field(Department; Rec.Department)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Department Name"; Rec."Department Name")
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;

//                 }
//             }
//             group("Link with Task")
//             {
//                 Visible = false;
//                 field("Task Type"; Rec."Task Type")
//                 {
//                     ApplicationArea = All;

//                 }
//                 field(Task; Rec.Task)
//                 {
//                     ApplicationArea = All;

//                 }
//                 field("Task Name"; Rec."Task Name")
//                 {
//                     Editable = false;
//                     ApplicationArea = All;
//                 }
//             }
//             part("Appointment Parties"; "Appointment Parties")
//             {
//                 ApplicationArea = All;
//                 SubPageLink = "Appointment ID" = field("Appointment ID");
//                 Editable = CanReasignParties;
//             }
//         }

//     }

//     actions
//     {
//         area(Navigation)
//         {
//             action("Upload Attachements")
//             {
//                 ApplicationArea = All;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 Image = Attachments;
//                 RunObject = page "Document Attachment Details";
//                 RunPageLink = "No." = field("Appointment ID");
//             }
//             action("Accept Apppointment")
//             {
//                 ApplicationArea = All;
//                 Image = Approve;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 trigger OnAction()
//                 begin
//                     Rec.Reset();
//                     Rec.Status := Rec.Status::Accepted;
//                     Message('You have Successfully accept %1 Appointment', Rec."Appointment Description");
//                     Rec.Modify();
//                 end;
//             }
//             action("Reject Apppointment")
//             {
//                 ApplicationArea = All;
//                 Image = Reject;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 trigger OnAction()
//                 begin
//                     Rec.Reset();
//                     Rec.Status := Rec.Status::Rejected;
//                     Message('You have Successfully Rejected %1 Appointment', Rec."Appointment Description");
//                     Rec.Modify();
//                 end;
//             }
//             action("Re-Open Apppointment")
//             {
//                 ApplicationArea = All;
//                 Image = ReOpen;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 trigger OnAction()
//                 begin
//                     Rec.Reset();
//                     Rec.Status := Rec.Status::Open;
//                     Message('You have Successfully re-open %1 Appointment', Rec."Appointment Description");
//                     Rec.Modify();
//                 end;
//             }

//             group(Process)
//             {
//                 action("Notify Appointment Parties")
//                 {
//                     ApplicationArea = Suite;
//                     Image = SendMail;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     ToolTip = 'Send Notification To the CEO Appointment Members';
//                     trigger OnAction()
//                     var

//                     begin
//                         AppointmentParty.Reset();
//                         AppointmentParty.SetRange("Appointment ID", Rec."Appointment ID");
//                         if AppointmentParty.FindSet(true, true) then begin
//                             repeat
//                                 Recipients.Add(AppointmentParty."E-mail");
//                             until AppointmentParty.Next() = 0
//                         end;
//                         Body := StrSubstNo(CEOTaskMessage, Rec."Appointment Description", Rec.Status, CEOSetup."Appointments Link");
//                         EmailMessage.Create(Recipients, CEOTasksSubject, Body, true);
//                         Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//                         Message('The notification has been sent successfully');
//                     end;
//                 }
//             }
//         }
//         area(Creation)
//         {
//             action("Create Tasks")
//             {
//                 ApplicationArea = All;
//                 Image = New;
//                 Promoted = true;
//                 PromotedCategory = Category6;

//                 trigger OnAction()
//                 var
//                     Tasks: Record "Task Group Setup";
//                     TaskMembers: Record "Task Team Member";
//                     Text000: Label '%1 created successfully.';
//                     Text001: Label 'Task No: %1 already exists.';
//                 begin
//                     Tasks.Init();
//                     Tasks."Task Name" := Rec."Appointment Description";
//                     Tasks."Task Details" := Rec."Appointment Description";
//                     Tasks."Date Created" := Rec."Date Created";
//                     Tasks."Start Date" := Rec."Start Date";
//                     Tasks."Due Date" := Rec."End Date";
//                     Tasks.Priority := Tasks.Priority::Medium;
//                     Tasks.Department := Rec.Department;
//                     Tasks."Department Name" := Rec."Department Name";
//                     Tasks.Insert(true);
//                     Tasks.Validate(Department);
//                     AppointmentParty.Reset();
//                     AppointmentParty.SetRange("Appointment ID", Rec."Appointment ID");
//                     if AppointmentParty.FindSet() then
//                         repeat
//                             TaskMembers.Init();
//                             TaskMembers.TransferFields(AppointmentParty);
//                             TaskMembers."Team Code" := AppointmentParty."Party ID";
//                             TaskMembers."Team Code" := Tasks."Task Group ID";
//                             TaskMembers."PF Number" := AppointmentParty."Party ID";
//                             TaskMembers."Full Name" := AppointmentParty."Party Name";
//                             TaskMembers."E-mail" := AppointmentParty."E-Mail";
//                             TaskMembers.Insert();
//                         // TaskMembers.Validate("PF Number");
//                         until AppointmentParty.Next() = 0;
//                     Message(Text000, Tasks."Task Name");
//                     Page.Run(Page::"CEO-Appointments List");
//                 end;
//             }
//         }
//     }
//     var
//         EmailMessage: Codeunit "Email Message";
//         AppointmentParty: Record "Appointment Party";
//         Email: Codeunit Email;
//         Recipients: List of [Text];
//         Body: Text;
//         CEOSetup: Record "CEO Setup";
//         CanReasignParties: Boolean;
//         CEOTasksSubject: Label 'CEO APPOINTMENT';
//         CEOTaskMessage: Label 'Dear Appointment Party Member <br> <br> This is to notify you that the %1 appointment has been %2. <br><br> Kindly click the %3 link to take action';

//     trigger OnModifyRecord(): Boolean
//     begin
//         CheckRecStatus();
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         CheckRecStatus();
//     end;

//     // trigger OnFindRecord(Rec: Text): Boolean
//     // begin
//     //     CheckRecStatus();
//     // end;

//     trigger OnInit()
//     begin
//         CheckRecStatus();
//     end;

//     trigger OnOpenPage()
//     begin
//         CheckRecStatus();
//     end;

//     procedure CheckRecStatus()
//     begin
//         Rec.Reset();
//         if (Rec.Status = (Rec.Status::ReAssigned)) or (Rec.Status = (Rec.Status::Open)) then
//             CanReasignParties := true
//         else
//             CanReasignParties := false;
//     end;
// }