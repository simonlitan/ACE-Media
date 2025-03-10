codeunit 52178504 "Approval Management"
{
    /* Casual Requisition */
    [IntegrationEvent(false, false)]

    procedure OnSendCasualRequisitionForApproval(var CasualRequisition: Record "Casual Requisition")
    begin


    end;

    [IntegrationEvent(false, false)]

    procedure OnCancelCasualRequisitionForApproval(var CasualRequisition: Record "Casual Requisition")
    begin

    end;

    procedure CheckCasualRequisitionApprovalsWorkflowEnable(var CasualRequisition: Record "Casual Requisition"): Boolean
    begin
        IF NOT IsCasualRequisitionApplicationApprovalsWorkflowEnable(CasualRequisition) then
            Error(NoWorkflowEnableErr);
        exit(true)
    end;

    procedure IsCasualRequisitionApplicationApprovalsWorkflowEnable(var CasualRequisition: Record "Casual Requisition"): Boolean

    begin
        IF CasualRequisition."Status" <> CasualRequisition."Status"::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(CasualRequisition, WorkflowEventHandlingCust.RunWorkflowOnSendCasualRequisitionforApprovalCode));
    end;

    /* ****************************************************************************************************************************************** */

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        CasualRequisition: Record "Casual Requisition";
    begin

        case RecRef.Number of
            /* Casual Requisition */
            Database::"Casual Requisition":
                begin
                    RecRef.SetTable(CasualRequisition);
                    ApprovalEntryArgument."Document No." := CasualRequisition."No.";
                    CasualRequisition.CalcFields("Total Amount");
                    ApprovalEntryArgument.Amount := CasualRequisition."Total Amount";
                end;
        end;
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        AM: Codeunit "Approvals Mgmt.";
        WorkflowEventHandlingCust: Codeunit WorkFlowEventHandling;
        NoWorkflowEnableErr: TextConst ENU = 'No approval worklow for this record type is enabled.';
        NothingToApproveErr: TextConst ENU = 'Lines Must Contain Record(s)';
}
