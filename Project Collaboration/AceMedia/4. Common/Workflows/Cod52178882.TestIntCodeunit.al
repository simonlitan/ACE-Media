/*  codeunit 52178882 "TestIntCodeunit"
{
    trigger OnRun()
    begin

    end;


    //"Alternative Dispute Resolution"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendDisputeforApproval(VAR Dispute: Record "Alternative Dispute Resolution");
    begin
    end;

    procedure IsDisputeEnabled(var Dispute: Record "Alternative Dispute Resolution"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "TestWorkFlowCode";

    begin
        exit(WFMngt.CanExecuteWorkflow(Dispute, WFCode.RunWorkflowOnSendDisputeApprovalCode()))
    end;

    local procedure CheckBackTxtWorkflowEnabled(): Boolean
    var
        Dispute: Record "Alternative Dispute Resolution";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsDisputeEnabled(Dispute) then
            Error(NoWorkflowEnb);
    end;
    //end "Alternative Dispute Resolution"

    //*************************Cancelling Approvals*********************

    //Cancel"Alternative Dispute Resolution"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendDisputeforApproval(VAR Dispute: Record "Alternative Dispute Resolution");
    begin
    end;
    //End Cancel "Alternative Dispute Resolution"


    

    ///////////////////////**************************POPULATE APPROVAL ENTRY AGRUMENT*****************
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var

        Adr: Record "Alternative Dispute Resolution";
    begin
        case
            RecRef.Number of
            Database::"Alternative Dispute Resolution":
                begin
                                        RecRef.SetTable(Adr);
                    ApprovalEntryArgument."Document No." := format(Adr."Case No");
                    
                end;
        end;
    end;

procedure HasOpenOrPendingApprovalEntries(RecordID: RecordID): Boolean
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetRange("Table ID", RecordID.TableNo);
        ApprovalEntry.SetRange("Record ID to Approve", RecordID);
        ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Open, ApprovalEntry.Status::Created);
        ApprovalEntry.SetRange("Related to Change", false);
        exit(not ApprovalEntry.IsEmpty);
    end;


    var
        myInt: Integer;
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been SendBackOfficet.';
}
  */