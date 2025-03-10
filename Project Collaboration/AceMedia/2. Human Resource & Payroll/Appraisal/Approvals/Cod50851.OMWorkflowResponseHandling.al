codeunit 52179367 "OM Workflow Response Handling"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowEventHandlingCust: Codeunit "OM Workflow Event Handling Ext";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode(), WorkflowEventHandlingCust.RunWorkflowOnSendAppraisalHeaderForApprovalCode());
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode(), WorkflowEventHandlingCust.RunWorkflowOnSendAppraisalHeaderForApprovalCode());
            WorkflowResponseHandling.CancelAllApprovalRequestsCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode(), WorkflowEventHandlingCust.RunWorkflowOnCancelAppraisalHeaderForApprovalCode());
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode(), WorkflowEventHandlingCust.RunWorkflowOnCancelAppraisalHeaderForApprovalCode());
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef;
    var Handled: Boolean)
    var
        AppraisalHeader: Record "Employee Self-Appraisal";
    begin
        case RecRef.Number of
            Database::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(AppraisalHeader);
                    AppraisalHeader.Status := AppraisalHeader.Status::Open;
                    AppraisalHeader.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        AppraisalHeader: Record "Employee Self-Appraisal";
    begin
        case RecRef.Number of
            Database::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(AppraisalHeader);
                    AppraisalHeader.Status := AppraisalHeader.Status::Released;
                    AppraisalHeader.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean; var Variant: Variant)
    var
        AppraisalHeader: Record "Employee Self-Appraisal";
    begin
        case RecRef.Number of
            Database::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(AppraisalHeader);
                    AppraisalHeader.Status := AppraisalHeader.Status::"Pending Approval";
                    AppraisalHeader.Modify();
                    IsHandled := true;
                end;
        end;
    end;
}
