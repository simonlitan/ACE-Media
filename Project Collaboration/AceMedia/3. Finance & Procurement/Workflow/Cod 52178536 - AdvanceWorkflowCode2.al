/// <summary>
/// Codeunit Advance Workflow Code2
/// {
///     trigger OnRun()
///     begin
/// 
///     end;
/// 
///     var
///         WFMngt: Codeunit  (ID 52178505).
/// </summary>
codeunit 52178536 "Advance Workflow Code2"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        //SalaryAdvance Start
        SendSalaryAdvanceReq: TextConst ENU = 'Approval Request for Salary Advance  Requisition is requested',
                                ENG = 'Approval Request for Salary Advance Requisition is requested';
        AppReqSalaryAdvance: TextConst ENU = 'Approval Request for Salary Advance Requisition is approved',
                                ENG = 'Approval Request for Salary Advance Requisition is approved';
        RejReqSalaryAdvance: TextConst ENU = 'Approval Request for Salary Advance Requisition is rejected',
                                ENG = 'Approval Request for Salary Advance Requisition is rejected';
        DelReqSalaryAdvance: TextConst ENU = 'Approval Request for Salary Advance Requisition is delegated',
                                ENG = 'Approval Request for Salary Advance Requisition is delegated';
        CancelSalaryAdvance: TextConst ENU = 'Approval Request for Salary Advance Requisition is Cancelled By User',
                                ENG = 'Approval Request for Salary Advance Requisition is Cancelled By User';
        SendSalaryAdvanceForPendAppTxt: TextConst ENU = 'Status of Salary Advance Requisitionchanged to Pending approval',
                                        ENG = 'Status of Salary Advance Requisition changed to Pending approval';
        ReleaseSalaryAdvanceTxt: TextConst ENU = 'Release Salary Advance Requisition ', ENG = 'Release Salary Advance Requisition ';
        ReOpenSalaryAdvanceTxt: TextConst ENU = 'ReOpen Salary Advance Requisition ', ENG = 'ReOpen Salary Advance Requisition ';


    //Salary Advance
    procedure RunWorkflowOnSendSalaryAdvanceApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendSalaryAdvanceApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Advance Init", 'OnSendSalaryAdvanceforApproval', '', false, false)]
    procedure RunWorkflowOnSendSalaryAdvanceApproval(var SalaryAdvance: Record "FIN-Staff Advance Header")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendSalaryAdvanceApprovalCode(), SalaryAdvance);
    end;

    procedure RunWorkflowOnApproveSalaryAdvanceApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveSalaryAdvanceApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveSalaryAdvanceApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveSalaryAdvanceApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectSalaryAdvanceApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectSalaryAdvanceApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectSalaryAdvanceApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectSalaryAdvanceApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateSalaryAdvanceApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateSalaryAdvanceApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateSalaryAdvanceApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateSalaryAdvanceApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelSalaryAdvanceApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelSalaryAdvanceApproval'))
    end;
    ///cancelling Salary Advance
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Advance Init", 'OnCancelSalaryAdvanceforApproval', '', false, false)]
    procedure RunWorkflowOnCancelSalaryAdvanceApproval(var SalaryAdvance: Record "FIN-Staff Advance Header")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelSalaryAdvanceApprovalCode(), SalaryAdvance);
    end;

    ///End cancelling Salary Advance
    /// 
    /// 
    procedure SetStatusToPendingApprovalCodeSalaryAdvance(): Code[128]
    begin
        exit(UpperCase('Set Status To PendingApproval on SalaryAdvance'));
    end;

    procedure SetStatusToPendingApprovalSalaryAdvance(var Variant: Variant)
    var
        RecRef: RecordRef;
        SalaryAdvance: Record "FIN-Staff Advance Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"FIN-Staff Advance Header":
                begin
                    RecRef.SetTable(SalaryAdvance);
                    SalaryAdvance.Validate(Status, SalaryAdvance.Status::"Pending Approval");
                    SalaryAdvance.CommitBudget();
                    SalaryAdvance.Modify();
                    Variant := SalaryAdvance;
                end;
        end;
    end;

    procedure ReleaseSalaryAdvanceCode(): Code[128]
    begin
        exit(UpperCase('Release SalaryAdvance Requisition'));
    end;

    procedure ReleaseSalaryAdvance(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        SalaryAdvance: Record "FIN-Staff Advance Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseSalaryAdvance(Variant);
                end;
            DATABASE::"FIN-Staff Advance Header":
                begin
                    RecRef.SetTable(SalaryAdvance);
                    SalaryAdvance.Validate(Status, SalaryAdvance.Status::Approved);
                    SalaryAdvance.Modify();
                    Variant := SalaryAdvance;
                end;
        end;
    end;

    procedure ReOpenSalaryAdvanceCode(): Code[128]
    begin
        exit(UpperCase('ReOpen SalaryAdvance'));
    end;

    procedure ReOpenSalaryAdvance(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        SalaryAdvance: Record "FIN-Staff Advance Header";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenSalaryAdvance(Variant);
                end;
            DATABASE::"FIN-Staff Advance Header":
                begin
                    RecRef.SetTable(SalaryAdvance);
                    SalaryAdvance.Validate(Status, SalaryAdvance.Status::Pending);
                    SalaryAdvance.ReverseBudget();
                    SalaryAdvance.Modify();
                    Variant := SalaryAdvance;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddLEAVEEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendSalaryAdvanceApprovalCode(), Database::"FIN-Staff Advance Header", SendSalaryAdvanceReq, 0, false);

        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveSalaryAdvanceApprovalCode(), Database::"Approval Entry", AppReqSalaryAdvance, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveSalaryAdvanceApprovalCode(), Database::"Approval Entry", ReOpenSalaryAdvanceTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectSalaryAdvanceApprovalCode(), Database::"Approval Entry", RejReqSalaryAdvance, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateSalaryAdvanceApprovalCode(), Database::"Approval Entry", DelReqSalaryAdvance, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelSalaryAdvanceApprovalCode(), Database::"Approval Entry", CancelSalaryAdvance, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelSalaryAdvanceApprovalCode(), Database::"FIN-Staff Advance Header", CancelSalaryAdvance, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddSalaryAdvanceRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeSalaryAdvance(), 0, SendSalaryAdvanceForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseSalaryAdvanceCode(), 0, ReleaseSalaryAdvanceTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenSalaryAdvanceCode(), 0, ReOpenSalaryAdvanceTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForSalaryAdvance(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeSalaryAdvance():
                    begin
                        SetStatusToPendingApprovalSalaryAdvance(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseSalaryAdvanceCode():
                    begin
                        ReleaseSalaryAdvance(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenSalaryAdvanceCode():
                    begin
                        ReOpenSalaryAdvance(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;




}
