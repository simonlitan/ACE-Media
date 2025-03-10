/* codeunit 52178881 "TestWorkFlowCode"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";



        //DisputeTxtS
        SendDisputeReq: TextConst ENU = 'Approval Request for Dispute is requested', ENG = 'Approval Request for Dispute is requested';
        AppReqDispute: TextConst ENU = 'Approval Request for Dispute is approved', ENG = 'Approval Request for Dispute is approved';
        RejReqDispute: TextConst ENU = 'Approval Request for Dispute is rejected', ENG = 'Approval Request for Dispute is rejected';
        CanReqDispute: TextConst ENU = 'Approval Request for Dispute is cancelled', ENG = 'Approval Request for Dispute is cancelled';
        UserCanReqDispute: TextConst ENU = 'Approval Request for Dispute is cancelled by User', ENG = 'Approval Request for Dispute is cancelled by User';
        DelReqDispute: TextConst ENU = 'Approval Request for Dispute is delegated', ENG = 'Approval Request for Dispute is delegated';
        DisputePendApp: TextConst ENU = 'Status of Dispute changed to Pending approval', ENG = 'Status of Dispute changed to Pending approval';
        ReleaseDisputeTxt: TextConst ENU = 'Release Dispute', ENG = 'Release Dispute';
        ReOpenDispute: TextConst ENU = 'ReOpen Dispute', ENG = 'ReOpen Dispute';
    //END DisputeTxtS





    //Start DisputeTxt Workflow
    procedure RunWorkflowOnSendDisputeApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendDisputeApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TestIntCodeunit", 'OnSendDisputeforApproval', '', false, false)]
    procedure RunWorkflowOnSendDisputeApproval(var Dispute: Record "Alternative Dispute Resolution")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendDisputeApprovalCode(), Dispute);
    end;

    procedure RunWorkflowOnApproveDisputeApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveDisputeApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveDisputeApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveDisputeApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectDisputeApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectDisputeApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectDisputeApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectDisputeApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledDisputeApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectDisputeApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledDisputeApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledDisputeApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateDisputeApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateDisputeApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateDisputeApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateDisputeApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeDispute(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalDispute'));
    end;



    procedure ReleaseDisputeCode(): Code[128]
    begin
        exit(UpperCase('Release Dispute'));
    end;

    procedure ReleaseDispute(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Dispute: Record "Alternative Dispute Resolution";
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
            DATABASE::"Alternative Dispute Resolution":
                begin
                    RecRef.SetTable(Dispute);
                    Dispute.Validate(Status, Dispute.Status::Approved);

                    Dispute.Modify();
                    Variant := Dispute;
                end;
        end;
    end;

    procedure ReOpenDisputeCode(): Code[128]
    begin
        exit(UpperCase('ReOpenDispute'));
    end;

    procedure ReOpenDisputeTxt(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Dispute: Record "Alternative Dispute Resolution";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenDisputeTxt(Variant);
                end;
            DATABASE::"Alternative Dispute Resolution":
                begin
                    RecRef.SetTable(Dispute);
                    Dispute.Validate(Status, Dispute.Status::"Under Negotiation");
                    Dispute.Modify();
                    Variant := Dispute;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddDisputeTxtEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendDisputeApprovalCode(), Database::"Alternative Dispute Resolution", SendDisputeReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveDisputeApprovalCode(), Database::"Approval Entry", AppReqDispute, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectDisputeApprovalCode(), Database::"Approval Entry", RejReqDispute, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateDisputeApprovalCode(), Database::"Approval Entry", DelReqDispute, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledDisputeApprovalCode(), Database::"Approval Entry", CanReqDispute, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDisputeApprovalCode, Database::"Alternative Dispute Resolution", UserCanReqDispute, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddDisputeTxtRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeDispute(), 0, DisputePendApp, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseDisputeCode(), 0, ReleaseDisputeTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenDisputeCode(), 0, ReOpenDispute, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForDisputeTxt(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeDispute():
                    begin
                        SetStatusToPendingApprovalDispute(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseDisputeCode():
                    begin
                        ReleaseDispute(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenDisputeCode():
                    begin
                        ReOpenDisputeTxt(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;

    //Cancelling of DisputeTxt Code
    procedure RunWorkflowOnCancelDisputeApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelDisputeTxtApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TestIntCodeunit", 'OnCancelSendDisputeForApproval', '', false, false)]
    procedure RunWorkflowOnCancelDisputeApproval(VAR Dispute: Record "Alternative Dispute Resolution")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelDisputeApprovalCode(), Dispute);

    end;
    //End Cancelling DisputeTxt Code

    procedure SetStatusToPendingApprovalDispute(var Variant: Variant)
    var
        RecRef: RecordRef;
        Dispute: Record "Alternative Dispute Resolution";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Alternative Dispute Resolution":
                begin
                    RecRef.SetTable(Dispute);
                    Dispute.Validate(Status, Dispute.Status::"Pending Approval");
                    Dispute.Modify();
                    Variant := Dispute;
                end;
        end;
    end;

}

 */