codeunit 50005 "Workflow Code PC"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        //AppMgmt: Codeunit "Approvals Mgmt.";
        // AppMgmt: Codeunit "Approvals Management 2";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";


        //PCC2
        SendPCC2Req: TextConst ENU = 'Approval Request for Perfomance Creteria2 requested', ENG = 'Approval Request for Perfomance Creteria2 requested';
        AppReqPCC2: TextConst ENU = 'Approval Request for Perfomance Creteria2 approved', ENG = 'Approval Request for Perfomance Creteria2 approved';
        RejReqPCC2: TextConst ENU = 'Approval Request for Perfomance Creteria2 rejected', ENG = 'Approval Request for Perfomance Creteria2 rejected';
        CanReqPCC2: TextConst ENU = 'Approval Request for Perfomance Creteria2 cancelled', ENG = 'Approval Request for Perfomance Creteria2 cancelled';
        DelReqPCC2: TextConst ENU = 'Approval Request for Perfomance Creteria2 delegated', ENG = 'Approval Request for Perfomance Creteria2 delegated';
        PCC2PendAppTxt: TextConst ENU = 'Status Perfomance Creteria2 changed to Pending approval',
                                        ENG = 'Status Perfomance Creteria2 changed to Pending approval';
        ReleasePCC2Txt: TextConst ENU = 'Release Perfomance Creteria2', ENG = 'Release Perfomance Creteria2';
        ReOpenPCC2Txt: TextConst ENU = 'ReOpen Perfomance Creteria2', ENG = 'ReOpen Perfomance Creteria2';
        //End Perfomance Creteria2


        //PCC3
        SendPCC3Req: TextConst ENU = 'Approval Request for Perfomance Creteria3 requested', ENG = 'Approval Request for Perfomance Creteria3 requested';
        AppReqPCC3: TextConst ENU = 'Approval Request for Perfomance Creteria3 approved', ENG = 'Approval Request for Perfomance Creteria3 approved';
        RejReqPCC3: TextConst ENU = 'Approval Request for Perfomance Creteria3 rejected', ENG = 'Approval Request for Perfomance Creteria3 rejected';
        CanReqPCC3: TextConst ENU = 'Approval Request for Perfomance Creteria3 cancelled', ENG = 'Approval Request for Perfomance Creteria3 cancelled';
        DelReqPCC3: TextConst ENU = 'Approval Request for Perfomance Creteria3 delegated', ENG = 'Approval Request for Perfomance Creteria3 delegated';
        PCC3PendAppTxt: TextConst ENU = 'Status Perfomance Creteria3 changed to Pending approval',
                                        ENG = 'Status Perfomance Creteria3 changed to Pending approval';
        ReleasePCC3Txt: TextConst ENU = 'Release Perfomance Creteria3', ENG = 'Release Perfomance Creteria3';
        ReOpenPCC3Txt: TextConst ENU = 'ReOpen Perfomance Creteria3', ENG = 'ReOpen Perfomance Creteria3';
        //End Perfomance Creteria3

        //PCC4
        SendPCC4Req: TextConst ENU = 'Approval Request for Perfomance Creteria4 requested', ENG = 'Approval Request for Perfomance Creteria4 requested';
        AppReqPCC4: TextConst ENU = 'Approval Request for Perfomance Creteria4 approved', ENG = 'Approval Request for Perfomance Creteria4 approved';
        RejReqPCC4: TextConst ENU = 'Approval Request for Perfomance Creteria4 rejected', ENG = 'Approval Request for Perfomance Creteria4 rejected';
        CanReqPCC4: TextConst ENU = 'Approval Request for Perfomance Creteria4 cancelled', ENG = 'Approval Request for Perfomance Creteria4 cancelled';
        DelReqPCC4: TextConst ENU = 'Approval Request for Perfomance Creteria4 delegated', ENG = 'Approval Request for Perfomance Creteria4 delegated';
        PCC4PendAppTxt: TextConst ENU = 'Status Perfomance Creteria4 changed to Pending approval',
                                        ENG = 'Status Perfomance Creteria4 changed to Pending approval';
        ReleasePCC4Txt: TextConst ENU = 'Release Perfomance Creteria4', ENG = 'Release Perfomance Creteria4';
        ReOpenPCC4Txt: TextConst ENU = 'ReOpen Perfomance Creteria4', ENG = 'ReOpen Perfomance Creteria4';
        //End Perfomance Creteria4
        //PCC5
        SendPCC5Req: TextConst ENU = 'Approval Request for Perfomance Creteria5 requested', ENG = 'Approval Request for Perfomance Creteria5 requested';
        AppReqPCC5: TextConst ENU = 'Approval Request for Perfomance Creteria5 approved', ENG = 'Approval Request for Perfomance Creteria5 approved';
        RejReqPCC5: TextConst ENU = 'Approval Request for Perfomance Creteria5 rejected', ENG = 'Approval Request for Perfomance Creteria5 rejected';
        CanReqPCC5: TextConst ENU = 'Approval Request for Perfomance Creteria5 cancelled', ENG = 'Approval Request for Perfomance Creteria5 cancelled';
        DelReqPCC5: TextConst ENU = 'Approval Request for Perfomance Creteria5 delegated', ENG = 'Approval Request for Perfomance Creteria5 delegated';
        PCC5PendAppTxt: TextConst ENU = 'Status Perfomance Creteria5 changed to Pending approval',
                                        ENG = 'Status Perfomance Creteria5 changed to Pending approval';
        ReleasePCC5Txt: TextConst ENU = 'Release Perfomance Creteria5', ENG = 'Release Perfomance Creteria5';
        ReOpenPCC5Txt: TextConst ENU = 'ReOpen Perfomance Creteria5', ENG = 'ReOpen Perfomance Creteria5';
    //End Perfomance Creteria5


    //PCC2
    procedure RunWorkflowOnSendPCC2ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPCC2Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Init Code PC", 'OnSendPCC2forApproval', '', false, false)]
    procedure RunWorkflowOnSendPCC2Approval(var PCC2: Record "Performance Criteria Cascade 2")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPCC2ApprovalCode(), PCC2);
    end;

    procedure RunWorkflowOnApprovePCC2ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePCC2Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePCC2Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePCC2ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPCC2ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC2Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPCC2Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPCC2ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledPCC2ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC2Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledPCC2Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPCC2ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePCC2ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePCC2Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePCC2Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePCC2ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePCC2(): Code[128]
    begin
        exit(UpperCase('Set Perfomance Creteria2 Status to pending Approval'));
    end;

    procedure SetStatusToPendingApprovalPCC2(var Variant: Variant)
    var
        RecRef: RecordRef;
        PCC2: Record "Performance Criteria Cascade 2";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Performance Criteria Cascade 2":
                begin
                    RecRef.SetTable(PCC2);
                    PCC2.Validate("PCC2 Status", PCC2."PCC2 Status"::"Pending Approval");
                    PCC2.Modify();
                    Variant := PCC2;
                end;
        end;
    end;

    procedure ReleasePCC2Code(): Code[128]
    begin
        exit(UpperCase('Release Perfomance Creteria2'));
    end;

    procedure ReleasePCC2(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC2: Record "Performance Criteria Cascade 2";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePCC2(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 2":
                begin
                    RecRef.SetTable(PCC2);
                    PCC2.Validate("PCC2 Status", PCC2."PCC2 Status"::Approved);
                    PCC2.Modify();
                    Variant := PCC2;
                end;
        end;
    end;

    procedure ReOpenPCC2Code(): Code[128]
    begin
        exit(UpperCase('Re Open Perfomance Creteria2'));
    end;

    procedure CancPCC2Code(): Code[128]
    begin
        exit(UpperCase('Cancel Perfomance Creteria2'));
    end;


    procedure ReOpenPCC2(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC2: Record "Performance Criteria Cascade 2";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC2(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 2":
                begin
                    RecRef.SetTable(PCC2);
                    PCC2.Validate("PCC2 Status", PCC2."PCC2 Status"::Open);
                    PCC2.Modify();
                    Variant := PCC2;
                end;
        end;
    end;

    //Added Functionallity to test

    procedure CancPCC2(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC2: Record "Performance Criteria Cascade 2";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC2(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 2":
                begin
                    RecRef.SetTable(PCC2);
                    PCC2.Validate("PCC2 Status", PCC2."PCC2 Status"::Cancelled);
                    PCC2.Modify();
                    Variant := PCC2;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPCC2EventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPCC2ApprovalCode(), Database::"Performance Criteria Cascade 2", SendPCC2Req, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePCC2ApprovalCode(), Database::"Approval Entry", AppReqPCC2, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPCC2ApprovalCode(), Database::"Approval Entry", RejReqPCC2, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePCC2ApprovalCode(), Database::"Approval Entry", DelReqPCC2, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPCC2ApprovalCode(), Database::"Approval Entry", CanReqPCC2, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPCC2RespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePCC2(), 0, PCC2PendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePCC2Code(), 0, ReleasePCC2Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPCC2Code(), 0, ReOpenPCC2Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(CancPCC2Code(), 0, CanReqPCC2, 'GROUP 0')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPCC2(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePCC2():
                    begin
                        SetStatusToPendingApprovalPCC2(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePCC2Code():
                    begin
                        ReleasePCC2(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPCC2Code():
                    begin
                        ReOpenPCC2(Variant);
                        ResponseExecuted := true;
                    end;
                CancPCC2Code():
                    begin
                        CancPCC2(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //PCC3
    procedure RunWorkflowOnSendPCC3ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPCC3Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Init Code PC", 'OnSendPCC3forApproval', '', false, false)]
    procedure RunWorkflowOnSendPCC3Approval(var PCC3: Record "Performance Criteria Cascade 3")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPCC3ApprovalCode(), PCC3);
    end;

    procedure RunWorkflowOnApprovePCC3ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePCC3Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePCC3Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePCC3ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPCC3ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC3Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPCC3Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPCC3ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledPCC3ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC3Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledPCC3Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPCC3ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePCC3ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePCC3Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePCC3Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePCC3ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePCC3(): Code[128]
    begin
        exit(UpperCase('Set Perfomance Creteria3 Status to pending Approval'));
    end;

    procedure SetStatusToPendingApprovalPCC3(var Variant: Variant)
    var
        RecRef: RecordRef;
        PCC3: Record "Performance Criteria Cascade 3";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Performance Criteria Cascade 3":
                begin
                    RecRef.SetTable(PCC3);
                    PCC3.Validate("PCC3 Status", PCC3."PCC3 Status"::"Pending Approval");
                    PCC3.Modify();
                    Variant := PCC3;
                end;
        end;
    end;

    procedure ReleasePCC3Code(): Code[128]
    begin
        exit(UpperCase('Release Perfomance Creteria3'));
    end;

    procedure ReleasePCC3(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC3: Record "Performance Criteria Cascade 3";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePCC3(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 3":
                begin
                    RecRef.SetTable(PCC3);
                    PCC3.Validate("PCC3 Status", PCC3."PCC3 Status"::Approved);
                    PCC3.Modify();
                    Variant := PCC3;
                end;
        end;
    end;

    procedure ReOpenPCC3Code(): Code[128]
    begin
        exit(UpperCase('Re Open Perfomance Creteria3'));
    end;

    procedure CancPCC3Code(): Code[128]
    begin
        exit(UpperCase('Cancel Perfomance Creteria3'));
    end;


    procedure ReOpenPCC3(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC3: Record "Performance Criteria Cascade 3";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC3(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 3":
                begin
                    RecRef.SetTable(PCC3);
                    PCC3.Validate("PCC3 Status", PCC3."PCC3 Status"::Open);
                    PCC3.Modify();
                    Variant := PCC3;
                end;
        end;
    end;

    //Added Functionallity to test

    procedure CancPCC3(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC3: Record "Performance Criteria Cascade 3";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC3(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 3":
                begin
                    RecRef.SetTable(PCC3);
                    PCC3.Validate("PCC3 Status", PCC3."PCC3 Status"::Cancelled);
                    PCC3.Modify();
                    Variant := PCC3;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPCC3EventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPCC3ApprovalCode(), Database::"Performance Criteria Cascade 3", SendPCC3Req, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePCC3ApprovalCode(), Database::"Approval Entry", AppReqPCC3, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPCC3ApprovalCode(), Database::"Approval Entry", RejReqPCC3, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePCC3ApprovalCode(), Database::"Approval Entry", DelReqPCC3, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPCC3ApprovalCode(), Database::"Approval Entry", CanReqPCC3, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPCC3RespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePCC3(), 0, PCC3PendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePCC3Code(), 0, ReleasePCC3Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPCC3Code(), 0, ReOpenPCC3Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(CancPCC3Code(), 0, CanReqPCC3, 'GROUP 0')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPCC3(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePCC3():
                    begin
                        SetStatusToPendingApprovalPCC3(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePCC3Code():
                    begin
                        ReleasePCC3(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPCC3Code():
                    begin
                        ReOpenPCC3(Variant);
                        ResponseExecuted := true;
                    end;
                CancPCC3Code():
                    begin
                        CancPCC3(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;
    //End Performance Creteria 3

    //PCC4
    procedure RunWorkflowOnSendPCC4ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPCC4Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Init Code PC", 'OnSendPCC4forApproval', '', false, false)]
    procedure RunWorkflowOnSendPCC4Approval(var PCC4: Record "Performance Criteria Cascade 4")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPCC4ApprovalCode(), PCC4);
    end;

    procedure RunWorkflowOnApprovePCC4ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePCC4Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePCC4Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePCC4ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPCC4ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC4Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPCC4Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPCC4ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledPCC4ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC4Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledPCC4Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPCC4ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePCC4ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePCC4Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePCC4Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePCC4ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePCC4(): Code[128]
    begin
        exit(UpperCase('Set Perfomance Creteria4 Status to pending Approval'));
    end;

    procedure SetStatusToPendingApprovalPCC4(var Variant: Variant)
    var
        RecRef: RecordRef;
        PCC4: Record "Performance Criteria Cascade 4";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Performance Criteria Cascade 4":
                begin
                    RecRef.SetTable(PCC4);
                    PCC4.Validate("PCC4 Status", PCC4."PCC4 Status"::"Pending Approval");
                    PCC4.Modify();
                    Variant := PCC4;
                end;
        end;
    end;

    procedure ReleasePCC4Code(): Code[128]
    begin
        exit(UpperCase('Release Perfomance Creteria4'));
    end;

    procedure ReleasePCC4(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC4: Record "Performance Criteria Cascade 4";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePCC4(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 4":
                begin
                    RecRef.SetTable(PCC4);
                    PCC4.Validate("PCC4 Status", PCC4."PCC4 Status"::Approved);
                    PCC4.Modify();
                    Variant := PCC4;
                end;
        end;
    end;

    procedure ReOpenPCC4Code(): Code[128]
    begin
        exit(UpperCase('Re Open Perfomance Creteria4'));
    end;

    procedure CancPCC4Code(): Code[128]
    begin
        exit(UpperCase('Cancel Perfomance Creteria4'));
    end;


    procedure ReOpenPCC4(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC4: Record "Performance Criteria Cascade 4";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC4(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 4":
                begin
                    RecRef.SetTable(PCC4);
                    PCC4.Validate("PCC4 Status", PCC4."PCC4 Status"::Open);
                    PCC4.Modify();
                    Variant := PCC4;
                end;
        end;
    end;

    //Added Functionallity to test

    procedure CancPCC4(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC4: Record "Performance Criteria Cascade 4";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC4(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 4":
                begin
                    RecRef.SetTable(PCC4);
                    PCC4.Validate("PCC4 Status", PCC4."PCC4 Status"::Cancelled);
                    PCC4.Modify();
                    Variant := PCC4;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPCC4EventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPCC4ApprovalCode(), Database::"Performance Criteria Cascade 4", SendPCC4Req, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePCC4ApprovalCode(), Database::"Approval Entry", AppReqPCC4, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPCC4ApprovalCode(), Database::"Approval Entry", RejReqPCC4, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePCC4ApprovalCode(), Database::"Approval Entry", DelReqPCC4, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPCC4ApprovalCode(), Database::"Approval Entry", CanReqPCC4, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPCC4RespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePCC4(), 0, PCC4PendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePCC4Code(), 0, ReleasePCC4Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPCC4Code(), 0, ReOpenPCC4Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(CancPCC4Code(), 0, CanReqPCC4, 'GROUP 0')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPCC4(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePCC4():
                    begin
                        SetStatusToPendingApprovalPCC4(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePCC4Code():
                    begin
                        ReleasePCC4(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPCC4Code():
                    begin
                        ReOpenPCC4(Variant);
                        ResponseExecuted := true;
                    end;
                CancPCC4Code():
                    begin
                        CancPCC4(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //End Performance Criteria Cascade 4



    //PCC5
    procedure RunWorkflowOnSendPCC5ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPCC5Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Init Code PC", 'OnSendPCC5forApproval', '', false, false)]
    procedure RunWorkflowOnSendPCC5Approval(var PCC5: Record "Performance Criteria Cascade 5")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPCC5ApprovalCode(), PCC5);
    end;

    procedure RunWorkflowOnApprovePCC5ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePCC5Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePCC5Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePCC5ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPCC5ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC5Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPCC5Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPCC5ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledPCC5ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCC5Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledPCC5Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPCC5ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePCC5ApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePCC5Approval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePCC5Approval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePCC5ApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePCC5(): Code[128]
    begin
        exit(UpperCase('Set Perfomance Creteria5 Status to pending Approval'));
    end;

    procedure SetStatusToPendingApprovalPCC5(var Variant: Variant)
    var
        RecRef: RecordRef;
        PCC5: Record "Performance Criteria Cascade 5";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Performance Criteria Cascade 5":
                begin
                    RecRef.SetTable(PCC5);
                    PCC5.Validate("PCC5 Status", PCC5."PCC5 Status"::"Pending Approval");
                    PCC5.Modify();
                    Variant := PCC5;
                end;
        end;
    end;

    procedure ReleasePCC5Code(): Code[128]
    begin
        exit(UpperCase('Release Perfomance Creteria5'));
    end;

    procedure ReleasePCC5(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC5: Record "Performance Criteria Cascade 5";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePCC5(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 5":
                begin
                    RecRef.SetTable(PCC5);
                    PCC5.Validate("PCC5 Status", PCC5."PCC5 Status"::Approved);
                    PCC5.Modify();
                    Variant := PCC5;
                end;
        end;
    end;

    procedure ReOpenPCC5Code(): Code[128]
    begin
        exit(UpperCase('Re Open Perfomance Creteria5'));
    end;

    procedure CancPCC5Code(): Code[128]
    begin
        exit(UpperCase('Cancel Perfomance Creteria5'));
    end;


    procedure ReOpenPCC5(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC5: Record "Performance Criteria Cascade 5";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC5(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 5":
                begin
                    RecRef.SetTable(PCC5);
                    PCC5.Validate("PCC5 Status", PCC5."PCC5 Status"::Open);
                    PCC5.Modify();
                    Variant := PCC5;
                end;
        end;
    end;

    //Added Functionallity to test

    procedure CancPCC5(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCC5: Record "Performance Criteria Cascade 5";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCC5(Variant);
                end;
            DATABASE::"Performance Criteria Cascade 5":
                begin
                    RecRef.SetTable(PCC5);
                    PCC5.Validate("PCC5 Status", PCC5."PCC5 Status"::Cancelled);
                    PCC5.Modify();
                    Variant := PCC5;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPCC5EventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPCC5ApprovalCode(), Database::"Performance Criteria Cascade 5", SendPCC5Req, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePCC5ApprovalCode(), Database::"Approval Entry", AppReqPCC5, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPCC5ApprovalCode(), Database::"Approval Entry", RejReqPCC5, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePCC5ApprovalCode(), Database::"Approval Entry", DelReqPCC5, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPCC5ApprovalCode(), Database::"Approval Entry", CanReqPCC5, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPCC5RespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePCC5(), 0, PCC5PendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePCC5Code(), 0, ReleasePCC5Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPCC5Code(), 0, ReOpenPCC5Txt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(CancPCC5Code(), 0, CanReqPCC5, 'GROUP 0')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPCC5(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePCC5():
                    begin
                        SetStatusToPendingApprovalPCC5(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePCC5Code():
                    begin
                        ReleasePCC5(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPCC5Code():
                    begin
                        ReOpenPCC5(Variant);
                        ResponseExecuted := true;
                    end;
                CancPCC5Code():
                    begin
                        CancPCC5(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;
    //End Performance Criteria Cascade 5
}