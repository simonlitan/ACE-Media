codeunit 52179363 "EAO Workflow Response Handling"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowEventHandlingCust: Codeunit "EAO Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode(), WorkflowEventHandlingCust.RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode());
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode(), WorkflowEventHandlingCust.RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode());
            WorkflowResponseHandling.CancelAllApprovalRequestsCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode(), WorkflowEventHandlingCust.RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode());
            WorkflowResponseHandling.OpenDocumentCode():
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode(), WorkflowEventHandlingCust.RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode());
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef;
    var Handled: Boolean)
    var
        EmployeeAppraisalObjectives: Record "Self Appraisal";
    begin
        case RecRef.Number of
            Database::"Self Appraisal":
                begin
                    RecRef.SetTable(EmployeeAppraisalObjectives);
                    EmployeeAppraisalObjectives.Status := EmployeeAppraisalObjectives.Status::Open;
                    EmployeeAppraisalObjectives.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef;
    var Handled: Boolean)
    var
        EmployeeAppraisalObjectives: Record "Self Appraisal";
    begin
        case RecRef.Number of
            Database::"Self Appraisal":
                begin
                    RecRef.SetTable(EmployeeAppraisalObjectives);
                    EmployeeAppraisalObjectives.Status := EmployeeAppraisalObjectives.Status::Released;
                    // EmployeeAppraisalObjectives."Review Status" := EmployeeAppraisalObjectives."Review Status"::Appraiser;

                    // EmployeeAppraisalObjectives.Modify();
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean; var Variant: Variant)
    var
        EmployeeAppraisalObjectives: Record "Self Appraisal";
    begin
        case RecRef.Number of
            Database::"Self Appraisal":
                begin
                    RecRef.SetTable(EmployeeAppraisalObjectives);
                    EmployeeAppraisalObjectives.Status := EmployeeAppraisalObjectives.Status::"Pending Approval";
                    //EmployeeAppraisalObjectives.Modify();
                    IsHandled := true;
                end;
        end;
    end;
}
