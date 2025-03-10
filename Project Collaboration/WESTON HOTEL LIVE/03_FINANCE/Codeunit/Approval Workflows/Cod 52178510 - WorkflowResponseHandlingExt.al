codeunit 52178510 "Workflow Response Handling Ext"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        case RecRef.Number of
            /* Casual Requisition */
            Database::"Casual Requisition":
                begin
                    RecRef.SetTable(CasualRequisition);
                    CasualRequisition.Status := CasualRequisition.Status::Open;

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
            /* Casual Requisition */
            Database::"Casual Requisition":
                begin
                    RecRef.setTable(CasualRequisition);
                    CasualRequisition.Status := CasualRequisition.Status::Approved;
                    //CasualRequisition.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', true, true)]

    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean)
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        case RecRef.Number of
            /* Casual Requisition */
            Database::"Casual Requisition":
                begin
                    RecRef.setTable(CasualRequisition);
                    CasualRequisition.Status := CasualRequisition.Status::"Pending Approval";
                    CasualRequisition.Modify();
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]

    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])

    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit WorkFlowEventHandling;
    begin
        /* Casual Requisition */
        CASE ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandling.RunWorkflowOnSendCasualRequisitionForApprovalCode);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandling.RunWorkflowOnSendCasualRequisitionForApprovalCode);
            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandling.RunWorkflowOnCancelCasualRequisitionApprovalCode);
            WorkflowResponseHandling.OpenDocumentCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelCasualRequisitionApprovalCode);
        END;
    end;

}
