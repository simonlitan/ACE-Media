codeunit 50914 "Work Flow Code2"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        //Emploee Requisition
        
        //Leave Start
        SendLEAVEReq: TextConst ENU = 'Approval Request for LEAVE  Requisition is requested',
                                ENG = 'Approval Request for LEAVE Requisition is requested';
        AppReqLEAVE: TextConst ENU = 'Approval Request for LEAVE Requisition is approved',
                                ENG = 'Approval Request for LEAVE Requisition is approved';
        RejReqLEAVE: TextConst ENU = 'Approval Request for LEAVE Requisition is rejected',
                                ENG = 'Approval Request for LEAVE Requisition is rejected';
        DelReqLEAVE: TextConst ENU = 'Approval Request for LEAVE Requisition is delegated',
                                ENG = 'Approval Request for LEAVE Requisition is delegated';
        CancelLEAVE: TextConst ENU = 'Approval Request for LEAVE Requisition is Cancelled By User',
                                ENG = 'Approval Request for LEAVE Requisition is Cancelled By User';
        SendLEAVEForPendAppTxt: TextConst ENU = 'Status of LEAVE Requisitionchanged to Pending approval',
                                        ENG = 'Status of LEAVE Requisition changed to Pending approval';
        ReleaseLEAVETxt: TextConst ENU = 'Release LEAVE Requisition ', ENG = 'Release LEAVE Requisition ';
        ReOpenLEAVETxt: TextConst ENU = 'ReOpen LEAVE Requisition ', ENG = 'ReOpen LEAVE Requisition ';

        //PCA start
        SendPCAReq: TextConst ENU = 'Approval Request for PCA is requested', ENG = 'Approval Request for PCA is requested';
        AppReqPCA: TextConst ENU = 'Approval Request for PCA is approved', ENG = 'Approval Request for PCA is approved';
        RejReqPCA: TextConst ENU = 'Approval Request for PCA is rejected', ENG = 'Approval Request for PCA is rejected';
        CanReqPCA: TextConst ENU = 'Approval Request for PCA is cancelled', ENG = 'Approval Request for PCA is cancelled';

        DelReqPCA: TextConst ENU = 'Approval Request for PCA is delegated', ENG = 'Approval Request for PCA is delegated';
        PCASendForPendAppTxt: TextConst ENU = 'Status of PCA changed to Pending approval',
                                        ENG = 'Status of PCA changed to Pending approval';
        ReleasePCATxt: TextConst ENU = 'Release PCA', ENG = 'Release PCA';
        ReOpenPCATxt: TextConst ENU = 'ReOpen PCA', ENG = 'ReOpen PCA';
        UserCanReqPCA: TextConst ENU = 'Approval Request for PCA is cancelled by user', ENG = 'Approval Request for PCA is cancelled by user';
    //Leave
    procedure RunWorkflowOnSendLEAVEApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendLEAVEApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::IntCodeunit2, 'OnSendLEAVEforApproval', '', false, false)]
    procedure RunWorkflowOnSendLEAVEApproval(var LEAVE: Record "HRM-LEAVE Requisition")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendLEAVEApprovalCode(), LEAVE);
    end;

    procedure RunWorkflowOnApproveLEAVEApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveLEAVEApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveLEAVEApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveLEAVEApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectLEAVEApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectLEAVEApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectLEAVEApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectLEAVEApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateLEAVEApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateLEAVEApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateLEAVEApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateLEAVEApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelLEAVEApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelLEAVEApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelLEAVEforApproval', '', false, false)]
    procedure RunWorkflowOnCancelLEAVEApproval(var HRMLEAVEReq: Record "HRM-LEAVE Requisition")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelLEAVEApprovalCode(), HRMLEAVEReq);
    end;

    procedure SetStatusToPendingApprovalCodeLEAVE(): Code[128]
    begin
        exit(UpperCase('Set Status To PendingApproval on LEAVE'));
    end;

    procedure SetStatusToPendingApprovalLEAVE(var Variant: Variant)
    var
        RecRef: RecordRef;
        LEAVE: Record "HRM-LEAVE Requisition";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"HRM-LEAVE Requisition":
                begin
                    RecRef.SetTable(LEAVE);
                    LEAVE.Validate(Status, LEAVE.Status::"Pending Approval");
                    LEAVE.Modify();
                    Variant := LEAVE;
                end;
        end;
    end;

    procedure ReleaseLEAVECode(): Code[128]
    begin
        exit(UpperCase('Release LEAVE Requisition'));
    end;

    procedure ReleaseLEAVE(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        LEAVE: Record "HRM-LEAVE Requisition";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseLEAVE(Variant);
                end;
            DATABASE::"HRM-LEAVE Requisition":
                begin
                    RecRef.SetTable(LEAVE);
                    LEAVE.Validate(Status, LEAVE.Status::Released);
                    LEAVE.Modify();
                    Variant := LEAVE;
                end;
        end;
    end;

    procedure ReOpenLEAVECode(): Code[128]
    begin
        exit(UpperCase('ReOpen LEAVE'));
    end;

    procedure ReOpenLEAVE(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        LEAVE: Record "HRM-LEAVE Requisition";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenLEAVE(Variant);
                end;
            DATABASE::"HRM-LEAVE Requisition":
                begin
                    RecRef.SetTable(LEAVE);
                    LEAVE.Validate(Status, LEAVE.Status::open);
                    LEAVE.Modify();
                    Variant := LEAVE;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddLEAVEEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLEAVEApprovalCode(), Database::"HRM-LEAVE Requisition", SendLEAVEReq, 0, false);

        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveLEAVEApprovalCode(), Database::"Approval Entry", AppReqLEAVE, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveLEAVEApprovalCode(), Database::"Approval Entry", ReOpenLEAVETxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectLEAVEApprovalCode(), Database::"Approval Entry", RejReqLEAVE, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateLEAVEApprovalCode(), Database::"Approval Entry", DelReqLEAVE, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelLEAVEApprovalCode(), Database::"Approval Entry", CancelLEAVE, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddLEAVERespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeLEAVE(), 0, SendLEAVEForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseLEAVECode(), 0, ReleaseLEAVETxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenLEAVECode(), 0, ReOpenLEAVETxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForLEAVE(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeLEAVE():
                    begin
                        SetStatusToPendingApprovalLEAVE(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseLEAVECode():
                    begin
                        ReleaseLEAVE(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenLEAVECode():
                    begin
                        ReOpenLEAVE(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;


    //PCA Start

    procedure RunWorkflowOnSendPCAApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPCAApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnSendPCAforApproval', '', false, false)]
    procedure RunWorkflowOnSendPCAApproval(var PCA: Record "prBasic pay PCA")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPCAApprovalCode(), PCA);

    end;

    procedure RunWorkflowOnApprovePCAApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePCAApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePCAApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePCAApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPCAApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPCAApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPCAApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPCAApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelPCAApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelPCAApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnCancelPCAApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelPCAApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledPCAApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelledPCAApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledPCAApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPCAApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePCAApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePCAApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePCAApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePCAApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePCA(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalPCA'));
    end;

    procedure SetStatusToPendingApprovalPCA(var Variant: Variant)
    var
        RecRef: RecordRef;
        PCA: Record "prBasic pay PCA";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"prBasic pay PCA":
                begin
                    RecRef.SetTable(PCA);
                    PCA.Validate(Status, PCA.Status::"Pending Approval");
                    PCA.Modify();
                    Variant := PCA;
                end;
        end;
    end;

    procedure ReleasePCACode(): Code[128]
    begin
        exit(UpperCase('ReleasePCA'));
    end;

    procedure ReleasePCA(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCA: Record "prBasic pay PCA";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePCA(Variant);
                end;
            DATABASE::"prBasic pay PCA":
                begin
                    RecRef.SetTable(PCA);
                    PCA.Validate(Status, PCA.Status::Approved);
                    PCA.Modify();
                    Variant := PCA;
                end;
        end;
    end;

    procedure ReOpenPCACode(): Code[128]
    begin
        exit(UpperCase('ReOpenPCA'));
    end;

    procedure ReOpenPCA(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PCA: Record "prBasic pay PCA";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPCA(Variant);
                end;
            DATABASE::"prBasic pay PCA":
                begin
                    RecRef.SetTable(PCA);
                    PCA.Validate(Status, PCA.Status::Open);
                    PCA.Modify();
                    // Message('Hi there');
                    Variant := PCA;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPCAEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPCAApprovalCode(), Database::"prBasic pay PCA", SendPCAReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePCAApprovalCode(), Database::"Approval Entry", AppReqPCA, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPCAApprovalCode(), Database::"Approval Entry", RejReqPCA, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePCAApprovalCode(), Database::"Approval Entry", DelReqPCA, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPCAApprovalCode(), Database::"Approval Entry", CanReqPCA, 0, false);
        //cancelling of documents
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPCAApprovalCode, Database::"prBasic pay PCA", UserCanReqPCA, 0, false);


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPCARespToLibrary()
    begin

        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePCA(), 0, PCASendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePCACode(), 0, ReleasePCATxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPCACode(), 0, ReOpenPCATxt, 'GROUP 0');
        // try me WorkflowResponseHandling.AddResponseToLibrary(ReOpenPCACode(), 0, ReOpenPCATxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPCA(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";

    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePCA():
                    begin
                        SetStatusToPendingApprovalPCA(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePCACode():
                    begin
                        ReleasePCA(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPCACode():
                    begin
                        ReOpenPCA(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

}
