codeunit 52178879 "MaintenanceIntCodeunit"
{
    trigger OnRun()
    begin

    end;
    //Start ICT WF
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendICTDocforApproval(VAR ICT: Record "ICT Support Desk");
    begin
    end;

    procedure IsICTDocEnabled(VAR ICT: Record "ICT Support Desk"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit MaintenanceWorkFlowCode;

    begin
        // exit(WFMngt.CanExecuteWorkflow(ICT, WFCode.RunWorkflowOnSendICTDocApprovalCode()))
    end;

    local procedure CheckICTDocTxtWorkflowEnabled(): Boolean
    var
        ICT: Record "ICT Support Desk";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsICTDocEnabled(ICT) then
            Error(NoWorkflowEnb);
    end;
    //end ICT

    //*************************Cancelling Approvals*********************

    //Cancel ICT
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendICTDocforApproval(VAR ICT: Record "ICT Support Desk");
    begin
    end;

    //End ICT WF



    //"RepairMaintenance"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendRepairforApproval(VAR Repair: Record "RepairMaintenance");
    begin
    end;

    procedure IsRepairEnabled(var Repair: Record "RepairMaintenance"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "MaintenanceWorkFlowCode";

    begin
        exit(WFMngt.CanExecuteWorkflow(Repair, WFCode.RunWorkflowOnSendRepairApprovalCode()))
    end;

    local procedure CheckRepairWorkflowEnabled(): Boolean
    var
        Repair: Record "RepairMaintenance";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsRepairEnabled(Repair) then
            Error(NoWorkflowEnb);
    end;
    //end "RepairMaintenance"

    //*************************Cancelling Approvals*********************//////

    //Cancel "RepairMaintenance"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendRepairforApproval(VAR Repair: Record "RepairMaintenance");
    begin
    end;
    //End Cancel "RepairMaintenance"



    //"TR Transport Request"
    //  [IntegrationEvent(false, false)]
    // PROCEDURE OnSendTransportforApproval(VAR Transport: Record "TR Transport Request");
    // begin
    // end;

    // procedure IsTransportEnabled(var Transport: Record "TR Transport Request"): Boolean
    // var
    //     WFMngt: Codeunit "Workflow Management";
    //     WFCode: Codeunit "MaintenanceWorkFlowCode";

    // begin
    //     exit(WFMngt.CanExecuteWorkflow(Transport, WFCode.RunWorkflowOnSendTransportApprovalCode()))
    // end;

    // local procedure CheckTransportWorkflowEnabled(): Boolean
    // var
    //     Transport: Record "TR Transport Request";
    //     NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    // begin
    //     if not IsTransportEnabled(Transport) then
    //         Error(NoWorkflowEnb);
    // end;
    // //end "TR Transport Request"

    // //*************************Cancelling Approvals*********************//////

    // //Cancel "TR Transport Request"
    // [IntegrationEvent(false, false)]
    // PROCEDURE OnCancelSendTransportforApproval(VAR Transport: Record "TR Transport Request");
    // begin
    // end;
    //End Cancel "TR Transport Request"




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

        PrlApproval: Record "RepairMaintenance";
    // Transport: Record "TR Transport Request";
    begin
        case
            RecRef.Number of
            Database::"RepairMaintenance":
                begin
                    //PrlApproval.CalcFields("Gross Amount");
                    RecRef.SetTable(PrlApproval);
                    ApprovalEntryArgument."Document No." := format(PrlApproval.No);
                    // ApprovalEntryArgument.Amount := PrlApproval."Gross Amount";
                    //ApprovalEntryArgument."Amount (LCY)" := PrlApproval."Gross Amount";
                end;
        end;
    end;



    var
        myInt: Integer;
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been SendBackOfficet.';
}
