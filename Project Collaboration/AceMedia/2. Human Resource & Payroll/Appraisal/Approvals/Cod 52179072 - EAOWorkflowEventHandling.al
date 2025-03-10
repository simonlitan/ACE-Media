codeunit 52179072 "EAO Workflow Event Handling"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowManagement: Codeunit "Workflow Management";
        EmployeeAppraisalObjectivesApprovalRequestCancelEventDescTxt: TextConst ENU = 'Approval of a Employee Self Appraisal document is canceled';
        EmployeeAppraisalObjectivesSendForApprovalEventDescTxt: TextConst ENU = 'Approval of a Employee Self Appraisal document is requested';


    procedure RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelEmployeeAppraisalObjectivesForApproval'));
    end;

    procedure RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendEmployeeAppraisalObjectivesForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode():
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode(), RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode());
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode(), RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode());
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode(), Database::"Self Appraisal", EmployeeAppraisalObjectivesSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode(), Database::"Self Appraisal", EmployeeAppraisalObjectivesApprovalRequestCancelEventDescTxt, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EAO Approval Mgmt. Ext", 'OnCancelEmployeeAppraisalObjectivesForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelEmployeeAppraisalObjectivesForApproval(var EmployeeAppraisalObjectives: Record "Self Appraisal")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode(), EmployeeAppraisalObjectives);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EAO Approval Mgmt. Ext", 'OnSendEmployeeAppraisalObjectivesForApproval', '', true, true)]
    local procedure RunWorkflowOnSendEmployeeAppraisalObjectivesForApproval(var EmployeeAppraisalObjectives: Record "Self Appraisal")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode(), EmployeeAppraisalObjectives);
    end;
}
