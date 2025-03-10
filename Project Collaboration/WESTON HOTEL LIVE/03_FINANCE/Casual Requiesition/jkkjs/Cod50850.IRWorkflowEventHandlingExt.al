codeunit 52178505 "IR Workflow Event Handling Ext"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowManagement: Codeunit "Workflow Management";
        CasualRequisitionApprovalRequestCancelEventDescTxt: TextConst ENU = 'Approval of a Casual Requisition document is canceled';
        CasualRequisitionSendForApprovalEventDescTxt: TextConst ENU = 'Approval of a Casual Requisition document is requested';

    procedure RunWorkflowOnCancelCasualRequisitionForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelCasualRequisitionForApproval'));
    end;

    procedure RunWorkflowOnSendCasualRequisitionForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendCasualRequisitionForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelCasualRequisitionForApprovalCode():
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelCasualRequisitionForApprovalCode(), RunWorkflowOnSendCasualRequisitionForApprovalCode());
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendCasualRequisitionForApprovalCode());
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendCasualRequisitionForApprovalCode(), Database::"Casual Requisition", CasualRequisitionSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelCasualRequisitionForApprovalCode(), Database::"Casual Requisition", CasualRequisitionApprovalRequestCancelEventDescTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IR Approval Mgmt. Ext", 'OnCancelCasualRequisitionForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelCasualRequisitionForApproval(var CasualRequisition: Record "Casual Requisition")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelCasualRequisitionForApprovalCode(), CasualRequisition);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"IR Approval Mgmt. Ext", 'OnSendCasualRequisitionForApproval', '', true, true)]
    local procedure RunWorkflowOnSendCasualRequisitionForApproval(var CasualRequisition: Record "Casual Requisition")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendCasualRequisitionForApprovalCode(), CasualRequisition);
    end;
}
