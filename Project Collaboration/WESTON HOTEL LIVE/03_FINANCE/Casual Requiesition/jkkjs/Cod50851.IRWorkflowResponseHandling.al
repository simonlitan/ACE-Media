codeunit 52178506 "IR Workflow Response Handling"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowEventHandlingCust: Codeunit "IR Workflow Event Handling Ext";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode(), WorkflowEventHandlingCust.RunWorkflowOnSendCasualRequisitionForApprovalCode());
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode(), WorkflowEventHandlingCust.RunWorkflowOnSendCasualRequisitionForApprovalCode());
            WorkflowResponseHandling.CancelAllApprovalRequestsCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode(), WorkflowEventHandlingCust.RunWorkflowOnCancelCasualRequisitionForApprovalCode());
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode(), WorkflowEventHandlingCust.RunWorkflowOnCancelCasualRequisitionForApprovalCode());
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef;
    var Handled: Boolean)
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        case RecRef.Number of
            Database::"Casual Requisition":
                begin
                    RecRef.SetTable(CasualRequisition);
                    CasualRequisition.Status := CasualRequisition.Status::Open;
                    CasualRequisition.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        case RecRef.Number of
            Database::"Casual Requisition":
                begin
                    RecRef.SetTable(CasualRequisition);
                    CasualRequisition.Status := CasualRequisition.Status::Approved;
                    CasualRequisition.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean; var Variant: Variant)
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        case RecRef.Number of
            Database::"Casual Requisition":
                begin
                    RecRef.SetTable(CasualRequisition);
                    CasualRequisition.Status := CasualRequisition.Status::"Pending Approval";
                    CasualRequisition.Modify();
                    IsHandled := true;
                end;
        end;
    end;
}
