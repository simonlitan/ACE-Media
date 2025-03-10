codeunit 52179078 "Work Flow Code2"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
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

        // Start TrainingProjectionTxtS
        SendTrainingProjectionTxtReq: TextConst ENU = 'Approval Request for Training Projection is requested', ENG = 'Approval Request for Training Projection is requested';
        AppReqTrainingProjectionTxt: TextConst ENU = 'Approval Request for Training Projection is approved', ENG = 'Approval Request for BackO ffice is approved';
        RejReqTrainingProjectionTxt: TextConst ENU = 'Approval Request for Training Projection is rejected', ENG = 'Approval Request for Training Projection is rejected';
        CanReqTrainingProjectionTxt: TextConst ENU = 'Approval Request for Training Projection is cancelled', ENG = 'Approval Request for Training Projection is cancelled';
        UserCanReqTrainingProjectionTxt: TextConst ENU = 'Approval Request for Training Projection is cancelled by User', ENG = 'Approval Request for Training Projection is cancelled by User';
        DelReqTrainingProjectionTxt: TextConst ENU = 'Approval Request for Training Projection is delegated', ENG = 'Approval Request for Training Projection is delegated';
        TrainingProjectionTxtPendAppTxt: TextConst ENU = 'Status of Training Projection changed to Pending approval', ENG = 'Status of Training Projection changed to Pending approval';
        ReleaseTrainingProjectionTxtTxt: TextConst ENU = 'Release Training Projection', ENG = 'Release Training Projection';
        ReOpenTrainingProjectionTxtTxt: TextConst ENU = 'ReOpen Training Projection', ENG = 'ReOpen Training Projection';
        //END TrainingProjectionTxtS
        // Start LeaveRecallTxtS
        SendLeaveRecallTxtReq: TextConst ENU = 'Approval Request for Leave Recall is requested', ENG = 'Approval Request for Leave Recall is requested';
        AppReqLeaveRecallTxt: TextConst ENU = 'Approval Request for Leave Recall is approved', ENG = 'Approval Request for BackO ffice is approved';
        RejReqLeaveRecallTxt: TextConst ENU = 'Approval Request for Leave Recall is rejected', ENG = 'Approval Request for Leave Recall is rejected';
        CanReqLeaveRecallTxt: TextConst ENU = 'Approval Request for Leave Recall is cancelled', ENG = 'Approval Request for Leave Recall is cancelled';
        UserCanReqLeaveRecallTxt: TextConst ENU = 'Approval Request for Leave Recall is cancelled by User', ENG = 'Approval Request for Leave Recall is cancelled by User';
        DelReqLeaveRecallTxt: TextConst ENU = 'Approval Request for Leave Recall is delegated', ENG = 'Approval Request for Leave Recall is delegated';
        LeaveRecallTxtPendAppTxt: TextConst ENU = 'Status of Leave Recall changed to Pending approval', ENG = 'Status of Leave Recall changed to Pending approval';
        ReleaseLeaveRecallTxtTxt: TextConst ENU = 'Release Leave Recall', ENG = 'Release Leave Recall';
        ReOpenLeaveRecallTxtTxt: TextConst ENU = 'ReOpen Leave Recall', ENG = 'ReOpen Leave Recall';
        //END LeaveRecallTxtS
        //Appraisal
        SendAppraisalReq: TextConst ENU = 'Approval Request for Appraisal  Requisition is requested',
                                ENG = 'Approval Request for Appraisal Requisition is requested';
        AppReqAppraisal: TextConst ENU = 'Approval Request for Appraisal Requisition is approved',
                                ENG = 'Approval Request for Appraisal Requisition is approved';
        RejReqAppraisal: TextConst ENU = 'Approval Request for Appraisal Requisition is rejected',
                                ENG = 'Approval Request for Appraisal Requisition is rejected';
        DelReqAppraisal: TextConst ENU = 'Approval Request for Appraisal Requisition is delegated',
                                ENG = 'Approval Request for Appraisal Requisition is delegated';
        CancelAppraisal: TextConst ENU = 'Approval Request for Appraisal Requisition is Cancelled By User',
                                ENG = 'Approval Request for Appraisal Requisition is Cancelled By User';
        SendAppraisalForPendAppTxt: TextConst ENU = 'Status of Appraisal Requisitionchanged to Pending approval',
                                        ENG = 'Status of Appraisal Requisition changed to Pending approval';
        ReleaseAppraisalTxt: TextConst ENU = 'Release Appraisal Requisition ', ENG = 'Release Appraisal Requisition ';
        ReOpenAppraisalTxt: TextConst ENU = 'ReOpen Appraisal Requisition ', ENG = 'ReOpen Appraisal Requisition ';
        //Workplan
        SendWorkplanReq: TextConst ENU = 'Approval Request for Workplan  Requisition is requested',
                                ENG = 'Approval Request for Workplan Requisition is requested';
        AppReqWorkplan: TextConst ENU = 'Approval Request for Workplan Requisition is approved',
                                ENG = 'Approval Request for Workplan Requisition is approved';
        RejReqWorkplan: TextConst ENU = 'Approval Request for Workplan Requisition is rejected',
                                ENG = 'Approval Request for Workplan Requisition is rejected';
        DelReqWorkplan: TextConst ENU = 'Approval Request for Workplan Requisition is delegated',
                                ENG = 'Approval Request for Workplan Requisition is delegated';
        CancelWorkplan: TextConst ENU = 'Approval Request for Workplan Requisition is Cancelled By User',
                                ENG = 'Approval Request for Workplan Requisition is Cancelled By User';
        SendWorkplanForPendAppTxt: TextConst ENU = 'Status of Workplan Requisitionchanged to Pending approval',
                                        ENG = 'Status of Workplan Requisition changed to Pending approval';
        ReleaseWorkplanTxt: TextConst ENU = 'Release Workplan Requisition ', ENG = 'Release Workplan Requisition ';
        ReOpenWorkplanTxt: TextConst ENU = 'ReOpen Workplan Requisition ', ENG = 'ReOpen Workplan Requisition ';


        //DisputeTxtS
        SendDisputeHrReq: TextConst ENU = 'Approval Request for Hr Dispute is requested', ENG = 'Approval Request for Hr Dispute is requested';
        AppReqDisputeHr: TextConst ENU = 'Approval Request for Hr Dispute is approved', ENG = 'Approval Request for Hr Dispute is approved';
        RejReqDisputeHr: TextConst ENU = 'Approval Request for Hr Dispute is rejected', ENG = 'Approval Request for Hr Dispute is rejected';
        CanReqDisputeHr: TextConst ENU = 'Approval Request for Hr Dispute is cancelled', ENG = 'Approval Request for Hr Dispute is cancelled';
        UserCanReqDisputeHr: TextConst ENU = 'Approval Request for Hr Dispute is cancelled by User', ENG = 'Approval Request for Hr Dispute is cancelled by User';
        DelReqDisputeHr: TextConst ENU = 'Approval Request for Hr Dispute is delegated', ENG = 'Approval Request for Hr Dispute is delegated';
        DisputeHrPendApp: TextConst ENU = 'Status of Hr Dispute changed to Pending approval', ENG = 'Status of Hr Dispute changed to Pending approval';
        ReleaseDisputeHrTxt: TextConst ENU = 'Release Hr Dispute', ENG = 'Release Hr Dispute';
        ReOpenDisputeHr: TextConst ENU = 'ReOpen Hr Dispute', ENG = 'ReOpen Hr Dispute';
        //END DisputeTxtS


        // Start DisciplinaryCaseTxtS
        SendDisciplinaryCaseTxtReq: TextConst ENU = 'Approval Request for Disciplinary Case is requested', ENG = 'Approval Request for Disciplinary Case is requested';
        AppReqDisciplinaryCaseTxt: TextConst ENU = 'Approval Request for Disciplinary Case is approved', ENG = 'Approval Request for BackO ffice is approved';
        RejReqDisciplinaryCaseTxt: TextConst ENU = 'Approval Request for Disciplinary Case is rejected', ENG = 'Approval Request for Disciplinary Case is rejected';
        CanReqDisciplinaryCaseTxt: TextConst ENU = 'Approval Request for Disciplinary Case is cancelled', ENG = 'Approval Request for Disciplinary Case is cancelled';
        UserCanReqDisciplinaryCaseTxt: TextConst ENU = 'Approval Request for Disciplinary Case is cancelled by User', ENG = 'Approval Request for Disciplinary Case is cancelled by User';
        DelReqDisciplinaryCaseTxt: TextConst ENU = 'Approval Request for Disciplinary Case is delegated', ENG = 'Approval Request for Disciplinary Case is delegated';
        DisciplinaryCaseTxtPendAppTxt: TextConst ENU = 'Status of Disciplinary Case changed to Pending approval', ENG = 'Status of Disciplinary Case changed to Pending approval';
        ReleaseDisciplinaryCaseTxtTxt: TextConst ENU = 'Release Disciplinary Case', ENG = 'Release Disciplinary Case';
        ReOpenDisciplinaryCaseTxtTxt: TextConst ENU = 'ReOpen Disciplinary Case', ENG = 'ReOpen Disciplinary Case';
        //END DisciplinaryCaseTxtS

        // Start LeaveReturnTxtS
        SendLeaveReturnTxtReq: TextConst ENU = 'Approval Request for Leave Return is requested', ENG = 'Approval Request for Leave Return is requested';
        AppReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is approved', ENG = 'Approval Request for BackO ffice is approved';
        RejReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is rejected', ENG = 'Approval Request for Leave Return is rejected';
        CanReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is cancelled', ENG = 'Approval Request for Leave Return is cancelled';
        UserCanReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is cancelled by User', ENG = 'Approval Request for Leave Return is cancelled by User';
        DelReqLeaveReturnTxt: TextConst ENU = 'Approval Request for Leave Return is delegated', ENG = 'Approval Request for Leave Return is delegated';
        LeaveReturnTxtPendAppTxt: TextConst ENU = 'Status of Leave Return changed to Pending approval', ENG = 'Status of Leave Return changed to Pending approval';
        ReleaseLeaveReturnTxtTxt: TextConst ENU = 'Release Leave Return', ENG = 'Release Leave Return';
        ReOpenLeaveReturnTxtTxt: TextConst ENU = 'ReOpen Leave Return', ENG = 'ReOpen Leave Return';
    //END LeaveReturnTxtS

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
                    LEAVE.Validate(Status, LEAVE.Status::Approved);
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


    // Start TrainingProjectionTxt Workflow
    procedure RunWorkflowOnSendTrainingProjectionTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendTrainingProjectionTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnSendTrainingProjectionTxtforApproval', '', false, false)]
    procedure RunWorkflowOnSendTrainingProjectionTxtApproval(var TrainingProjectionTxt: record "HRM-Training Projection Header")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendTrainingProjectionTxtApprovalCode(), TrainingProjectionTxt);
    end;

    procedure RunWorkflowOnApproveTrainingProjectionTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveTrainingProjectionTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveTrainingProjectionTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveTrainingProjectionTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectTrainingProjectionTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectTrainingProjectionTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectTrainingProjectionTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectTrainingProjectionTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledTrainingProjectionTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectTrainingProjectionTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledTrainingProjectionTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledTrainingProjectionTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateTrainingProjectionTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateTrainingProjectionTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateTrainingProjectionTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateTrainingProjectionTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeTrainingProjectionTxt(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalTrainingProjectionTxt'));
    end;

    procedure SetStatusToPendingApprovalTrainingProjectionTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TrainingProjectionTxt: Record "HRM-Training Projection Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"HRM-Training Projection Header":
                begin
                    RecRef.SetTable(TrainingProjectionTxt);
                    TrainingProjectionTxt.Validate(Status, TrainingProjectionTxt.Status::"Pending Approval");
                    TrainingProjectionTxt.Modify();
                    Variant := TrainingProjectionTxt;
                end;
        end;
    end;

    procedure ReleaseTrainingProjectionTxtCode(): Code[128]
    begin
        exit(UpperCase('Release TrainingProjectionTxt'));
    end;

    procedure ReleaseTrainingProjectionTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        TrainingProjectionTxt: Record "HRM-Training Projection Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseTrainingProjectionTxt(Variant);
                end;
            DATABASE::"HRM-Training Projection Header":
                begin
                    RecRef.SetTable(TrainingProjectionTxt);
                    TrainingProjectionTxt.Validate(Status, TrainingProjectionTxt.Status::Approved);

                    TrainingProjectionTxt.Modify();
                    Variant := TrainingProjectionTxt;
                end;
        end;
    end;

    procedure ReOpenTrainingProjectionTxtCode(): Code[128]
    begin
        exit(UpperCase('ReOpenTrainingProjectionTxt'));
    end;

    procedure ReOpenTrainingProjectionTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        TrainingProjectionTxt: record "HRM-Training Projection Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenTrainingProjectionTxt(Variant);
                end;
            DATABASE::"HRM-Training Projection Header":
                begin
                    RecRef.SetTable(TrainingProjectionTxt);
                    TrainingProjectionTxt.Validate(Status, TrainingProjectionTxt.Status::Open);
                    TrainingProjectionTxt.Modify();
                    Variant := TrainingProjectionTxt;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddTrainingProjectionTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTrainingProjectionTxtApprovalCode(), Database::"HRM-Training Projection Header", SendTrainingProjectionTxtReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveTrainingProjectionTxtApprovalCode(), Database::"Approval Entry", AppReqTrainingProjectionTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectTrainingProjectionTxtApprovalCode(), Database::"Approval Entry", RejReqTrainingProjectionTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateTrainingProjectionTxtApprovalCode(), Database::"Approval Entry", DelReqTrainingProjectionTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledTrainingProjectionTxtApprovalCode(), Database::"Approval Entry", CanReqTrainingProjectionTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTrainingProjectionTxtApprovalCode, Database::"HRM-Training Projection Header", UserCanReqTrainingProjectionTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddTrainingProjectionTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeTrainingProjectionTxt(), 0, TrainingProjectionTxtPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseTrainingProjectionTxtCode(), 0, ReleaseTrainingProjectionTxtTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenTrainingProjectionTxtCode(), 0, ReOpenTrainingProjectionTxtTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForTrainingProjectionTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeTrainingProjectionTxt():
                    begin
                        SetStatusToPendingApprovalTrainingProjectionTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseTrainingProjectionTxtCode():
                    begin
                        ReleaseTrainingProjectionTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenTrainingProjectionTxtCode():
                    begin
                        ReOpenTrainingProjectionTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of TrainingProjectionTxt Code
    procedure RunWorkflowOnCancelTrainingProjectionTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelTrainingProjectionTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelSendTrainingProjectionTxtForApproval', '', false, false)]
    procedure RunWorkflowOnCancelTrainingProjectionTxtApproval(VAR TrainingProjectionTxt: record "HRM-Training Projection Header")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelTrainingProjectionTxtApprovalCode(), TrainingProjectionTxt);

    end;
    //End Cancelling TrainingProjectionTxt Code


    //Start DisputeTxt Workflow
    procedure RunWorkflowOnSendDisputeHrApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendDisputeHrApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnSendDisputeHrforApproval', '', false, false)]
    procedure RunWorkflowOnSendDisputeHrApproval(var Dispute: Record "HRM-Alternative Dispute R")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendDisputeHrApprovalCode(), Dispute);
    end;

    procedure RunWorkflowOnApproveDisputeHrApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveDisputeHrApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveDisputeHrApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveDisputeHrApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectDisputeHrApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectDisputeHrApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectDisputeApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectDisputeHrApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledDisputeHrApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectDisputeHrApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledDisputeHrApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledDisputeHrApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateDisputeHrApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateDisputeHrApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateDisputeHrApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateDisputeHrApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeDisputeHr(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalDisputeHr'));
    end;



    procedure ReleaseDisputeHrCode(): Code[128]
    begin
        exit(UpperCase('Release Hr Dispute'));
    end;

    procedure ReleaseDispute(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Dispute: Record "HRM-Alternative Dispute R";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseDispute(Variant);
                end;
            DATABASE::"HRM-Alternative Dispute R":
                begin
                    RecRef.SetTable(Dispute);
                    Dispute.Validate(Status, Dispute.Status::Approved);
                    Dispute.Modify();
                    dispute.UpdateStatus();
                    Variant := Dispute;
                end;
        end;
    end;

    procedure ReOpenDisputeHrCode(): Code[128]
    begin
        exit(UpperCase('ReOpenDispute'));
    end;

    procedure ReOpenDisputeHrTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Dispute: Record "HRM-Alternative Dispute R";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenDisputeHrTxt(Variant);
                end;
            DATABASE::"HRM-Alternative Dispute R":
                begin
                    RecRef.SetTable(Dispute);
                    Dispute.Validate(Status, Dispute.Status::"Under Negotiation");
                    Dispute.Modify();
                    dispute.UpdateStatus2();
                    Variant := Dispute;
                end;
        end;
    end;

    procedure SetStatusToPendingApprovalDisputeHr(var Variant: Variant)
    var
        RecRef: RecordRef;
        Dispute: Record "HRM-Alternative Dispute R";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"HRM-Alternative Dispute R":
                begin
                    RecRef.SetTable(Dispute);
                    Dispute.Validate(Status, Dispute.Status::"Pending Approval");
                    Dispute.Modify();
                    Variant := Dispute;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddDisputeTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendDisputeHrApprovalCode(), Database::"HRM-Alternative Dispute R", SendDisputeHrReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveDisputeHrApprovalCode(), Database::"Approval Entry", AppReqDisputeHr, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectDisputeHrApprovalCode(), Database::"Approval Entry", RejReqDisputeHr, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateDisputeHrApprovalCode(), Database::"Approval Entry", DelReqDisputeHr, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledDisputeHrApprovalCode(), Database::"Approval Entry", CanReqDisputeHr, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDisputeHrApprovalCode, Database::"HRM-Alternative Dispute R", UserCanReqDisputeHr, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddDisputeTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeDisputeHr(), 0, DisputeHrPendApp, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseDisputeHrCode(), 0, ReleaseDisputeHrTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenDisputeHrCode(), 0, ReOpenDisputeHr, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForDisputeHrTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeDisputeHr():
                    begin
                        SetStatusToPendingApprovalDisputeHr(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseDisputeHrCode():
                    begin
                        ReleaseDispute(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenDisputeHrCode():
                    begin
                        ReOpenDisputeHrTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;



    //Cancelling of DisputeTxt Code
    procedure RunWorkflowOnCancelDisputeHrApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelDisputeHrTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelSendDisputeHrForApproval', '', false, false)]
    procedure RunWorkflowOnCancelDisputeApproval(VAR Dispute: Record "HRM-Alternative Dispute R")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelDisputeHrApprovalCode(), Dispute);

    end;
    //End Cancelling DisputeTxt Code



    // Start DisciplinaryCaseTxt Workflow
    procedure RunWorkflowOnSendDisciplinaryCaseTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendDisciplinaryCaseTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnSendDisciplinaryCaseTxtforApproval', '', false, false)]
    procedure RunWorkflowOnSendDisciplinaryCaseTxtApproval(var DisciplinaryCaseTxt: record "HRM-Disciplinary Cases (B)")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendDisciplinaryCaseTxtApprovalCode(), DisciplinaryCaseTxt);
    end;

    procedure RunWorkflowOnApproveDisciplinaryCaseTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveDisciplinaryCaseTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveDisciplinaryCaseTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveDisciplinaryCaseTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectDisciplinaryCaseTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectDisciplinaryCaseTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectDisciplinaryCaseTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectDisciplinaryCaseTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledDisciplinaryCaseTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectDisciplinaryCaseTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledDisciplinaryCaseTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledDisciplinaryCaseTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateDisciplinaryCaseTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateDisciplinaryCaseTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateDisciplinaryCaseTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateDisciplinaryCaseTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeDisciplinaryCaseTxt(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalDisciplinaryCaseTxt'));
    end;

    procedure SetStatusToPendingApprovalDisciplinaryCaseTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        DisciplinaryCaseTxt: Record "HRM-Disciplinary Cases (B)";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"HRM-Disciplinary Cases (B)":
                begin
                    RecRef.SetTable(DisciplinaryCaseTxt);
                    DisciplinaryCaseTxt.Validate(Status, DisciplinaryCaseTxt.Status::"Pending Approval");
                    DisciplinaryCaseTxt.Modify();
                    Variant := DisciplinaryCaseTxt;
                end;
        end;
    end;

    procedure ReleaseDisciplinaryCaseTxtCode(): Code[128]
    begin
        exit(UpperCase('Release DisciplinaryCaseTxt'));
    end;

    procedure ReleaseDisciplinaryCaseTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        DisciplinaryCaseTxt: Record "HRM-Disciplinary Cases (B)";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseDisciplinaryCaseTxt(Variant);
                end;
            DATABASE::"HRM-Disciplinary Cases (B)":
                begin
                    RecRef.SetTable(DisciplinaryCaseTxt);
                    DisciplinaryCaseTxt.Validate(Status, DisciplinaryCaseTxt.Status::Approved);

                    DisciplinaryCaseTxt.Modify();
                    Variant := DisciplinaryCaseTxt;
                end;
        end;
    end;

    procedure ReOpenDisciplinaryCaseTxtCode(): Code[128]
    begin
        exit(UpperCase('ReOpenDisciplinaryCaseTxt'));
    end;

    procedure ReOpenDisciplinaryCaseTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        DisciplinaryCaseTxt: record "HRM-Disciplinary Cases (B)";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenDisciplinaryCaseTxt(Variant);
                end;
            DATABASE::"HRM-Disciplinary Cases (B)":
                begin
                    RecRef.SetTable(DisciplinaryCaseTxt);
                    DisciplinaryCaseTxt.Validate(Status, DisciplinaryCaseTxt.Status::New);
                    DisciplinaryCaseTxt.Modify();
                    Variant := DisciplinaryCaseTxt;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddDisciplinaryCaseTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendDisciplinaryCaseTxtApprovalCode(), Database::"HRM-Disciplinary Cases (B)", SendDisciplinaryCaseTxtReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveDisciplinaryCaseTxtApprovalCode(), Database::"Approval Entry", AppReqDisciplinaryCaseTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectDisciplinaryCaseTxtApprovalCode(), Database::"Approval Entry", RejReqDisciplinaryCaseTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateDisciplinaryCaseTxtApprovalCode(), Database::"Approval Entry", DelReqDisciplinaryCaseTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledDisciplinaryCaseTxtApprovalCode(), Database::"Approval Entry", CanReqDisciplinaryCaseTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDisciplinaryCaseTxtApprovalCode, Database::"HRM-Disciplinary Cases (B)", UserCanReqDisciplinaryCaseTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddDisciplinaryCaseTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeDisciplinaryCaseTxt(), 0, DisciplinaryCaseTxtPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseDisciplinaryCaseTxtCode(), 0, ReleaseDisciplinaryCaseTxtTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenDisciplinaryCaseTxtCode(), 0, ReOpenDisciplinaryCaseTxtTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForDisciplinaryCaseTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeDisciplinaryCaseTxt():
                    begin
                        SetStatusToPendingApprovalDisciplinaryCaseTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseDisciplinaryCaseTxtCode():
                    begin
                        ReleaseDisciplinaryCaseTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenDisciplinaryCaseTxtCode():
                    begin
                        ReOpenDisciplinaryCaseTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of DisciplinaryCaseTxt Code
    procedure RunWorkflowOnCancelDisciplinaryCaseTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelDisciplinaryCaseTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelSendDisciplinaryCaseTxtForApproval', '', false, false)]
    procedure RunWorkflowOnCancelDisciplinaryCaseTxtApproval(VAR DisciplinaryCaseTxt: record "HRM-Disciplinary Cases (B)")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelDisciplinaryCaseTxtApprovalCode(), DisciplinaryCaseTxt);

    end;
    //End Cancelling DisciplinaryCaseTxt Code


    // Start LeaveRecallTxt Workflow
    procedure RunWorkflowOnSendLeaveRecallTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendLeaveRecallTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnSendLeaveRecallTxtforApproval', '', false, false)]
    procedure RunWorkflowOnSendLeaveRecallTxtApproval(var LeaveRecallTxt: record "HRM-Leave Recall")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendLeaveRecallTxtApprovalCode(), LeaveRecallTxt);
    end;

    procedure RunWorkflowOnApproveLeaveRecallTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveLeaveRecallTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveLeaveRecallTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveLeaveRecallTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectLeaveRecallTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectLeaveRecallTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectLeaveRecallTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectLeaveRecallTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledLeaveRecallTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectLeaveRecallTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledLeaveRecallTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledLeaveRecallTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateLeaveRecallTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateLeaveRecallTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateLeaveRecallTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateLeaveRecallTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeLeaveRecallTxt(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalLeaveRecallTxt'));
    end;

    procedure SetStatusToPendingApprovalLeaveRecallTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        LeaveRecallTxt: Record "HRM-Leave Recall";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"HRM-Back To Office Form":
                begin
                    RecRef.SetTable(LeaveRecallTxt);
                    LeaveRecallTxt.Validate(Status, LeaveRecallTxt.Status::"Pending Approval");
                    LeaveRecallTxt.Modify();
                    Variant := LeaveRecallTxt;
                end;
        end;
    end;

    procedure ReleaseLeaveRecallTxtCode(): Code[128]
    begin
        exit(UpperCase('Release LeaveRecallTxt'));
    end;

    procedure ReleaseLeaveRecallTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        LeaveRecallTxt: Record "HRM-Leave Recall";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseLeaveRecallTxt(Variant);
                end;
            DATABASE::"HRM-Back To Office Form":
                begin
                    RecRef.SetTable(LeaveRecallTxt);
                    LeaveRecallTxt.Validate(Status, LeaveRecallTxt.Status::Approved);

                    LeaveRecallTxt.Modify();
                    Variant := LeaveRecallTxt;
                end;
        end;
    end;

    procedure ReOpenLeaveRecallTxtCode(): Code[128]
    begin
        exit(UpperCase('ReOpenLeaveRecallTxt'));
    end;

    procedure ReOpenLeaveRecallTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        LeaveRecallTxt: record "HRM-Leave Recall";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenLeaveRecallTxt(Variant);
                end;
            DATABASE::"HRM-Leave Recall":
                begin
                    RecRef.SetTable(LeaveRecallTxt);
                    LeaveRecallTxt.Validate(Status, LeaveRecallTxt.Status::New);
                    LeaveRecallTxt.Modify();
                    Variant := LeaveRecallTxt;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddLeaveRecallTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLeaveRecallTxtApprovalCode(), Database::"HRM-Back To Office Form", SendLeaveRecallTxtReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveLeaveRecallTxtApprovalCode(), Database::"Approval Entry", AppReqLeaveRecallTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectLeaveRecallTxtApprovalCode(), Database::"Approval Entry", RejReqLeaveRecallTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateLeaveRecallTxtApprovalCode(), Database::"Approval Entry", DelReqLeaveRecallTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledLeaveRecallTxtApprovalCode(), Database::"Approval Entry", CanReqLeaveRecallTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelLeaveRecallTxtApprovalCode, Database::"HRM-Back To Office Form", UserCanReqLeaveRecallTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddLeaveRecallTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeLeaveRecallTxt(), 0, LeaveRecallTxtPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseLeaveRecallTxtCode(), 0, ReleaseLeaveRecallTxtTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenLeaveRecallTxtCode(), 0, ReOpenLeaveRecallTxtTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForLeaveRecallTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeLeaveRecallTxt():
                    begin
                        SetStatusToPendingApprovalLeaveRecallTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseLeaveRecallTxtCode():
                    begin
                        ReleaseLeaveRecallTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenLeaveRecallTxtCode():
                    begin
                        ReOpenLeaveRecallTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of LeaveRecallTxt Code
    procedure RunWorkflowOnCancelLeaveRecallTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelLeaveRecallTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelSendLeaveRecallTxtForApproval', '', false, false)]
    procedure RunWorkflowOnCancelLeaveRecallTxtApproval(VAR LeaveRecallTxt: record "HRM-Leave Recall")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelLeaveRecallTxtApprovalCode(), LeaveRecallTxt);

    end;
    //End Cancelling LeaveRecallTxt Code



    // Start LeaveReturnTxt Workflow
    procedure RunWorkflowOnSendLeaveReturnTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendLeaveReturnTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnSendLeaveReturnTxtforApproval', '', false, false)]
    procedure RunWorkflowOnSendLeaveReturnTxtApproval(var LeaveReturnTxt: record "HRM-Return To Office(Leave)")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendLeaveReturnTxtApprovalCode(), LeaveReturnTxt);
    end;

    procedure RunWorkflowOnApproveLeaveReturnTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveLeaveReturnTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectLeaveReturnTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectLeaveReturnTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledLeaveReturnTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectLeaveReturnTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateLeaveReturnTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateLeaveReturnTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateLeaveReturnTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateLeaveReturnTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeLeaveReturnTxt(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalLeaveReturnTxt'));
    end;

    procedure SetStatusToPendingApprovalLeaveReturnTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        LeaveReturnTxt: Record "HRM-Return To Office(Leave)";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"HRM-Back To Office Form":
                begin
                    RecRef.SetTable(LeaveReturnTxt);
                    LeaveReturnTxt.Validate(Status, LeaveReturnTxt.Status::"Pending Approval");
                    LeaveReturnTxt.Modify();
                    Variant := LeaveReturnTxt;
                end;
        end;
    end;

    procedure ReleaseLeaveReturnTxtCode(): Code[128]
    begin
        exit(UpperCase('Release LeaveReturnTxt'));
    end;

    procedure ReleaseLeaveReturnTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        LeaveReturnTxt: Record "HRM-Return To Office(Leave)";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseLeaveReturnTxt(Variant);
                end;
            DATABASE::"HRM-Back To Office Form":
                begin
                    RecRef.SetTable(LeaveReturnTxt);
                    LeaveReturnTxt.Validate(Status, LeaveReturnTxt.Status::Approved);

                    LeaveReturnTxt.Modify();
                    Variant := LeaveReturnTxt;
                end;
        end;
    end;

    procedure ReOpenLeaveReturnTxtCode(): Code[128]
    begin
        exit(UpperCase('ReOpenLeaveReturnTxt'));
    end;

    procedure ReOpenLeaveReturnTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        LeaveReturnTxt: record "HRM-Return To Office(Leave)";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenLeaveReturnTxt(Variant);
                end;
            DATABASE::"HRM-Return To Office(Leave)":
                begin
                    RecRef.SetTable(LeaveReturnTxt);
                    LeaveReturnTxt.Validate(Status, LeaveReturnTxt.Status::Open);
                    LeaveReturnTxt.Modify();
                    Variant := LeaveReturnTxt;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddLeaveReturnTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLeaveReturnTxtApprovalCode(), Database::"HRM-Back To Office Form", SendLeaveReturnTxtReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveLeaveReturnTxtApprovalCode(), Database::"Approval Entry", AppReqLeaveReturnTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectLeaveReturnTxtApprovalCode(), Database::"Approval Entry", RejReqLeaveReturnTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateLeaveReturnTxtApprovalCode(), Database::"Approval Entry", DelReqLeaveReturnTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledLeaveReturnTxtApprovalCode(), Database::"Approval Entry", CanReqLeaveReturnTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelLeaveReturnTxtApprovalCode, Database::"HRM-Back To Office Form", UserCanReqLeaveReturnTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddLeaveReturnTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeLeaveReturnTxt(), 0, LeaveReturnTxtPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseLeaveReturnTxtCode(), 0, ReleaseLeaveReturnTxtTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenLeaveReturnTxtCode(), 0, ReOpenLeaveReturnTxtTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForLeaveReturnTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeLeaveReturnTxt():
                    begin
                        SetStatusToPendingApprovalLeaveReturnTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseLeaveReturnTxtCode():
                    begin
                        ReleaseLeaveReturnTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenLeaveReturnTxtCode():
                    begin
                        ReOpenLeaveReturnTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of LeaveReturnTxt Code
    procedure RunWorkflowOnCancelLeaveReturnTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelLeaveReturnTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelSendLeaveReturnTxtForApproval', '', false, false)]
    procedure RunWorkflowOnCancelLeaveReturnTxtApproval(VAR LeaveReturnTxt: record "HRM-Return To Office(Leave)")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelLeaveReturnTxtApprovalCode(), LeaveReturnTxt);

    end;
    //End Cancelling LeaveReturnTxt Code

    //Appraisal


    procedure RunWorkflowOnSendAppraisalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendAppraisalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::IntCodeunit2, 'OnSendAppraisalforApproval', '', false, false)]
    procedure RunWorkflowOnSendAppraisalApproval(var Appraisal: Record "Employee Self-Appraisal")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendAppraisalApprovalCode(), Appraisal);
    end;

    procedure RunWorkflowOnApproveAppraisalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveAppraisalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveAppraisalApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveAppraisalApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectAppraisalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectAppraisalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectAppraisalApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectAppraisalApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateAppraisalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateAppraisalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateAppraisalApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateAppraisalApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelAppraisalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelAppraisalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelAppraisalforApproval', '', false, false)]
    procedure RunWorkflowOnCancelAppraisalApproval(var Appraisal: Record "Employee Self-Appraisal")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelAppraisalApprovalCode(), Appraisal);
    end;

    procedure SetStatusToPendingApprovalCodeAppraisal(): Code[128]
    begin
        exit(UpperCase('Set Status To PendingApproval on Appraisal'));
    end;

    procedure SetStatusToPendingApprovalAppraisal(var Variant: Variant)
    var
        RecRef: RecordRef;
        Appraisal: Record "Employee Self-Appraisal";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(Appraisal);
                    Appraisal.Validate(Status, Appraisal.Status::"Pending Approval");
                    Appraisal.Modify();
                    Variant := Appraisal;
                end;
        end;
    end;

    procedure ReleaseAppraisalCode(): Code[128]
    begin
        exit(UpperCase('Release Appraisal Requisition'));
    end;

    procedure ReleaseAppraisal(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Appraisal: Record "Employee Self-Appraisal";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseAppraisal(Variant);
                end;
            DATABASE::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(Appraisal);
                    Appraisal.Validate(Status, Appraisal.Status::Released);
                    Appraisal.Modify();
                    Variant := Appraisal;
                end;
        end;
    end;

    procedure ReOpenAppraisalCode(): Code[128]
    begin
        exit(UpperCase('ReOpen Appraisal'));
    end;

    procedure ReOpenAppraisal(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Appraisal: Record "Employee Self-Appraisal";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenAppraisal(Variant);
                end;
            DATABASE::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(Appraisal);
                    Appraisal.Validate(Status, Appraisal.Status::open);
                    Appraisal.Modify();
                    Variant := Appraisal;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddAppraisalEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendAppraisalApprovalCode(), Database::"Employee Self-Appraisal", SendAppraisalReq, 0, false);

        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveAppraisalApprovalCode(), Database::"Approval Entry", AppReqAppraisal, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveAppraisalApprovalCode(), Database::"Approval Entry", ReOpenAppraisalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectAppraisalApprovalCode(), Database::"Approval Entry", RejReqAppraisal, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateAppraisalApprovalCode(), Database::"Approval Entry", DelReqAppraisal, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelAppraisalApprovalCode(), Database::"Approval Entry", CancelAppraisal, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddAppraisalRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeAppraisal(), 0, SendAppraisalForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseAppraisalCode(), 0, ReleaseAppraisalTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenAppraisalCode(), 0, ReOpenAppraisalTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForAppraisal(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeAppraisal():
                    begin
                        SetStatusToPendingApprovalAppraisal(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseAppraisalCode():
                    begin
                        ReleaseAppraisal(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenAppraisalCode():
                    begin
                        ReOpenAppraisal(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Workplan
    procedure RunWorkflowOnSendWorkplanApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendWorkplanApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::IntCodeunit2, 'OnSendWorkplanforApproval', '', false, false)]
    procedure RunWorkflowOnSendWorkplanApproval(var Workplan: Record "Self Appraisal")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendWorkplanApprovalCode(), Workplan);
    end;

    procedure RunWorkflowOnApproveWorkplanApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveWorkplanApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveWorkplanApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveWorkplanApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectWorkplanApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectWorkplanApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectWorkplanApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectWorkplanApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateWorkplanApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateWorkplanApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateWorkplanApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateWorkplanApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelWorkplanApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelWorkplanApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IntCodeunit2", 'OnCancelWorkplanforApproval', '', false, false)]
    procedure RunWorkflowOnCancelWorkplanApproval(var Workplan: Record "Self Appraisal")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelWorkplanApprovalCode(), Workplan);
    end;

    procedure SetStatusToPendingApprovalCodeWorkplan(): Code[128]
    begin
        exit(UpperCase('Set Status To PendingApproval on Workplan'));
    end;

    procedure SetStatusToPendingApprovalWorkplan(var Variant: Variant)
    var
        RecRef: RecordRef;
        Workplan: Record "Self Appraisal";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Self Appraisal":
                begin
                    RecRef.SetTable(Workplan);
                    Workplan.Validate(Status, Workplan.Status::"Pending Approval");
                    Workplan.Modify();
                    Variant := Workplan;
                end;
        end;
    end;

    procedure ReleaseWorkplanCode(): Code[128]
    begin
        exit(UpperCase('Release Workplan Requisition'));
    end;

    procedure ReleaseWorkplan(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Workplan: Record "Self Appraisal";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseWorkplan(Variant);
                end;
            DATABASE::"Self Appraisal":
                begin
                    RecRef.SetTable(Workplan);
                    Workplan.Validate(Status, Workplan.Status::Released);
                    Workplan.Modify();
                    Variant := Workplan;
                end;
        end;
    end;

    procedure ReOpenWorkplanCode(): Code[128]
    begin
        exit(UpperCase('ReOpen Workplan'));
    end;

    procedure ReOpenWorkplan(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Workplan: Record "Self Appraisal";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenWorkplan(Variant);
                end;
            DATABASE::"Self Appraisal":
                begin
                    RecRef.SetTable(Workplan);
                    Workplan.Validate(Status, Workplan.Status::open);
                    Workplan.Modify();
                    Variant := Workplan;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddWorkplanEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendWorkplanApprovalCode(), Database::"Self Appraisal", SendWorkplanReq, 0, false);

        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveWorkplanApprovalCode(), Database::"Approval Entry", AppReqWorkplan, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveWorkplanApprovalCode(), Database::"Approval Entry", ReOpenWorkplanTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectWorkplanApprovalCode(), Database::"Approval Entry", RejReqWorkplan, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateWorkplanApprovalCode(), Database::"Approval Entry", DelReqWorkplan, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelWorkplanApprovalCode(), Database::"Approval Entry", CancelWorkplan, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddWorkplanRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeWorkplan(), 0, SendWorkplanForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseWorkplanCode(), 0, ReleaseWorkplanTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenWorkplanCode(), 0, ReOpenWorkplanTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForWorkplan(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeWorkplan():
                    begin
                        SetStatusToPendingApprovalWorkplan(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseWorkplanCode():
                    begin
                        ReleaseWorkplan(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenWorkplanCode():
                    begin
                        ReOpenWorkplan(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;
}

