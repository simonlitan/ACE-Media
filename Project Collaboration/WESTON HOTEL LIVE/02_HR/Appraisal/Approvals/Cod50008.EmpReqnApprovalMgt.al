codeunit 50008 EmpReqnApprovalmgt
{
    /* Emp Requisition */
    [IntegrationEvent(false, false)]

    procedure OnSendEmpRequisitionForApproval(var EmpRequisition: Record "HRM-Employee Requisitions")
    begin


    end;

    [IntegrationEvent(false, false)]

    procedure OnCancelEmpRequisitionForApproval(var EmpRequisition: Record "HRM-Employee Requisitions")
    begin

    end;

    procedure CheckEmpRequisitionApprovalsWorkflowEnable(var EmpRequisition: Record "HRM-Employee Requisitions"): Boolean
    begin
        IF NOT IsEmpRequisitionApplicationApprovalsWorkflowEnable(EmpRequisition) then
            Error(NoWorkflowEnableErr);
        exit(true)
    end;

    procedure IsEmpRequisitionApplicationApprovalsWorkflowEnable(var EmpRequisition: Record "HRM-Employee Requisitions"): Boolean

    begin
        IF EmpRequisition."Status" <> EmpRequisition."Status"::pending then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(EmpRequisition, WorkflowEventHandlingCust.RunWorkflowOnSendEmpRequisitionforApprovalCode));
    end;

    /* ****************************************************************************************************************************************** */

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        EmpRequisition: Record "HRM-Employee Requisitions";
    begin

        case RecRef.Number of
            /* Employee Requisition */
            database ::"HRM-Employee Requisitions":
                begin
                    RecRef.SetTable(EmpRequisition);
                    ApprovalEntryArgument."Document No." := EmpRequisition."Requisition No.";
                    //EmpRequisition.CalcFields("Total Amount");
                    //ApprovalEntryArgument.Amount := CasualRequisition."Total Amount";
                end;
        end;
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        AM: Codeunit "Approvals Mgmt.";
        WorkflowEventHandlingCust: Codeunit 50200;
        NoWorkflowEnableErr: TextConst ENU = 'No approval worklow for this record type is enabled.';
        NothingToApproveErr: TextConst ENU = 'Lines Must Contain Record(s)';
}

