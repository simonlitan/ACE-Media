codeunit 52179366 "OM Workflow Event Handling Ext"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowManagement: Codeunit "Workflow Management";
        AppraisalHeaderApprovalRequestCancelEventDescTxt: TextConst ENU = 'Approval of a Appraisal Header document is canceled';
        AppraisalHeaderSendForApprovalEventDescTxt: TextConst ENU = 'Approval of a Appraisal Header document is requested';

    procedure RunWorkflowOnCancelAppraisalHeaderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelAppraisalHeaderForApproval'));
    end;

    procedure RunWorkflowOnSendAppraisalHeaderForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendAppraisalHeaderForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelAppraisalHeaderForApprovalCode():
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelAppraisalHeaderForApprovalCode(), RunWorkflowOnSendAppraisalHeaderForApprovalCode());
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendAppraisalHeaderForApprovalCode());
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendAppraisalHeaderForApprovalCode(), Database::"Employee Self-Appraisal", AppraisalHeaderSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelAppraisalHeaderForApprovalCode(), Database::"Employee Self-Appraisal", AppraisalHeaderApprovalRequestCancelEventDescTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"OM Approval Mgmt. Ext", 'OnCancelAppraisalHeaderForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelAppraisalHeaderForApproval(var AppraisalHeader: Record "Employee Self-Appraisal")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelAppraisalHeaderForApprovalCode(), AppraisalHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"OM Approval Mgmt. Ext", 'OnSendAppraisalHeaderForApproval', '', true, true)]
    local procedure RunWorkflowOnSendAppraisalHeaderForApproval(var AppraisalHeader: Record "Employee Self-Appraisal")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendAppraisalHeaderForApprovalCode(), AppraisalHeader);
    end;
}
