codeunit 52178885 WorkflowResponseHandlingExt
{

    var

        IncomingMail: Record "Incoming Mail";

        ICTSupport: Record "ICT Support Desk";



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    begin
        case RecRef.Number of

            /* Incoming Mail */
            Database::"Incoming Mail":
                begin
                    RecRef.SetTable(IncomingMail);
                    IncomingMail.Status := IncomingMail.Status::Open;
                    IncomingMail.Modify;
                    Handled := true;
                end;



        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    begin
        case RecRef.Number of

            /* Incoming Mail */
            Database::"Incoming Mail":
                begin
                    RecRef.setTable(IncomingMail);
                    IncomingMail.Status := IncomingMail.Status::Approved;
                    IncomingMail.Modify();
                    Handled := true;
                end;



            /* ICT Support Desk */
            Database::"ICT Support Desk":
                begin
                    RecRef.setTable(ICTSupport);
                    ICTSupport.Status := ICTSupport.Status::Approved;
                    ICTSupport.Modify();
                    Handled := true;
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    begin
        case RecRef.Number of

            /* Incoming Mail */
            Database::"Incoming Mail":
                begin
                    RecRef.setTable(IncomingMail);
                    IncomingMail.Status := IncomingMail.Status::Pending;
                    IncomingMail.Modify();
                    IsHandled := true;
                end;


            /* ICT Support Desk */
            Database::"ICT Support Desk":
                begin
                    RecRef.setTable(ICTSupport);
                    ICTSupport.Status := ICTSupport.Status::"Pending Approval";
                    ICTSupport.Modify();
                    IsHandled := true;
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkFlowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkFlowEventHandling: Codeunit WorkFlowEventHandling;
    begin



        /* Incoming Mail */
        CASE ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandling.RunWorkflowOnSendIncomingMailForApprovalCode);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandling.RunWorkflowOnSendIncomingMailForApprovalCode);
            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandling.RunWorkflowOnCancelIncomingMailApprovalCode);
            WorkflowResponseHandling.OpenDocumentCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelIncomingMailApprovalCode);
        END;


        /* ICT Support Desk */
        CASE ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandling.RunWorkflowOnSendICTSupportForApprovalCode);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandling.RunWorkflowOnSendICTSupportForApprovalCode);
            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandling.RunWorkflowOnCancelICTSupportCode);
            WorkflowResponseHandling.OpenDocumentCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelICTSupportCode);
        END;

    end;
}
