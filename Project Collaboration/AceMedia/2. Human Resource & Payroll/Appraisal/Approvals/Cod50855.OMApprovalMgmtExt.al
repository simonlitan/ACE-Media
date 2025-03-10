codeunit 52179369 "OM Approval Mgmt. Ext"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowEventHandlingCut: Codeunit "OM Workflow Event Handling Ext";
        WorkflowManagement: Codeunit "Workflow Management";
        NoWorkFlowEnabledErr: TextConst ENU = 'No approval workflow for this record type is enabled.';

    procedure CheckAppraisalHeaderApprovalsWorkflowEnable(var AppraisalHeader: Record "Employee Self-Appraisal"): Boolean
    begin
        if not IsAppraisalHeaderDocApprovalsWorkflowEnable(AppraisalHeader) then Error(NoWorkFlowEnabledErr);
        exit(true);
    end;

    procedure IsAppraisalHeaderDocApprovalsWorkflowEnable(var AppraisalHeader: Record "Employee Self-Appraisal"): Boolean
    begin
        if AppraisalHeader.Status <> AppraisalHeader.Status::Open then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(AppraisalHeader, WorkflowEventHandlingCut.RunWorkflowOnSendAppraisalHeaderForApprovalCode()));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef;
    var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var
        AppraisalHeader: Record "Employee Self-Appraisal";
    begin
        case RecRef.Number of
            Database::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(AppraisalHeader);
                    ApprovalEntryArgument."Document No." := AppraisalHeader."No.";
                    //ApprovalEntryArgument.Amount := AppraisalHeader."Total Amount";
                end;
        end;
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelAppraisalHeaderForApproval(var AppraisalHeader: Record "Employee Self-Appraisal")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendAppraisalHeaderForApproval(var AppraisalHeader: Record "Employee Self-Appraisal")
    begin
    end;
}
