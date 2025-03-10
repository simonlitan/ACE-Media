codeunit 52179082 "IntCodeunit"
{
    trigger OnRun()
    begin

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

       
        BackOffice: record "HRM-Back To Office Form";
    begin
        
        case
            RecRef.Number of
            Database::"HRM-Back To Office Form":
                begin
                    //PrlApproval.CalcFields("Gross Amount");
                    RecRef.SetTable(BackOffice);
                    ApprovalEntryArgument."Document No." := BackOffice."Document No";
                    // ApprovalEntryArgument.Amount := PrlApproval."Gross Amount";
                    //ApprovalEntryArgument."Amount (LCY)" := PrlApproval."Gross Amount";
                end;
        end;
    end;


    /////////////////////////////
    //"HRM-Back To Office Form"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendBackOfficeTxtforApproval(VAR BackOfficeTxt: Record "HRM-Back To Office Form");
    begin
    end;

    procedure IsBackOfficeTxtEnabled(var BackOfficeTxt: Record "HRM-Back To Office Form"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code";

    begin
        // exit(WFMngt.CanExecuteWorkflow(BackOfficeTxt, WFCode.RunWorkflowOnSendBackOfficeTxtApprovalCode()))
    end;

    local procedure CheckBackTxtWorkflowEnabled(): Boolean
    var
        BackOfficeTxt: Record "HRM-Back To Office Form";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsBackOfficeTxtEnabled(BackOfficeTxt) then
            Error(NoWorkflowEnb);
    end;
    //end "HRM-Back To Office Form"

    //*************************Cancelling Approvals*********************//////

    //Cancel "HRM-Back To Office Form"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendBackOfficeTxtforApproval(VAR BackOfficeTxt: Record "HRM-Back To Office Form");
    begin
    end;
    //End Cancel "HRM-Back To Office Form"







    var
        myInt: Integer;
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been sent.';
}
