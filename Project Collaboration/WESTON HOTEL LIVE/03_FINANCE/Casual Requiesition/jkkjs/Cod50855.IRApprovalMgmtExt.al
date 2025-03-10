codeunit 52178508 "IR Approval Mgmt. Ext"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowEventHandlingCut: Codeunit "IR Workflow Event Handling Ext";
        WorkflowManagement: Codeunit "Workflow Management";
        NoWorkFlowEnabledErr: TextConst ENU = 'No approval workflow for this record type is enabled.';

    procedure CheckCasualRequisitionApprovalsWorkflowEnable(var CasualRequisition: Record "Casual Requisition"): Boolean
    begin
        if not IsCasualRequisitionDocApprovalsWorkflowEnable(CasualRequisition) then Error(NoWorkFlowEnabledErr);
        exit(true);
    end;

    procedure IsCasualRequisitionDocApprovalsWorkflowEnable(var CasualRequisition: Record "Casual Requisition"): Boolean
    begin
        if CasualRequisition.Status <> CasualRequisition.Status::Open then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(CasualRequisition, WorkflowEventHandlingCut.RunWorkflowOnSendCasualRequisitionForApprovalCode()));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef;
    var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        case RecRef.Number of
            Database::"Casual Requisition":
                begin
                    RecRef.SetTable(CasualRequisition);
                    ApprovalEntryArgument."Document No." := CasualRequisition."No.";
                    ApprovalEntryArgument.Amount := CasualRequisition."Total Amount";
                end;
        end;
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelCasualRequisitionForApproval(var CasualRequisition: Record "Casual Requisition")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendCasualRequisitionForApproval(var CasualRequisition: Record "Casual Requisition")
    begin
    end;
}
