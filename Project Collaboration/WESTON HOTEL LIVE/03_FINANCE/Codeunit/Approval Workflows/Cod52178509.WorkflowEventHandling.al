codeunit 52178509 WorkflowEventHandling
{

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        /*Casual Requisition*/
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendCasualRequisitionForApprovalCode, Database::"Casual Requisition", CasualRequisitionSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelCasualRequisitionApprovalCode, Database::"Casual Requisition", CasualRequisitionApprovalRequestCncelEventDescTxt, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    var
        WorkflowEvent: Codeunit "Workflow Event Handling";
    begin
        /* Casual Requisition */
        case EventFunctionName of
            RunWorkflowOnCancelCasualRequisitionApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelCasualRequisitionApprovalCode, RunWorkflowOnSendCasualRequisitionForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendCasualRequisitionForApprovalCode);
        end;
    end;

    /* Casual Requisition */
    procedure RunWorkflowOnSendCasualRequisitionForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendCasualRequisitionForApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Management", 'OnSendCasualRequisitionForApproval', '', true, true)]
    local procedure RunWorkflowOnSendCasualRequisitionForApproval(Var CasualRequisition: Record "Casual Requisition")
    begin

        WorkflowManagement.HandleEvent(RunWorkflowOnSendCasualRequisitionForApprovalCode, CasualRequisition)
    end;

    procedure RunWorkflowOnCancelCasualRequisitionApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelCasualRequisitionApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Management", 'OnCancelCasualRequisitionForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelCasualRequisitionApproval(Var CasualRequisition: Record "Casual Requisition")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelCasualRequisitionApprovalCode, CasualRequisition);
        CasualRequisition.Reset();
        CasualRequisition.SetRange("No.", CasualRequisition."No.");
        if CasualRequisition.FindFirst() then begin
            CasualRequisition.Status := CasualRequisition.Status::Open;
            CasualRequisition.Modify()
        end;
    end;

    /* ************************************************************************************************************************** */
    procedure RunWorkflowOnSendBContrForApprovalCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnSendBContrForApproval'));
    end;

    procedure RunWorkflowOnCancelBContrApprovalRequestCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnCancelBContrApprovalRequest'));
    end;

    procedure RunWorkflowOnAfterReleaseBContrCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBContr'));
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        /* Casual Requisition */
        CasualRequisitionSendForApprovalEventDescTxt: TextConst ENU = 'Approval of a Casual Requisition Document is Requested';
        CasualRequisitionApprovalRequestCncelEventDescTxt: TextConst ENU = 'Approval of a Casual Requisition Document is Canceled';


}
