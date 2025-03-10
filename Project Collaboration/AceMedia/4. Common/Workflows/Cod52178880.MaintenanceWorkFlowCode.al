codeunit 52178880 "MaintenanceWorkFlowCode"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";



        //RepairTxtS
        SendRepairReq: TextConst ENU = 'Approval Request for Repair is requested', ENG = 'Approval Request for Repair is requested';
        AppReqRepair: TextConst ENU = 'Approval Request for Repair is approved', ENG = 'Approval Request for Repair is approved';
        RejReqRepair: TextConst ENU = 'Approval Request for Repair is rejected', ENG = 'Approval Request for Repair is rejected';
        CanReqRepair: TextConst ENU = 'Approval Request for Repair is cancelled', ENG = 'Approval Request for Repair is cancelled';
        UserCanReqRepair: TextConst ENU = 'Approval Request for Repair is cancelled by User', ENG = 'Approval Request for Repair is cancelled by User';
        DelReqRepair: TextConst ENU = 'Approval Request for Repair is delegated', ENG = 'Approval Request for Repair is delegated';
        RepairPendApp: TextConst ENU = 'Status of Repair changed to Pending approval', ENG = 'Status of Repair changed to Pending approval';
        ReleaseRepairTxt: TextConst ENU = 'Release Repair', ENG = 'Release Repair';
        ReOpenRepair: TextConst ENU = 'ReOpen Repair', ENG = 'ReOpen Repair';
        //END RepairTxtS


        //TRANSPORTTxtS
        SendTRANSPORTReq: TextConst ENU = 'Approval Request for TRANSPORT requested', ENG = 'Approval Request for TRANSPORT requested';
        AppReqTRANSPORT: TextConst ENU = 'Approval Request for TRANSPORT approved', ENG = 'Approval Request for TRANSPORT approved';
        RejReqTRANSPORT: TextConst ENU = 'Approval Request for TRANSPORT rejected', ENG = 'Approval Request for TRANSPORT rejected';
        CanReqTRANSPORT: TextConst ENU = 'Approval Request for TRANSPORT cancelled', ENG = 'Approval Request for TRANSPORT cancelled';
        UserCanReqTRANSPORT: TextConst ENU = 'Approval Request for TRANSPORT is cancelled by User', ENG = 'Approval Request for TRANSPORT is cancelled by User';
        DelReqTRANSPORT: TextConst ENU = 'Approval Request for TRANSPORT delegated', ENG = 'Approval Request for TRANSPORT delegated';
        TRANSPORTPendApp: TextConst ENU = 'Status of TRANSPORT changed toPending approval', ENG = 'Status of TRANSPORT changed toPending approval';
        ReleaseTRANSPORTTxt: TextConst ENU = 'ReleaseTRANSPORT', ENG = 'ReleaseTRANSPORT';
        ReOpenTRANSPORT: TextConst ENU = 'ReOpenTRANSPORT', ENG = 'ReOpenTRANSPORT';




    //Start RepairTxt Workflow
    procedure RunWorkflowOnSendRepairApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendRepairApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MaintenanceIntCodeunit", 'OnSendRepairforApproval', '', false, false)]
    procedure RunWorkflowOnSendRepairApproval(var Repair: Record "RepairMaintenance")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendRepairApprovalCode(), Repair);
    end;

    procedure RunWorkflowOnApproveRepairApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveRepairApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveRepairApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveRepairApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectRepairApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectRepairApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectRepairApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectRepairApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledRepairApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectRepairApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledRepairApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledRepairApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateRepairApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateRepairApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateRepairApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateRepairApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeRepair(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalRepair'));
    end;

    procedure SetStatusToPendingApprovalRepair(var Variant: Variant)
    var
        RecRef: RecordRef;
        Repair: Record "RepairMaintenance";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"RepairMaintenance":
                begin
                    RecRef.SetTable(Repair);
                    Repair.Validate(Status, Repair.Status::"Pending Approval");
                    Repair.Modify();
                    Variant := Repair;
                end;
        end;
    end;

    procedure ReleaseRepairCode(): Code[128]
    begin
        exit(UpperCase('Release Repair'));
    end;

    procedure ReleaseRepair(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Repair: Record "RepairMaintenance";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseRepair(Variant);
                end;
            DATABASE::"RepairMaintenance":
                begin
                    RecRef.SetTable(Repair);
                    Repair.Validate(Status, Repair.Status::Approved);

                    Repair.Modify();
                    Variant := Repair;
                end;
        end;
    end;

    procedure ReOpenRepairCode(): Code[128]
    begin
        exit(UpperCase('ReOpenRepair'));
    end;

    procedure ReOpenRepairTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Repair: Record "RepairMaintenance";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenRepairTxt(Variant);
                end;
            DATABASE::"RepairMaintenance":
                begin
                    RecRef.SetTable(Repair);
                    Repair.Validate(Status, Repair.Status::New);
                    Repair.Modify();
                    Variant := Repair;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddRepairTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRepairApprovalCode(), Database::"RepairMaintenance", SendRepairReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveRepairApprovalCode(), Database::"Approval Entry", AppReqRepair, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectRepairApprovalCode(), Database::"Approval Entry", RejReqRepair, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateRepairApprovalCode(), Database::"Approval Entry", DelReqRepair, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledRepairApprovalCode(), Database::"Approval Entry", CanReqRepair, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRepairApprovalCode, Database::"RepairMaintenance", UserCanReqRepair, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddRepairTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeRepair(), 0, RepairPendApp, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseRepairCode(), 0, ReleaseRepairTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenRepairCode(), 0, ReOpenRepair, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForRepairTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeRepair():
                    begin
                        SetStatusToPendingApprovalRepair(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseRepairCode():
                    begin
                        ReleaseRepair(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenRepairCode():
                    begin
                        ReOpenRepairTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of RepairTxt Code
    procedure RunWorkflowOnCancelRepairApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelRepairTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MaintenanceIntCodeunit", 'OnCancelSendRepairForApproval', '', false, false)]
    procedure RunWorkflowOnCancelRepairApproval(VAR Repair: Record "RepairMaintenance")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelRepairApprovalCode(), Repair);

    end;
    //End Cancelling RepairTxt Code




    //Start TRANSPORTTxt Workflow
    procedure RunWorkflowOnSendTRANSPORTApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendTRANSPORTApproval'))
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"MaintenanceIntCodeunit", 'OnSendTRANSPORTforApproval', '', false, false)]
    // procedure RunWorkflowOnSendTRANSPORTApproval(var TRANSPORT: Record "TR TRANSPORT Request")
    // begin
    //     WFMngt.HandleEvent(RunWorkflowOnSendTRANSPORTApprovalCode(), TRANSPORT);
    // end;

    procedure RunWorkflowOnApproveTRANSPORTApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveTRANSPORTApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveTRANSPORTApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveTRANSPORTApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectTRANSPORTApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectTRANSPORTApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectTRANSPORTApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectTRANSPORTApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledTRANSPORTApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectTRANSPORTApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledTRANSPORTApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledTRANSPORTApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateTRANSPORTApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateTRANSPORTApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateTRANSPORTApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateTRANSPORTApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeTRANSPORT(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalTRANSPORT'));
    end;

    procedure SetStatusToPendingApprovalTRANSPORT(var Variant: Variant)
    var
        RecRef: RecordRef;
    // TRANSPORT: Record "TR TRANSPORT Request";
    begin
        // RecRef.GetTable(Variant);
        // case RecRef.Number() of
        //     DATABASE::"TR TRANSPORT Request":
        //         begin
        //             RecRef.SetTable(TRANSPORT);
        //             TRANSPORT.Validate(Status, TRANSPORT.Status::"Pending Approval");
        //             TRANSPORT.Modify();
        //             Variant := TRANSPORT;
        //         end;
        // end;
    end;

    procedure ReleaseTRANSPORTCode(): Code[128]
    begin
        exit(UpperCase('Release TRANSPORT'));
    end;

    procedure ReleaseTRANSPORT(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
    //TRANSPORT: Record "TR TRANSPORT Request";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseTRANSPORT(Variant);
                end;
        // DATABASE::"TR TRANSPORT Request":
        //     begin
        //         RecRef.SetTable(TRANSPORT);
        //         TRANSPORT.Validate(Status, TRANSPORT.Status::Approved);

        //         TRANSPORT.Modify();
        //         Variant := TRANSPORT;
        //     end;
        end;
    end;

    procedure ReOpenTRANSPORTCode(): Code[128]
    begin
        exit(UpperCase('ReOpenTRANSPORT'));
    end;

    procedure ReOpenTRANSPORTTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
    // TRANSPORT: Record "TR TRANSPORT Request";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenTRANSPORTTxt(Variant);
                end;
        // DATABASE::"TR TRANSPORT Request":
        //     begin
        //         RecRef.SetTable(TRANSPORT);
        //         TRANSPORT.Validate(Status, TRANSPORT.Status::New);
        //         TRANSPORT.Modify();
        //         Variant := TRANSPORT;
        //     end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddTRANSPORTTxtEventToLibrary()
    begin
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTRANSPORTApprovalCode(), Database::"TR TRANSPORT Request", SendTRANSPORTReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveTRANSPORTApprovalCode(), Database::"Approval Entry", AppReqTRANSPORT, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectTRANSPORTApprovalCode(), Database::"Approval Entry", RejReqTRANSPORT, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateTRANSPORTApprovalCode(), Database::"Approval Entry", DelReqTRANSPORT, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledTRANSPORTApprovalCode(), Database::"Approval Entry", CanReqTRANSPORT, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTRANSPORTApprovalCode, Database::"TR TRANSPORT Request", UserCanReqTRANSPORT, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddTRANSPORTTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeTRANSPORT(), 0, TRANSPORTPendApp, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseTRANSPORTCode(), 0, ReleaseTRANSPORTTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenTRANSPORTCode(), 0, ReOpenTRANSPORT, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForTRANSPORTTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeTRANSPORT():
                    begin
                        SetStatusToPendingApprovalTRANSPORT(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseTRANSPORTCode():
                    begin
                        ReleaseTRANSPORT(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenTRANSPORTCode():
                    begin
                        ReOpenTRANSPORTTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of TRANSPORTTxt Code
    procedure RunWorkflowOnCancelTRANSPORTApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelTRANSPORTTxtApproval'))
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"MaintenanceIntCodeunit", 'OnCancelSendTRANSPORTForApproval', '', false, false)]
    // procedure RunWorkflowOnCancelTRANSPORTApproval(VAR TRANSPORT: Record "TR TRANSPORT Request")
    // begin

    //     WFMngt.HandleEvent(RunWorkflowOnCancelTRANSPORTApprovalCode(), TRANSPORT);

    // end;
    //End Cancelling TRANSPORTTxt Code



}

