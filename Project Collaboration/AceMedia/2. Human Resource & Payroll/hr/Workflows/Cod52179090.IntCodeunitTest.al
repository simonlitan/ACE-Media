// codeunit 52179090 "IntCodeunitTest"
// {
//     trigger OnRun()
//     begin

//     end;


//     // "HRM-Return To Office(Leave)"
//     [IntegrationEvent(false, false)]
//     PROCEDURE OnSendLeaveReturnTxtforApproval(VAR LeaveReturnTxt: Record  "HRM-Return To Office(Leave)");
//     begin
//     end;

//     procedure IsLeaveReturnTxtEnabled(var LeaveReturnTxt: Record  "HRM-Return To Office(Leave)"): Boolean
//     var
//         WFMngt: Codeunit "Workflow Management";
//         WFCode: Codeunit "Work Flow Codetest";

//     begin
//         exit(WFMngt.CanExecuteWorkflow(LeaveReturnTxt, WFCode.RunWorkflowOnSendLeaveReturnTxtApprovalCode()))
//     end;

//     local procedure CheckLeaveReturnWorkflowEnabled(): Boolean
//     var
//         LeaveReturnTxt: Record  "HRM-Return To Office(Leave)";
//         NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

//     begin
//         if not IsLeaveReturnTxtEnabled(LeaveReturnTxt) then
//             Error(NoWorkflowEnb);
//     end;
//     //end  "HRM-Return To Office(Leave)"

//     //*************************Cancelling Approvals*********************//////

//     //Cancel  "HRM-Return To Office(Leave)"
//     [IntegrationEvent(false, false)]
//     PROCEDURE OnCancelSendLeaveReturnTxtforApproval(VAR LeaveReturnTxt: Record  "HRM-Return To Office(Leave)");
//     begin
//     end;
//     //End Cancel  "HRM-Return To Office(Leave)"





//     procedure HasOpenOrPendingApprovalEntries(RecordID: RecordID): Boolean
//     var
//         ApprovalEntry: Record "Approval Entry";
//     begin
//         ApprovalEntry.SetRange("Table ID", RecordID.TableNo);
//         ApprovalEntry.SetRange("Record ID to Approve", RecordID);
//         ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
//         ApprovalEntry.SetRange("Related to Change", false);
//         exit(not ApprovalEntry.IsEmpty);
//     end;


//     ///////////////////////**************************POPULATE APPROVAL ENTRY AGRUMENT*****************////////////////////
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
//     local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
//     WorkflowStepInstance: Record "Workflow Step Instance")
//     var

//         LeaveReturn: Record  "HRM-Return To Office(Leave)";
//     begin
//         case
//             RecRef.Number of
//             Database:: "HRM-Return To Office(Leave)":
//                 begin

//                     RecRef.SetTable(LeaveReturn);
//                     ApprovalEntryArgument."Document No." := LeaveReturn."No.";

//                 end;
//         end;
//     end;



//     var
//         myInt: Integer;
//         DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
//           Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
//         PendingApprovalMsg: Label 'An approval request has been SendLeaveReturnt.';
// }
