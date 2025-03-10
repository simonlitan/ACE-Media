codeunit 50100 IntCodeunit
{
    trigger OnRun()
    begin

    end;


    //"Prl-Approval"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPrlPendAppTxtforApproval(VAR PrlPendAppTxt: Record "Prl-Approval");
    begin
    end;

    procedure IsPrlPendAppTxtEnabled(var PrlPendAppTxt: Record "Prl-Approval"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code";

    begin
        exit(WFMngt.CanExecuteWorkflow(PrlPendAppTxt, WFCode.RunWorkflowOnSendPrlPendAppTxtApprovalCode()))
    end;

    local procedure CheckPrlPendAppTxtWorkflowEnabled(): Boolean
    var
        PrlPendAppTxt: Record "Prl-Approval";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsPrlPendAppTxtEnabled(PrlPendAppTxt) then
            Error(NoWorkflowEnb);
    end;
    //end "Prl-Approval"

    //*************************Cancelling Approvals*********************//////

    //Cancel "Prl-Approval"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelPrlPendAppTxtforApproval(VAR PrlPendAppTxt: Record "Prl-Approval");
    begin
    end;
    //End Cancel "Prl-Approval"





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


    ///////////////////////**************************POPULATE APPROVAL ENTRY AGRUMENT*****************////////////////////
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var

        PrlApproval: Record "Prl-Approval";
    begin
        case
            RecRef.Number of
            Database::"Prl-Approval":
                begin
                    PrlApproval.CalcFields("Gross Amount");
                    RecRef.SetTable(PrlApproval);
                    ApprovalEntryArgument."Document No." := format(PrlApproval."Payroll Period");
                    ApprovalEntryArgument.Amount := PrlApproval."Gross Amount";
                    ApprovalEntryArgument."Amount (LCY)" := PrlApproval."Gross Amount";
                end;
        end;
    end;



    var
        myInt: Integer;
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been sent.';
}
