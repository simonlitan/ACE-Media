codeunit 52178883 "Approval Management"
{
    var
        /* ICT Support Desk */
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit WorkFlowEventHandling;
        NoWorkflowEnableErr: TextConst ENU = 'No approval worklow for this record type is enabled.';
        NothingToApproveErr: TextConst ENU = 'Lines Must Contain Record(s)';
        ICTSupport: Record "ICT Support Desk";


    trigger OnRun()

    begin

    end;






    /* Incoming Mail */
    [IntegrationEvent(false, false)]

    procedure OnSendIncomingMailForApproval(var IncomingMail: Record "Incoming Mail")
    begin

    end;

    [IntegrationEvent(false, false)]

    procedure OnCancelIncomingMailForApproval(var IncomingMail: Record "Incoming Mail")
    begin

    end;

    procedure CheckIncomingMailApprovalsWorkflowEnable(var IncomingMail: Record "Incoming Mail"): Boolean
    begin
        IF NOT IsIncomingMailApplicationApprovalsWorkflowEnable(IncomingMail) then
            Error(NoWorkflowEnableErr);
        exit(true)
    end;

    procedure IsIncomingMailApplicationApprovalsWorkflowEnable(var IncomingMail: Record "Incoming Mail"): Boolean

    begin
        IF IncomingMail."Status" <> IncomingMail."Status"::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(IncomingMail, WorkflowEventHandling.RunWorkflowOnSendIncomingMailforApprovalCode));
    end;



    /* ICT Support Desk */
    [IntegrationEvent(false, false)]

    procedure OnSendICTSupportForApproval(var ICTSupport: Record "ICT Support Desk")
    begin

    end;

    [IntegrationEvent(false, false)]

    procedure OnCancelICTSupportForApproval(var ICTSupport: Record "ICT Support Desk")
    begin

    end;

    procedure CheckICTSupportsWorkflowEnable(var ICTSupport: Record "ICT Support Desk"): Boolean
    begin
        IF NOT IsICTSupportApplicationApprovalsWorkflowEnable(ICTSupport) then
            Error(NoWorkflowEnableErr);
        exit(true)
    end;

    procedure IsICTSupportApplicationApprovalsWorkflowEnable(var ICTSupport: Record "ICT Support Desk"): Boolean

    begin
        IF ICTSupport."Status" <> ICTSupport."Status"::Pending then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(ICTSupport, WorkflowEventHandling.RunWorkflowOnSendICTSupportForApprovalCode));
    end;


    /*  ******************************************************************************************* */
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var

        IncomingMail: Record "Incoming Mail";
        IsHandled: Boolean;

    begin
        case
            RecRef.Number of

            /* Incoming Mail */

            Database::"Incoming Mail":
                begin
                    RecRef.SetTable(IncomingMail);
                    ApprovalEntryArgument."Document No." := IncomingMail."Ref No";
                    IsHandled := false;
                end;

            /* ICT Support Desk */
            Database::"ICT Support Desk":
                begin
                    RecRef.SetTable(ICTSupport);
                    IsHandled := false;
                    ApprovalEntryArgument."Document No." := ICTSupport."No.";
                end;

        end;
    end;


}
