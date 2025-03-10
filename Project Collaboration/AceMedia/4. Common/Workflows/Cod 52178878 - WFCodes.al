codeunit 52178878 "WF Codes"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";




        //PrlApproval REssponses

        //PrlApprovalS
        SendPrlApprovalReq: TextConst ENU = 'Approval Request for PrlApproval is requested', ENG = 'Approval Request for PrlApproval is requested';
        AppReqPrlApproval: TextConst ENU = 'Approval Request for PrlApproval is approved', ENG = 'Approval Request for PrlApproval is approved';
        RejReqPrlApproval: TextConst ENU = 'Approval Request for PrlApproval is rejected', ENG = 'Approval Request for PrlApproval is rejected';
        CanReqPrlApproval: TextConst ENU = 'Approval Request for PrlApproval is cancelled', ENG = 'Approval Request for PrlApproval is cancelled';
        UserCanReqPrlApproval: TextConst ENU = 'Approval Request for PrlApproval is cancelled by User', ENG = 'Approval Request for PrlApproval is cancelled by User';
        DelReqPrlApproval: TextConst ENU = 'Approval Request for PrlApproval is delegated', ENG = 'Approval Request for PrlApproval is delegated';
        PrlApprovalPendAppTxt: TextConst ENU = 'Status of PrlApproval changed to Pending approval', ENG = 'Status of PrlApproval changed to Pending approval';
        ReleasePrlApprovalTxt: TextConst ENU = 'Release PrlApproval', ENG = 'Release PrlApproval';
        ReOpenPrlApprovalTxt: TextConst ENU = 'ReOpen PrlApproval', ENG = 'ReOpen PrlApproval';
        //END PrlApprovalS
        //End PrlApproval Responses 

        //Interns Payroll
        //WCODE Code Unit

        //PrlIntern REssponses

        //PrlInternS
        SendPrlInternReq: TextConst ENU = 'Approval Request for PrlIntern is requested', ENG = 'Approval Request for PrlIntern is requested';
        AppReqPrlIntern: TextConst ENU = 'Approval Request for PrlIntern is approved', ENG = 'Approval Request for PrlIntern is approved';
        RejReqPrlIntern: TextConst ENU = 'Approval Request for PrlIntern is rejected', ENG = 'Approval Request for PrlIntern is rejected';
        CanReqPrlIntern: TextConst ENU = 'Approval Request for PrlIntern is cancelled', ENG = 'Approval Request for PrlIntern is cancelled';
        UserCanReqPrlIntern: TextConst ENU = 'Approval Request for PrlIntern is cancelled by User', ENG = 'Approval Request for PrlIntern is cancelled by User';
        DelReqPrlIntern: TextConst ENU = 'Approval Request for PrlIntern is delegated', ENG = 'Approval Request for PrlIntern is delegated';
        PrlInternPendAppTxt: TextConst ENU = 'Status of PrlIntern changed to Pending approval', ENG = 'Status of PrlIntern changed to Pending approval';
        ReleasePrlInternTxt: TextConst ENU = 'Release PrlIntern', ENG = 'Release PrlIntern';
        ReOpenPrlInternTxt: TextConst ENU = 'ReOpen PrlIntern', ENG = 'ReOpen PrlIntern';
    //END PrlInternS






    //Start PrlApproval Workflow
    procedure RunWorkflowOnSendPrlApprovalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendPrlApprovalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Init Codeunit", 'OnSendPrlApprovalforApproval', '', false, false)]
    procedure RunWorkflowOnSendPrlApprovalApproval(var PrlApproval: Record "Prl-Approval")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendPrlApprovalApprovalCode(), PrlApproval);
    end;

    procedure RunWorkflowOnApprovePrlApprovalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApprovePrlApprovalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApprovePrlApprovalApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApprovePrlApprovalApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectPrlApprovalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPrlApprovalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectPrlApprovalApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectPrlApprovalApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelledPrlApprovalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectPrlApprovalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelledPrlApprovalApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnCancelledPrlApprovalApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegatePrlApprovalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegatePrlApprovalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegatePrlApprovalApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegatePrlApprovalApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodePrlApproval(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalPrlApproval'));
    end;

    procedure SetStatusToPendingApprovalPrlApproval(var Variant: Variant)
    var
        RecRef: RecordRef;
        PrlApproval: Record "Prl-Approval";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Prl-Approval":
                begin
                    RecRef.SetTable(PrlApproval);
                    PrlApproval.Validate(Status, PrlApproval.Status::"Pending Approval");
                    PrlApproval.Modify();
                    Variant := PrlApproval;
                end;
        end;
    end;

    procedure ReleasePrlApprovalCode(): Code[128]
    begin
        exit(UpperCase('Release PrlApproval'));
    end;

    procedure ReleasePrlApproval(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PrlApproval: Record "Prl-Approval";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleasePrlApproval(Variant);
                end;
            DATABASE::"Prl-Approval":
                begin
                    RecRef.SetTable(PrlApproval);
                    PrlApproval.Validate(Status, PrlApproval.Status::Approved);
                    PrlApproval.Modify();
                    Variant := PrlApproval;
                end;
        end;
    end;

    procedure ReOpenPrlApprovalCode(): Code[128]
    begin
        exit(UpperCase('ReOpenPrlApproval'));
    end;

    procedure ReOpenPrlApproval(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        PrlApproval: Record "Prl-Approval";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenPrlApproval(Variant);
                end;
            DATABASE::"Prl-Approval":
                begin
                    RecRef.SetTable(PrlApproval);
                    PrlApproval.Validate(Status, PrlApproval.Status::Pending);
                    PrlApproval.Modify();
                    Variant := PrlApproval;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddPrlApprovalEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPrlApprovalApprovalCode(), Database::"Prl-Approval", SendPrlApprovalReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApprovePrlApprovalApprovalCode(), Database::"Approval Entry", AppReqPrlApproval, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectPrlApprovalApprovalCode(), Database::"Approval Entry", RejReqPrlApproval, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegatePrlApprovalApprovalCode(), Database::"Approval Entry", DelReqPrlApproval, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelledPrlApprovalApprovalCode(), Database::"Approval Entry", CanReqPrlApproval, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPrlApprovalApprovalCode, Database::"Prl-Approval", UserCanReqPrlApproval, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddPrlApprovalRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodePrlApproval(), 0, PrlApprovalPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleasePrlApprovalCode(), 0, ReleasePrlApprovalTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenPrlApprovalCode(), 0, ReOpenPrlApprovalTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForPrlApproval(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodePrlApproval():
                    begin
                        SetStatusToPendingApprovalPrlApproval(Variant);
                        ResponseExecuted := true;
                    end;
                ReleasePrlApprovalCode():
                    begin
                        ReleasePrlApproval(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenPrlApprovalCode():
                    begin
                        ReOpenPrlApproval(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;


    //Cancelling of PrlApproval Code
    procedure RunWorkflowOnCancelPrlApprovalApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelPrlApprovalApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Init Codeunit", 'OnCancelPrlApprovalforApproval', '', false, false)]
    procedure RunWorkflowOnCancelPrlApprovalApproval(VAR PrlApproval: Record "Prl-Approval")
    begin

        WFMngt.HandleEvent(RunWorkflowOnCancelPrlApprovalApprovalCode(), PrlApproval);

    end;
    //End Cancelling PrlApproval Code

    //End PrlApproval Workflow

}
