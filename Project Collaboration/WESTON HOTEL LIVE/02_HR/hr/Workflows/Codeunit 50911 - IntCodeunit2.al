codeunit 50911 IntCodeunit2
{
    trigger OnRun()
    begin

    end;
    //Employee Requisition
    // [IntegrationEvent (false, false)]
    // procedure SendEmpRequisitionAppReq (var EmployeeReq: Record "HRM-Employee Requisitions" )
    // begin

    // end;
    // [IntegrationEvent(false,false)]
    // procedure OncancelEmpRequisitionAppReq (var  EmployeeReq: Record "HRM-Employee Requisitions")
    // begin

    // end;
    // procedure IsEmpReqEnabled(var EmployeeReq: Record "HRM-Employee Requisitions"): Boolean
    // var
    //     WFMngt: Codeunit "Workflow Management";
    //     WFCode: Codeunit "Work Flow Code2";
    // begin
    //     exit(WFMngt.CanExecuteWorkflow(EmployeeReq, WFCode.RunWorkflowOnSendLeaveApprovalCode()))
    // end;

    // local procedure CheckWorkflowEnabled(): Boolean
    // var
    //     Leave: Record "HRM-Leave Requisition";
    //     NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
    //      ENG = 'No workflow Enabled for this Record type';
    // begin
    //     if not IsLeaveEnabled(Leave) then
    //         Error(NoWorkflowEnb);
    // end;


    // //Added modifications
    // local procedure ShowLeaveApprovalStatus(Leave: Record "HRM-Leave Requisition")
    // begin
    //     Leave.Find;

    //     case Leave.Status of
    //         Leave.Status::Released:
    //             Message(DocStatusChangedMsg, '', Leave."No.", Leave.Status);
    //         Leave.Status::"Pending Approval":
    //             if HasOpenOrPendingApprovalEntries(Leave.RecordId) then
    //                 Message(PendingApprovalMsg);

    //     end;
    // end;

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
            Leave.Status::Released:
                Message(DocStatusChangedMsg, '', Leave."No.", Leave.Status);
            Leave.Status::"Pending Approval":
                if HasOpenOrPendingApprovalEntries(Leave.RecordId) then
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

    ///////////////////////**************************POPULATE APPROVAL ENTRY AGRUMENT*****************////////////////////
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
        WorkflowStepInstance: Record "Workflow Step Instance")
    var
        leave: Record "HRM-Leave Requisition";
        PayChangeAdvice: Record "prBasic pay PCA";


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


        end;
    end;


    var
        myInt: Integer;
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been sent.';
}
