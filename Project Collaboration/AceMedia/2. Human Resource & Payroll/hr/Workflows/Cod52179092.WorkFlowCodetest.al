// codeunit 52179092 "Work Flow Codetest"
// {
//     trigger OnRun()
//     begin

//     end;

//     var
//         WFMngt: Codeunit "Workflow Management";
//         AppMgmt: Codeunit "Approvals Mgmt.";
//         WorkflowEventHandling: Codeunit "Workflow Event Handling";
//         WorkflowResponseHandling: Codeunit "Workflow Response Handling";



//         // Start LeaveReturnTxtS
//         SendLeaveReturnTxtReq: TextConst ENU = 'Approval Request for Leave Return is requested', ENG = 'Approval Request for Leave Return is requested';
//         AppReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is approved', ENG = 'Approval Request for BackO ffice is approved';
//         RejReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is rejected', ENG = 'Approval Request for Leave Return is rejected';
//         CanReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is cancelled', ENG = 'Approval Request for Leave Return is cancelled';
//         UserCanReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is cancelled by User', ENG = 'Approval Request for Leave Return is cancelled by User';
//         DelReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is delegated', ENG = 'Approval Request for Leave Return is delegated';
//         LeaveReturnTxtPendAppTxt: TextConst ENU = 'Status of Leave Return changed to Pending approval', ENG = 'Status of Leave Return changed to Pending approval';
//         ReleaseLeaveReturnTxtTxt: TextConst ENU = 'Release Leave Return', ENG = 'Release Leave Return';
//         ReOpenLeaveReturnTxtTxt: TextConst ENU = 'ReOpen Leave Return', ENG = 'ReOpen Leave Return';
//     //END LeaveReturnTxtS





//     // Start LeaveReturnTxt Workflow
//     procedure RunWorkflowOnSendLeaveReturnTxtApprovalCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowOnSendLeaveReturnTxtApproval'))
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunitTest", 'OnSendLeaveReturnTxtforApproval', '', false, false)]
//     procedure RunWorkflowOnSendLeaveReturnTxtApproval(var LeaveReturnTxt: record "HRM-Return To Office(Leave)")
//     begin
//         WFMngt.HandleEvent(RunWorkflowOnSendLeaveReturnTxtApprovalCode(), LeaveReturnTxt);
//     end;

//     procedure RunWorkflowOnApproveLeaveReturnTxtApprovalCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowOnApproveLeaveReturnTxtApproval'))
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
//     procedure RunWorkflowOnApproveLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
//     begin
//         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
//     end;

//     procedure RunWorkflowOnRejectLeaveReturnTxtApprovalCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowOnRejectLeaveReturnTxtApproval'))
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
//     procedure RunWorkflowOnRejectLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
//     begin
//         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
//     end;

//     procedure RunWorkflowOnCancelledLeaveReturnTxtApprovalCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowOnRejectLeaveReturnTxtApproval'))
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
//     procedure RunWorkflowOnCancelledLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
//     begin
//         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
//     end;

//     procedure RunWorkflowOnDelegateLeaveReturnTxtApprovalCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowOnDelegateLeaveReturnTxtApproval'))
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
//     procedure RunWorkflowOnDelegateLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
//     begin
//         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
//     end;

//     procedure SetStatusToPendingApprovalCodeLeaveReturnTxt(): Code[128]
//     begin
//         exit(UpperCase('SetStatusToPendingApprovalLeaveReturnTxt'));
//     end;

//     procedure SetStatusToPendingApprovalLeaveReturnTxt(var Variant: Variant)
//     var
//         RecRef: RecordRef;
//         LeaveReturnTxt: Record "HRM-Return To Office(Leave)";
//     begin
//         RecRef.GetTable(Variant);
//         case RecRef.Number() of
//             DATABASE::"HRM-Back To Office Form":
//                 begin
//                     RecRef.SetTable(LeaveReturnTxt);
//                     LeaveReturnTxt.Validate(Status, LeaveReturnTxt.Status::"Pending Approval");
//                     LeaveReturnTxt.Modify();
//                     Variant := LeaveReturnTxt;
//                 end;
//         end;
//     end;

//     procedure ReleaseLeaveReturnTxtCode(): Code[128]
//     begin
//         exit(UpperCase('Release LeaveReturnTxt'));
//     end;

//     procedure ReleaseLeaveReturnTxt(var Variant: Variant)
//     var
//         RecRef: RecordRef;
//         TargetRecRef: RecordRef;
//         ApprovalEntry: Record "Approval Entry";
//         LeaveReturnTxt: Record "HRM-Return To Office(Leave)";
//     begin
//         RecRef.GetTable(Variant);
//         case RecRef.Number() of
//             DATABASE::"Approval Entry":
//                 begin
//                     ApprovalEntry := Variant;
//                     TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
//                     Variant := TargetRecRef;
//                     ReleaseLeaveReturnTxt(Variant);
//                 end;
//             DATABASE::"HRM-Back To Office Form":
//                 begin
//                     RecRef.SetTable(LeaveReturnTxt);
//                     LeaveReturnTxt.Validate(Status, LeaveReturnTxt.Status::Approved);

//                     LeaveReturnTxt.Modify();
//                     Variant := LeaveReturnTxt;
//                 end;
//         end;
//     end;

//     procedure ReOpenLeaveReturnTxtCode(): Code[128]
//     begin
//         exit(UpperCase('ReOpenLeaveReturnTxt'));
//     end;

//     procedure ReOpenLeaveReturnTxt(var Variant: Variant)
//     var
//         RecRef: RecordRef;
//         TargetRecRef: RecordRef;
//         ApprovalEntry: Record "Approval Entry";
//         LeaveReturnTxt: record "HRM-Return To Office(Leave)";
//     begin
//         RecRef.GetTable(Variant);
//         case RecRef.Number() of
//             DATABASE::"Approval Entry":
//                 begin
//                     ApprovalEntry := Variant;
//                     TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
//                     Variant := TargetRecRef;
//                     ReOpenLeaveReturnTxt(Variant);
//                 end;
//             DATABASE::"HRM-Return To Office(Leave)":
//                 begin
//                     RecRef.SetTable(LeaveReturnTxt);
//                     LeaveReturnTxt.Validate(Status, LeaveReturnTxt.Status::Open);
//                     LeaveReturnTxt.Modify();
//                     Variant := LeaveReturnTxt;
//                 end;
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
//     procedure AddLeaveReturnTxtEventToLibrary()
//     begin
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLeaveReturnTxtApprovalCode(), Database::"HRM-Back To Office Form", SendLeaveReturnTxtReq, 0, false);
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveLeaveReturnTxtApprovalCode(), Database::"Approval Entry", AppReqLeaveReturnTxt, 0, false);
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectLeaveReturnTxtApprovalCode(), Database::"Approval Entry", RejReqLeaveReturnTxt, 0, false);
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateLeaveReturnTxtApprovalCode(), Database::"Approval Entry", DelReqLeaveReturnTxt, 0, false);
//         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledLeaveReturnTxtApprovalCode(), Database::"Approval Entry", CanReqLeaveReturnTxt, 0, false);
//         WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelLeaveReturnTxtApprovalCode, Database::"HRM-Back To Office Form", UserCanReqLeaveReturnTxt, 0, false);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
//     procedure AddLeaveReturnTxtRespToLibrary()
//     begin
//         WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeLeaveReturnTxt(), 0, LeaveReturnTxtPendAppTxt, 'GROUP 0');
//         WorkflowResponseHandling.AddResponseToLibrary(ReleaseLeaveReturnTxtCode(), 0, ReleaseLeaveReturnTxtTxt, 'GROUP 0');
//         WorkflowResponseHandling.AddResponseToLibrary(ReOpenLeaveReturnTxtCode(), 0, ReOpenLeaveReturnTxtTxt, 'GROUP 0');
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
//     procedure ExeRespForLeaveReturnTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
//     var
//         WorkflowResponse: Record "Workflow Response";
//     begin
//         IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
//             case WorkflowResponse."Function Name" of
//                 SetStatusToPendingApprovalCodeLeaveReturnTxt():
//                     begin
//                         SetStatusToPendingApprovalLeaveReturnTxt(Variant);
//                         ResponseExecuted := true;
//                     end;
//                 ReleaseLeaveReturnTxtCode():
//                     begin
//                         ReleaseLeaveReturnTxt(Variant);
//                         ResponseExecuted := true;
//                     end;
//                 ReOpenLeaveReturnTxtCode():
//                     begin
//                         ReOpenLeaveReturnTxt(Variant);
//                         ResponseExecuted := true;
//                     end;
//             end;
//     end;

//     //Cancelling of LeaveReturnTxt Code
//     procedure RunWorkflowOnCancelLeaveReturnTxtApprovalCode(): Code[128]
//     begin
//         exit(UpperCase('RunWorkflowOnCancelLeaveReturnTxtApproval'))
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunitTest", 'OnCancelSendLeaveReturnTxtForApproval', '', false, false)]
//     procedure RunWorkflowOnCancelLeaveReturnTxtApproval(VAR LeaveReturnTxt: record "HRM-Return To Office(Leave)")
//     begin

//         WFMngt.HandleEvent(RunWorkflowOnCancelLeaveReturnTxtApprovalCode(), LeaveReturnTxt);

//     end;
//     //End Cancelling LeaveReturnTxt Code

// }
