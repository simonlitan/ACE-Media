codeunit 52178519 "Advance Init"

{
    trigger OnRun()
    begin

    end;

    //Leave
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendSalaryAdvanceforApproval(VAR SalaryAdvance: Record "FIN-Staff Advance Header");
    begin
    end;

    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSalaryAdvanceforApproval(VAR SalaryAdvance: Record "FIN-Staff Advance Header");
    begin
    end;


    procedure IsSalaryAdvanceEnabled(var SalaryAdvance: Record "FIN-Staff Advance Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Advance Workflow Code2";
    begin
        exit(WFMngt.CanExecuteWorkflow(SalaryAdvance, WFCode.RunWorkflowOnSendSalaryAdvanceApprovalCode()))
    end;

    local procedure CheckWorkflowEnabled(): Boolean
    var
        SalaryAdvance: Record "FIN-Staff Advance Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsSalaryAdvanceEnabled(SalaryAdvance) then
            Error(NoWorkflowEnb);
    end;


    //Added modifications
    local procedure ShowSalaryAdvanceApprovalStatus(SalaryAdvance: Record "FIN-Staff Advance Header")
    begin
        SalaryAdvance.Find;

        case SalaryAdvance.Status of
            SalaryAdvance.Status::Approved:
                Message(DocStatusChangedMsg, '', SalaryAdvance."No.", SalaryAdvance.Status);
            SalaryAdvance.Status::"Pending Approval":
                if HasOpenOrPendingApprovalEntries(SalaryAdvance.RecordId) then
                    Message(PendingApprovalMsg);

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



    ///////////////////////**************************POPULATE APPROVAL ENTRY AGRUMENT*****************////////////////////
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
        WorkflowStepInstance: Record "Workflow Step Instance")
    var
        SalaryAdvance: Record "FIN-Staff Advance Header";



    begin
        case
            RecRef.Number of
            Database::"FIN-Staff Advance Header":
                begin
                    RecRef.SetTable(SalaryAdvance);
                    ApprovalEntryArgument."Document No." := SalaryAdvance."No.";

                end;



        end;
    end;


    var
        myInt: Integer;
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been sent.';
}

