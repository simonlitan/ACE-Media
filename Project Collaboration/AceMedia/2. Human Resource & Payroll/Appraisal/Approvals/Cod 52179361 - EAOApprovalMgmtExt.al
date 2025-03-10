codeunit 52179361 "EAO Approval Mgmt. Ext"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowEventHandlingCut: Codeunit "EAO Workflow Event Handling";
        WorkflowManagement: Codeunit "Workflow Management";
        NoWorkFlowEnabledErr: TextConst ENU = 'No approval workflow for this record type is enabled.';

    procedure CheckEmployeeAppraisalObjectivesApprovalsWorkflowEnable(var EmployeeAppraisalObjectives: Record "Self Appraisal"): Boolean
    begin
        if not IsEmployeeAppraisalObjectivesDocApprovalsWorkflowEnable(EmployeeAppraisalObjectives) then Error(NoWorkFlowEnabledErr);
        exit(true);
    end;

    procedure IsEmployeeAppraisalObjectivesDocApprovalsWorkflowEnable(var EmployeeAppraisalObjectives: Record "Self Appraisal"): Boolean
    begin
        if EmployeeAppraisalObjectives.Status <> EmployeeAppraisalObjectives.Status::Open then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(EmployeeAppraisalObjectives, WorkflowEventHandlingCut.RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode()));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef;
    var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var
        EmployeeAppraisalObjectives: Record "Self Appraisal";
    begin
        case RecRef.Number of
            Database::"Self Appraisal":
                begin
                    RecRef.SetTable(EmployeeAppraisalObjectives);
                    ApprovalEntryArgument."Document No." := EmployeeAppraisalObjectives."No.";
                    // ApprovalEntryArgument.Amount := EmployeeAppraisalObjectives."Total Amount";
                end;
        end;
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelEmployeeAppraisalObjectivesForApproval(var EmployeeAppraisalObjectives: Record "Self Appraisal")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendEmployeeAppraisalObjectivesForApproval(var EmployeeAppraisalObjectives: Record "Self Appraisal")
    begin
    end;
}
