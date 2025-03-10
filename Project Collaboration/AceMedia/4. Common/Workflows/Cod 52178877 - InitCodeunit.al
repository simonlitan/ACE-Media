codeunit 52178877 "Init Codeunit"
{
    trigger OnRun()
    begin

    end;




    //"Prl-Approval"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPrlApprovalforApproval(VAR PrlApproval: Record "Prl-Approval");
    begin
    end;

    procedure IsPrlApprovalEnabled(var PrlApproval: Record "Prl-Approval"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "WF Codes";
    begin
        exit(WFMngt.CanExecuteWorkflow(PrlApproval, WFCode.RunWorkflowOnSendPrlApprovalApprovalCode()))
    end;

    local procedure CheckPrlApprovalWorkflowEnabled(): Boolean
    var
        PrlApproval: Record "Prl-Approval";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsPrlApprovalEnabled(PrlApproval) then
            Error(NoWorkflowEnb);
    end;
    //Cancel "Prl-Approval"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelPrlApprovalforApproval(VAR PrlApproval: Record "Prl-Approval");
    begin
    end;
    //End Cancel "Prl-Approval"
    //"Prl-Approval"

    //End Training



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
                    RecRef.SetTable(PrlApproval);
                    ApprovalEntryArgument."Document No." := format(PrlApproval."Payroll Period");
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Main Payroll";
                end;

        end;
    end;
    //////////////////************************End Populate  Approval Entry**********************////////////////////////
    /// 
    /// 





}
