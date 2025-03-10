codeunit 52179085 "IntCodeunit2"
{
    trigger OnRun()
    begin

    end;

    //Leave
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendLeaveforApproval(VAR Leave: Record "HRM-Leave Requisition");
    begin
    end;

    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelLeaveforApproval(VAR HRMLeaveReq: Record "HRM-Leave Requisition");
    begin
    end;


    procedure IsLeaveEnabled(var Leave: Record "HRM-Leave Requisition"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";
    begin
        exit(WFMngt.CanExecuteWorkflow(Leave, WFCode.RunWorkflowOnSendLeaveApprovalCode()))
    end;

    local procedure CheckWorkflowEnabled(): Boolean
    var
        Leave: Record "HRM-Leave Requisition";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsLeaveEnabled(Leave) then
            Error(NoWorkflowEnb);
    end;


    //Added modifications
    local procedure ShowLeaveApprovalStatus(Leave: Record "HRM-Leave Requisition")
    begin
        Leave.Find;

        case Leave.Status of
            Leave.Status::Approved:
                Message(DocStatusChangedMsg, '', Leave."No.", Leave.Status);
            Leave.Status::"Pending Approval":
                if HasOpenOrPendingApprovalEntries(Leave.RecordId) then
                    Message(PendingApprovalMsg);

        end;
    end;
    //Appraisal
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendAppraisalforApproval(VAR Appraisal: Record "Employee Self-Appraisal");
    begin
    end;

    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelAppraisalforApproval(VAR Appraisal: Record "Employee Self-Appraisal");
    begin
    end;


    procedure IsAppraisalEnabled(VAR Appraisal: Record "Employee Self-Appraisal"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";
    begin
        exit(WFMngt.CanExecuteWorkflow(Appraisal, WFCode.RunWorkflowOnSendAppraisalApprovalCode()))
    end;

    local procedure CheckAppraisalWorkflowEnabled(): Boolean
    var
        Appraisal: Record "Employee Self-Appraisal";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsAppraisalEnabled(Appraisal) then
            Error(NoWorkflowEnb);
    end;


    //Added modifications
    local procedure ShowAppraisalApprovalStatus(VAR Appraisal: Record "Employee Self-Appraisal")
    begin
        Appraisal.Find;

        case Appraisal.Status of
            Appraisal.Status::Released:
                Message(DocStatusChangedMsg, '', Appraisal."No.", Appraisal.Status);
            Appraisal.Status::"Pending Approval":
                if HasOpenOrPendingApprovalEntries(Appraisal.RecordId) then
                    Message(PendingApprovalMsg);

        end;
    end;

    //Paychange Advice Approvals
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPCAforApproval(VAR PCA: Record "prBasic pay PCA");
    begin
    end;

    procedure IsPCAEnabled(var PCA: Record "prBasic pay PCA"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";
    begin
        exit(WFMngt.CanExecuteWorkflow(PCA, WFCode.RunWorkflowOnSendPCAApprovalCode()))
    end;

    local procedure CheckPCAWorkflowEnabled(): Boolean
    var
        PCA: Record "prBasic pay PCA";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsPCAEnabled(PCA) then
            Error(NoWorkflowEnb);
    end;

    //Workplan
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendWorkplanforApproval(VAR Workplan: Record "Self Appraisal");
    begin
    end;

    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelWorkplanforApproval(VAR Workplan: Record "Self Appraisal");
    begin
    end;


    procedure IsWorkplanEnabled(VAR Workplan: Record "Self Appraisal"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";
    begin
        exit(WFMngt.CanExecuteWorkflow(Workplan, WFCode.RunWorkflowOnSendWorkplanApprovalCode()))
    end;

    local procedure CheckWorkplanWorkflowEnabled(): Boolean
    var
        Workplan: Record "Self Appraisal";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsWorkplanEnabled(Workplan) then
            Error(NoWorkflowEnb);
    end;


    //Added modifications
    local procedure ShowWorkplanApprovalStatus(VAR Workplan: Record "Self Appraisal")
    begin
        Workplan.Find;

        case Workplan.Status of
            Workplan.Status::Released:
                Message(DocStatusChangedMsg, '', Workplan."No.", Workplan.Status);
            Workplan.Status::"Pending Approval":
                if HasOpenOrPendingApprovalEntries(Workplan.RecordId) then
                    Message(PendingApprovalMsg);

        end;
    end;



    //"HRM-Training Projection Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendTrainingProjectionTxtforApproval(VAR TrainingProjectionTxt: Record "HRM-Training Projection Header");
    begin
    end;

    procedure IsTrainingProjectionTxtEnabled(var TrainingProjectionTxt: Record "HRM-Training Projection Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";

    begin
        exit(WFMngt.CanExecuteWorkflow(TrainingProjectionTxt, WFCode.RunWorkflowOnSendTrainingProjectionTxtApprovalCode()))
    end;

    local procedure CheckTrainingProjectionWorkflowEnabled(): Boolean
    var
        TrainingProjectionTxt: Record "HRM-Training Projection Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsTrainingProjectionTxtEnabled(TrainingProjectionTxt) then
            Error(NoWorkflowEnb);
    end;
    //end "HRM-Training Projection Header"

    //*************************Cancelling Approvals*********************//////

    //Cancel "HRM-Training Projection Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendTrainingProjectionTxtforApproval(VAR TrainingProjectionTxt: Record "HRM-Training Projection Header");
    begin
    end;
    //End Cancel "HRM-Training Projection Header"

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

    //CANCEL PCA
    procedure OnCancelPCAForApproval(var PCA: Record "prBasic pay PCA")
    begin

    end;

    //"HRM-Alternative Dispute R"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendDisputeHrforApproval(VAR Dispute: Record "HRM-Alternative Dispute R");
    begin
    end;

    procedure IsDisputeHrEnabled(var Dispute: Record "HRM-Alternative Dispute R"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";

    begin
        exit(WFMngt.CanExecuteWorkflow(Dispute, WFCode.RunWorkflowOnSendDisputeHrApprovalCode()))
    end;

    local procedure CheckDisputeHrTxtWorkflowEnabled(): Boolean
    var
        Dispute: Record "HRM-Alternative Dispute R";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsDisputeHrEnabled(Dispute) then
            Error(NoWorkflowEnb);
    end;
    //end "HRM-Alternative Dispute R"

    //*************************Cancelling Approvals*********************

    //Cancel"HRM-Alternative Dispute R"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendDisputeHrforApproval(VAR Dispute: Record "HRM-Alternative Dispute R");
    begin
    end;
    //End Cancel "HRM-Alternative Dispute R"


    // "HRM-Disciplinary Cases (B)"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendDisciplinaryCaseTxtforApproval(VAR DisciplinaryCaseTxt: Record "HRM-Disciplinary Cases (B)");
    begin
    end;

    procedure IsDisciplinaryCaseTxtEnabled(var DisciplinaryCaseTxt: Record "HRM-Disciplinary Cases (B)"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";

    begin
        exit(WFMngt.CanExecuteWorkflow(DisciplinaryCaseTxt, WFCode.RunWorkflowOnSendDisciplinaryCaseTxtApprovalCode()))
    end;

    local procedure CheckDisciplinaryTxtWorkflowEnabled(): Boolean
    var
        DisciplinaryCaseTxt: Record "HRM-Disciplinary Cases (B)";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsDisciplinaryCaseTxtEnabled(DisciplinaryCaseTxt) then
            Error(NoWorkflowEnb);
    end;
    //end  "HRM-Disciplinary Cases (B)"

    //*************************Cancelling Approvals*********************//////

    //Cancel  "HRM-Disciplinary Cases (B)"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendDisciplinaryCaseTxtforApproval(VAR DisciplinaryCaseTxt: Record "HRM-Disciplinary Cases (B)");
    begin
    end;
    //End Cancel  "HRM-Disciplinary Cases (B)"


    // "HRM-Leave Recall"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendLeaveRecallTxtforApproval(VAR LeaveRecallTxt: Record "HRM-Leave Recall");
    begin
    end;

    procedure IsLeaveRecallTxtEnabled(var LeaveRecallTxt: Record "HRM-Leave Recall"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";

    begin
        exit(WFMngt.CanExecuteWorkflow(LeaveRecallTxt, WFCode.RunWorkflowOnSendLeaveRecallTxtApprovalCode()))
    end;

    local procedure CheckLeaveRecallWorkflowEnabled(): Boolean
    var
        LeaveRecallTxt: Record "HRM-Leave Recall";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsLeaveRecallTxtEnabled(LeaveRecallTxt) then
            Error(NoWorkflowEnb);
    end;
    //end  "HRM-Leave Recall"

    //*************************Cancelling Approvals*********************//////

    //Cancel  "HRM-Leave Recall"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendLeaveRecallTxtforApproval(VAR LeaveRecallTxt: Record "HRM-Leave Recall");
    begin
    end;
    //End Cancel  "HRM-Leave Recall"


    // "HRM-Return To Office(Leave)"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendLeaveReturnTxtforApproval(VAR LeaveReturnTxt: Record "HRM-Return To Office(Leave)");
    begin
    end;

    procedure IsLeaveReturnTxtEnabled(var LeaveReturnTxt: Record "HRM-Return To Office(Leave)"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Work Flow Code2";

    begin
        exit(WFMngt.CanExecuteWorkflow(LeaveReturnTxt, WFCode.RunWorkflowOnSendLeaveReturnTxtApprovalCode()))
    end;

    local procedure CheckLeaveReturnWorkflowEnabled(): Boolean
    var
        LeaveReturnTxt: Record "HRM-Return To Office(Leave)";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsLeaveReturnTxtEnabled(LeaveReturnTxt) then
            Error(NoWorkflowEnb);
    end;
    //end  "HRM-Return To Office(Leave)"

    //*************************Cancelling Approvals*********************//////

    //Cancel  "HRM-Return To Office(Leave)"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSendLeaveReturnTxtforApproval(VAR LeaveReturnTxt: Record "HRM-Return To Office(Leave)");
    begin
    end;
    //End Cancel  "HRM-Return To Office(Leave)"




    ///////////////////////**************************POPULATE APPROVAL ENTRY AGRUMENT*****************////////////////////
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
        WorkflowStepInstance: Record "Workflow Step Instance")
    var
        leave: Record "HRM-Leave Requisition";
        PayChangeAdvice: Record "prBasic pay PCA";
        PrlApproval: Record "HRM-Training Projection Header";
        Adr: Record "HRM-Alternative Dispute R";
        DisciplinaryCase: Record "HRM-Disciplinary Cases (B)";
        LeaveRecall: Record "HRM-Leave Recall";
        LeaveReturn: Record "HRM-Return To Office(Leave)";
        Appraisal: Record "Employee Self-Appraisal";
        Workplan: Record "Self Appraisal";


    begin
        case
            RecRef.Number of
            Database::"HRM-Leave Requisition":
                begin
                    RecRef.SetTable(leave);
                    ApprovalEntryArgument."Document No." := leave."No.";

                end;
            Database::"prBasic pay PCA":
                begin
                    RecRef.SetTable(PayChangeAdvice);
                    ApprovalEntryArgument."Document No." := PayChangeAdvice."Change Advice Serial No.";
                end;

            Database::"HRM-Training Projection Header":
                begin
                    //PrlApproval.CalcFields("Gross Amount");
                    RecRef.SetTable(PrlApproval);
                    ApprovalEntryArgument."Document No." := format(PrlApproval."Document No");
                    // ApprovalEntryArgument.Amount := PrlApproval."Gross Amount";
                    //ApprovalEntryArgument."Amount (LCY)" := PrlApproval."Gross Amount";
                end;
            Database::"HRM-Alternative Dispute R":
                begin
                    RecRef.SetTable(Adr);
                    ApprovalEntryArgument."Document No." := format(Adr."Case No");

                end;
            Database::"HRM-Leave Recall":
                begin

                    RecRef.SetTable(LeaveRecall);
                    ApprovalEntryArgument."Document No." := LeaveRecall."No";

                end;
            Database::"HRM-Disciplinary Cases (B)":
                begin

                    RecRef.SetTable(DisciplinaryCase);
                    ApprovalEntryArgument."Document No." := DisciplinaryCase."Case Number";

                end;
            Database::"HRM-Return To Office(Leave)":
                begin

                    RecRef.SetTable(LeaveReturn);
                    ApprovalEntryArgument."Document No." := LeaveReturn."No.";

                end;
            Database::"Employee Self-Appraisal":
                begin
                    RecRef.SetTable(Appraisal);
                    ApprovalEntryArgument."Document No." := Appraisal."No.";
                end;
            Database::"Self Appraisal":
                begin
                    RecRef.SetTable(Workplan);
                    ApprovalEntryArgument."Document No." := Workplan."No.";
                end;

        end;

    end;


    var
        myInt: Integer;
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been sent.';
}
