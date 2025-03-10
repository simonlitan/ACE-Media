codeunit 52179083 "Work Flow Code"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";



    //         //PrlPendAppTxtS
    //         // SendPrlPendAppTxtReq: TextConst ENU = 'Approval Request for PrlPendAppTxt is requested', ENG = 'Approval Request for PrlPendAppTxt is requested';
    //         // AppReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is approved', ENG = 'Approval Request for PrlPendAppTxt is approved';
    //         // RejReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is rejected', ENG = 'Approval Request for PrlPendAppTxt is rejected';
    //         // CanReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is cancelled', ENG = 'Approval Request for PrlPendAppTxt is cancelled';
    //         // UserCanReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is cancelled by User', ENG = 'Approval Request for PrlPendAppTxt is cancelled by User';
    //         // DelReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is delegated', ENG = 'Approval Request for PrlPendAppTxt is delegated';
    //         // PrlPendAppTxtPendAppTxt: TextConst ENU = 'Status of PrlPendAppTxt changed to Pending approval', ENG = 'Status of PrlPendAppTxt changed to Pending approval';
    //         // ReleasePrlPendAppTxtTxt: TextConst ENU = 'Release PrlPendAppTxt', ENG = 'Release PrlPendAppTxt';
    //         // ReOpenPrlPendAppTxtTxt: TextConst ENU = 'ReOpen PrlPendAppTxt', ENG = 'ReOpen PrlPendAppTxt';
    //         //END PrlPendAppTxtS

    //         //BackOfficeTxtS
    //         SendBackOfficeTxtReq: TextConst ENU = 'Approval Request for Back Office is requested', ENG = 'Approval Request for Back Office is requested';
    //         AppReqBackOfficeTxt: TextConst ENU = 'Approval Request for Back Office is approved', ENG = 'Approval Request for BackO ffice is approved';
    //         RejReqBackOfficeTxt: TextConst ENU = 'Approval Request for Back Office is rejected', ENG = 'Approval Request for Back Office is rejected';
    //         CanReqBackOfficeTxt: TextConst ENU = 'Approval Request for Back Office is cancelled', ENG = 'Approval Request for Back Office is cancelled';
    //         UserCanReqBackOfficeTxt: TextConst ENU = 'Approval Request for Back Office is cancelled by User', ENG = 'Approval Request for Back Office is cancelled by User';
    //         DelReqBackOfficeTxt: TextConst ENU = 'Approval Request for Back Office is delegated', ENG = 'Approval Request for Back Office is delegated';
    //         BackOfficeTxtPendAppTxt: TextConst ENU = 'Status of Back Office changed to Pending approval', ENG = 'Status of Back Office changed to Pending approval';
    //         ReleaseBackOfficeTxtTxt: TextConst ENU = 'Release Back Office', ENG = 'Release Back Office';
    //         ReOpenBackOfficeTxtTxt: TextConst ENU = 'ReOpen Back Office', ENG = 'ReOpen Back Office';
    //     //END BackOfficeTxtS



    //     //Start PrlPendAppTxt Workflow
    //     procedure RunWorkflowOnSendPrlPendAppTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnSendPrlPendAppTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::IntCodeunit, 'OnSendPrlPendAppTxtforApproval', '', false, false)]
    //     procedure RunWorkflowOnSendPrlPendAppTxtApproval(var PrlPendAppTxt: Record "Prl-Approval")
    //     begin
    //         WFMngt.HandleEvent(RunWorkflowOnSendPrlPendAppTxtApprovalCode(), PrlPendAppTxt);
    //     end;

    //     procedure RunWorkflowOnApprovePrlPendAppTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnApprovePrlPendAppTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnApprovePrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure RunWorkflowOnRejectPrlPendAppTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnRejectPrlPendAppTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnRejectPrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure RunWorkflowOnCancelledPrlPendAppTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnRejectPrlPendAppTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnCancelledPrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure RunWorkflowOnDelegatePrlPendAppTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnDelegatePrlPendAppTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnDelegatePrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure SetStatusToPendingApprovalCodePrlPendAppTxt(): Code[128]
    //     begin
    //         exit(UpperCase('SetStatusToPendingApprovalPrlPendAppTxt'));
    //     end;

    //     procedure SetStatusToPendingApprovalPrlPendAppTxt(var Variant: Variant)
    //     var
    //         RecRef: RecordRef;
    //         PrlPendAppTxt: Record "Prl-Approval";
    //     begin
    //         RecRef.GetTable(Variant);
    //         case RecRef.Number() of
    //             DATABASE::"Prl-Approval":
    //                 begin
    //                     RecRef.SetTable(PrlPendAppTxt);
    //                     PrlPendAppTxt.Validate(Status, PrlPendAppTxt.Status::"Pending Approval");
    //                     PrlPendAppTxt.Modify();
    //                     Variant := PrlPendAppTxt;
    //                 end;
    //         end;
    //     end;

    //     procedure ReleasePrlPendAppTxtCode(): Code[128]
    //     begin
    //         exit(UpperCase('Release PrlPendAppTxt'));
    //     end;

    //     procedure ReleasePrlPendAppTxt(var Variant: Variant)
    //     var
    //         RecRef: RecordRef;
    //         TargetRecRef: RecordRef;
    //         ApprovalEntry: Record "Approval Entry";
    //         PrlPendAppTxt: Record "Prl-Approval";
    //     begin
    //         RecRef.GetTable(Variant);
    //         case RecRef.Number() of
    //             DATABASE::"Approval Entry":
    //                 begin
    //                     ApprovalEntry := Variant;
    //                     TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
    //                     Variant := TargetRecRef;
    //                     ReleasePrlPendAppTxt(Variant);
    //                 end;
    //             DATABASE::"Prl-Approval":
    //                 begin
    //                     RecRef.SetTable(PrlPendAppTxt);
    //                     PrlPendAppTxt.Validate(Status, PrlPendAppTxt.Status::Approved);
    //                     PrlPendAppTxt.ApprovePayroll();
    //                     PrlPendAppTxt.Modify();
    //                     Variant := PrlPendAppTxt;
    //                 end;
    //         end;
    //     end;

    //     procedure ReOpenPrlPendAppTxtCode(): Code[128]
    //     begin
    //         exit(UpperCase('ReOpenPrlPendAppTxt'));
    //     end;

    //     procedure ReOpenPrlPendAppTxt(var Variant: Variant)
    //     var
    //         RecRef: RecordRef;
    //         TargetRecRef: RecordRef;
    //         ApprovalEntry: Record "Approval Entry";
    //         PrlPendAppTxt: Record "Prl-Approval";
    //     begin
    //         RecRef.GetTable(Variant);
    //         case RecRef.Number() of
    //             DATABASE::"Approval Entry":
    //                 begin
    //                     ApprovalEntry := Variant;
    //                     TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
    //                     Variant := TargetRecRef;
    //                     ReOpenPrlPendAppTxt(Variant);
    //                 end;
    //             DATABASE::"Prl-Approval":
    //                 begin
    //                     RecRef.SetTable(PrlPendAppTxt);
    //                     PrlPendAppTxt.Validate(Status, PrlPendAppTxt.Status::Pending);
    //                     PrlPendAppTxt.Modify();
    //                     Variant := PrlPendAppTxt;
    //                 end;
    //         end;
    //     end;

    //     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    //     // procedure AddPrlPendAppTxtEventToLibrary()
    //     // begin
    //     //     WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPrlPendAppTxtApprovalCode(), Database::"Prl-Approval", SendPrlPendAppTxtReq, 0, false);
    //     //     WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePrlPendAppTxtApprovalCode(), Database::"Approval Entry", AppReqPrlPendAppTxt, 0, false);
    //     //     WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPrlPendAppTxtApprovalCode(), Database::"Approval Entry", RejReqPrlPendAppTxt, 0, false);
    //     //     WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePrlPendAppTxtApprovalCode(), Database::"Approval Entry", DelReqPrlPendAppTxt, 0, false);
    //     //     WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPrlPendAppTxtApprovalCode(), Database::"Approval Entry", CanReqPrlPendAppTxt, 0, false);
    //     //     WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPrlPendAppTxtApprovalCode, Database::"Prl-Approval", UserCanReqPrlPendAppTxt, 0, false);
    //     // end;

    //     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    //     // procedure AddPrlPendAppTxtRespToLibrary()
    //     // begin
    //     //     WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePrlPendAppTxt(), 0, PrlPendAppTxtPendAppTxt, 'GROUP 0');
    //     //     WorkflowResponseHandling.AddResponseToLibrary(ReleasePrlPendAppTxtCode(), 0, ReleasePrlPendAppTxtTxt, 'GROUP 0');
    //     //     WorkflowResponseHandling.AddResponseToLibrary(ReOpenPrlPendAppTxtCode(), 0, ReOpenPrlPendAppTxtTxt, 'GROUP 0');
    //     // end;

    //     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    //     // procedure ExeRespForPrlPendAppTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    //     // var
    //     //     WorkflowResponse: Record "Workflow Response";
    //     // begin
    //     //     IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
    //     //         case WorkflowResponse."Function Name" of
    //     //             SetStatusToPendingApprovalCodePrlPendAppTxt():
    //     //                 begin
    //     //                     SetStatusToPendingApprovalPrlPendAppTxt(Variant);
    //     //                     ResponseExecuted := true;
    //     //                 end;
    //     //             ReleasePrlPendAppTxtCode():
    //     //                 begin
    //     //                     ReleasePrlPendAppTxt(Variant);
    //     //                     ResponseExecuted := true;
    //     //                 end;
    //     //             ReOpenPrlPendAppTxtCode():
    //     //                 begin
    //     //                     ReOpenPrlPendAppTxt(Variant);
    //     //                     ResponseExecuted := true;
    //     //                 end;
    //     //         end;
    //     // end;

    //     // //Cancelling of PrlPendAppTxt Code
    //     // procedure RunWorkflowOnCancelPrlPendAppTxtApprovalCode(): Code[128]
    //     // begin
    //     //     exit(UpperCase('RunWorkflowOnCancelPrlPendAppTxtApproval'))
    //     // end;

    //     // [EventSubscriber(ObjectType::Codeunit, Codeunit::IntCodeunit, 'OnCancelPrlPendAppTxtForApproval', '', false, false)]
    //     // procedure RunWorkflowOnCancelPrlPendAppTxtApproval(VAR PrlPendAppTxt: Record "Prl-Approval")
    //     // begin

    //     //     WFMngt.HandleEvent(RunWorkflowOnCancelPrlPendAppTxtApprovalCode(), PrlPendAppTxt);

    //     // end;
    //     //End Cancelling PrlPendAppTxt Code



    //     ////////////////////////
    //     /// 
    //     /// 








    //     //Start BackOfficeTxt Workflow
    //     procedure RunWorkflowOnSendBackOfficeTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnSendBackOfficeTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit", 'OnSendBackOfficeTxtforApproval', '', false, false)]
    //     procedure RunWorkflowOnSendBackOfficeTxtApproval(var BackOfficeTxt: Record "HRM-Back To Office Form")
    //     begin
    //         WFMngt.HandleEvent(RunWorkflowOnSendBackOfficeTxtApprovalCode(), BackOfficeTxt);
    //     end;

    //     procedure RunWorkflowOnApproveBackOfficeTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnApproveBackOfficeTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnApproveBackOfficeTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveBackOfficeTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure RunWorkflowOnRejectBackOfficeTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnRejectBackOfficeTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnRejectBackOfficeTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectBackOfficeTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure RunWorkflowOnCancelledBackOfficeTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnRejectBackOfficeTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnCancelledBackOfficeTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledBackOfficeTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure RunWorkflowOnDelegateBackOfficeTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnDelegateBackOfficeTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    //     procedure RunWorkflowOnDelegateBackOfficeTxtApproval(var ApprovalEntry: Record "Approval Entry")
    //     begin
    //         WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateBackOfficeTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //     end;

    //     procedure SetStatusToPendingApprovalCodeBackOfficeTxt(): Code[128]
    //     begin
    //         exit(UpperCase('SetStatusToPendingApprovalBackOfficeTxt'));
    //     end;

    //     procedure SetStatusToPendingApprovalBackOfficeTxt(var Variant: Variant)
    //     var
    //         RecRef: RecordRef;
    //         BackOfficeTxt: Record "HRM-Back To Office Form";
    //     begin
    //         RecRef.GetTable(Variant);
    //         case RecRef.Number() of
    //             DATABASE::"HRM-Back To Office Form":
    //                 begin
    //                     RecRef.SetTable(BackOfficeTxt);
    //                     BackOfficeTxt.Validate(Status, BackOfficeTxt.Status::"Pending Approval");
    //                     BackOfficeTxt.Modify();
    //                     Variant := BackOfficeTxt;
    //                 end;
    //         end;
    //     end;

    //     procedure ReleaseBackOfficeTxtCode(): Code[128]
    //     begin
    //         exit(UpperCase('Release BackOfficeTxt'));
    //     end;

    //     procedure ReleaseBackOfficeTxt(var Variant: Variant)
    //     var
    //         RecRef: RecordRef;
    //         TargetRecRef: RecordRef;
    //         ApprovalEntry: Record "Approval Entry";
    //         BackOfficeTxt: Record "HRM-Back To Office Form";
    //     begin
    //         RecRef.GetTable(Variant);
    //         case RecRef.Number() of
    //             DATABASE::"Approval Entry":
    //                 begin
    //                     ApprovalEntry := Variant;
    //                     TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
    //                     Variant := TargetRecRef;
    //                     ReleaseBackOfficeTxt(Variant);
    //                 end;
    //             DATABASE::"HRM-Back To Office Form":
    //                 begin
    //                     RecRef.SetTable(BackOfficeTxt);
    //                     BackOfficeTxt.Validate(Status, BackOfficeTxt.Status::Approved);

    //                     BackOfficeTxt.Modify();
    //                     Variant := BackOfficeTxt;
    //                 end;
    //         end;
    //     end;

    //     procedure ReOpenBackOfficeTxtCode(): Code[128]
    //     begin
    //         exit(UpperCase('ReOpenBackOfficeTxt'));
    //     end;

    //     procedure ReOpenBackOfficeTxt(var Variant: Variant)
    //     var
    //         RecRef: RecordRef;
    //         TargetRecRef: RecordRef;
    //         ApprovalEntry: Record "Approval Entry";
    //         BackOfficeTxt: Record "HRM-Back To Office Form";
    //     begin
    //         RecRef.GetTable(Variant);
    //         case RecRef.Number() of
    //             DATABASE::"Approval Entry":
    //                 begin
    //                     ApprovalEntry := Variant;
    //                     TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
    //                     Variant := TargetRecRef;
    //                     ReOpenBackOfficeTxt(Variant);
    //                 end;
    //             DATABASE::"HRM-Back To Office Form":
    //                 begin
    //                     RecRef.SetTable(BackOfficeTxt);
    //                     BackOfficeTxt.Validate(Status, BackOfficeTxt.Status::New);
    //                     BackOfficeTxt.Modify();
    //                     Variant := BackOfficeTxt;
    //                 end;
    //         end;
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    //     procedure AddBackOfficeTxtEventToLibrary()
    //     begin
    //         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendBackOfficeTxtApprovalCode(), Database::"HRM-Back To Office Form", SendBackOfficeTxtReq, 0, false);
    //         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveBackOfficeTxtApprovalCode(), Database::"Approval Entry", AppReqBackOfficeTxt, 0, false);
    //         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectBackOfficeTxtApprovalCode(), Database::"Approval Entry", RejReqBackOfficeTxt, 0, false);
    //         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateBackOfficeTxtApprovalCode(), Database::"Approval Entry", DelReqBackOfficeTxt, 0, false);
    //         WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledBackOfficeTxtApprovalCode(), Database::"Approval Entry", CanReqBackOfficeTxt, 0, false);
    //         WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBackOfficeTxtApprovalCode, Database::"HRM-Back To Office Form", UserCanReqBackOfficeTxt, 0, false);
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    //     procedure AddBackOfficeTxtRespToLibrary()
    //     begin
    //         WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeBackOfficeTxt(), 0, BackOfficeTxtPendAppTxt, 'GROUP 0');
    //         WorkflowResponseHandling.AddResponseToLibrary(ReleaseBackOfficeTxtCode(), 0, ReleaseBackOfficeTxtTxt, 'GROUP 0');
    //         WorkflowResponseHandling.AddResponseToLibrary(ReOpenBackOfficeTxtCode(), 0, ReOpenBackOfficeTxtTxt, 'GROUP 0');
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    //     procedure ExeRespForBackOfficeTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    //     var
    //         WorkflowResponse: Record "Workflow Response";
    //     begin
    //         IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
    //             case WorkflowResponse."Function Name" of
    //                 SetStatusToPendingApprovalCodeBackOfficeTxt():
    //                     begin
    //                         SetStatusToPendingApprovalBackOfficeTxt(Variant);
    //                         ResponseExecuted := true;
    //                     end;
    //                 ReleaseBackOfficeTxtCode():
    //                     begin
    //                         ReleaseBackOfficeTxt(Variant);
    //                         ResponseExecuted := true;
    //                     end;
    //                 ReOpenBackOfficeTxtCode():
    //                     begin
    //                         ReOpenBackOfficeTxt(Variant);
    //                         ResponseExecuted := true;
    //                     end;
    //             end;
    //     end;

    //     //Cancelling of BackOfficeTxt Code
    //     procedure RunWorkflowOnCancelBackOfficeTxtApprovalCode(): Code[128]
    //     begin
    //         exit(UpperCase('RunWorkflowOnCancelBackOfficeTxtApproval'))
    //     end;

    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit", 'OnCancelSendBackOfficeTxtForApproval', '', false, false)]
    //     procedure RunWorkflowOnCancelBackOfficeTxtApproval(VAR BackOfficeTxt: Record "HRM-Back To Office Form")
    //     begin

    //         WFMngt.HandleEvent(RunWorkflowOnCancelBackOfficeTxtApprovalCode(), BackOfficeTxt);

    //     end;
    //     //End Cancelling BackOfficeTxt Code

}
