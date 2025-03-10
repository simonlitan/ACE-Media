codeunit 50101 "Work Flow Code"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";



        //PrlPendAppTxtS
        SendPrlPendAppTxtReq: TextConst ENU = 'Approval Request for PrlPendAppTxt is requested', ENG = 'Approval Request for PrlPendAppTxt is requested';
        AppReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is approved', ENG = 'Approval Request for PrlPendAppTxt is approved';
        RejReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is rejected', ENG = 'Approval Request for PrlPendAppTxt is rejected';
        CanReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is cancelled', ENG = 'Approval Request for PrlPendAppTxt is cancelled';
        UserCanReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is cancelled by User', ENG = 'Approval Request for PrlPendAppTxt is cancelled by User';
        DelReqPrlPendAppTxt: TextConst ENU = 'Approval Request for PrlPendAppTxt is delegated', ENG = 'Approval Request for PrlPendAppTxt is delegated';
        PrlPendAppTxtPendAppTxt: TextConst ENU = 'Status of PrlPendAppTxt changed to Pending approval', ENG = 'Status of PrlPendAppTxt changed to Pending approval';
        ReleasePrlPendAppTxtTxt: TextConst ENU = 'Release PrlPendAppTxt', ENG = 'Release PrlPendAppTxt';
        ReOpenPrlPendAppTxtTxt: TextConst ENU = 'ReOpen PrlPendAppTxt', ENG = 'ReOpen PrlPendAppTxt';
    //END PrlPendAppTxtS





    //Start PrlPendAppTxt Workflow
    procedure RunWorkflowOnSendPrlPendAppTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPrlPendAppTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::IntCodeunit, 'OnSendPrlPendAppTxtforApproval', '', false, false)]
    procedure RunWorkflowOnSendPrlPendAppTxtApproval(var PrlPendAppTxt: Record "Prl-Approval")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPrlPendAppTxtApprovalCode(), PrlPendAppTxt);
    end;

    procedure RunWorkflowOnApprovePrlPendAppTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePrlPendAppTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPrlPendAppTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPrlPendAppTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledPrlPendAppTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPrlPendAppTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledPrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePrlPendAppTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePrlPendAppTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePrlPendAppTxtApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePrlPendAppTxtApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePrlPendAppTxt(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalPrlPendAppTxt'));
    end;

    procedure SetStatusToPendingApprovalPrlPendAppTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        PrlPendAppTxt: Record "Prl-Approval";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Prl-Approval":
                begin
                    RecRef.SetTable(PrlPendAppTxt);
                    PrlPendAppTxt.Validate(Status, PrlPendAppTxt.Status::"Pending Approval");
                    PrlPendAppTxt.Modify();
                    Variant := PrlPendAppTxt;
                end;
        end;
    end;

    procedure ReleasePrlPendAppTxtCode(): Code[128]
    begin
        exit(UpperCase('Release PrlPendAppTxt'));
    end;

    procedure ReleasePrlPendAppTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PrlPendAppTxt: Record "Prl-Approval";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePrlPendAppTxt(Variant);
                end;
            DATABASE::"Prl-Approval":
                begin
                    RecRef.SetTable(PrlPendAppTxt);
                    PrlPendAppTxt.Validate(Status, PrlPendAppTxt.Status::Approved);
                    PrlPendAppTxt.ApprovePayroll();
                    PrlPendAppTxt.Modify();
                    Variant := PrlPendAppTxt;
                end;
        end;
    end;

    procedure ReOpenPrlPendAppTxtCode(): Code[128]
    begin
        exit(UpperCase('ReOpenPrlPendAppTxt'));
    end;

    procedure ReOpenPrlPendAppTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PrlPendAppTxt: Record "Prl-Approval";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPrlPendAppTxt(Variant);
                end;
            DATABASE::"Prl-Approval":
                begin
                    RecRef.SetTable(PrlPendAppTxt);
                    PrlPendAppTxt.Validate(Status, PrlPendAppTxt.Status::Pending);
                    PrlPendAppTxt.Modify();
                    Variant := PrlPendAppTxt;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPrlPendAppTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPrlPendAppTxtApprovalCode(), Database::"Prl-Approval", SendPrlPendAppTxtReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePrlPendAppTxtApprovalCode(), Database::"Approval Entry", AppReqPrlPendAppTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPrlPendAppTxtApprovalCode(), Database::"Approval Entry", RejReqPrlPendAppTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePrlPendAppTxtApprovalCode(), Database::"Approval Entry", DelReqPrlPendAppTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPrlPendAppTxtApprovalCode(), Database::"Approval Entry", CanReqPrlPendAppTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPrlPendAppTxtApprovalCode, Database::"Prl-Approval", UserCanReqPrlPendAppTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPrlPendAppTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePrlPendAppTxt(), 0, PrlPendAppTxtPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePrlPendAppTxtCode(), 0, ReleasePrlPendAppTxtTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPrlPendAppTxtCode(), 0, ReOpenPrlPendAppTxtTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPrlPendAppTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePrlPendAppTxt():
                    begin
                        SetStatusToPendingApprovalPrlPendAppTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePrlPendAppTxtCode():
                    begin
                        ReleasePrlPendAppTxt(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPrlPendAppTxtCode():
                    begin
                        ReOpenPrlPendAppTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of PrlPendAppTxt Code
    procedure RunWorkflowOnCancelPrlPendAppTxtApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelPrlPendAppTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::IntCodeunit, 'OnCancelPrlPendAppTxtForApproval', '', false, false)]
    procedure RunWorkflowOnCancelPrlPendAppTxtApproval(VAR PrlPendAppTxt: Record "Prl-Approval")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelPrlPendAppTxtApprovalCode(), PrlPendAppTxt);

    end;
    //End Cancelling PrlPendAppTxt Code

}
