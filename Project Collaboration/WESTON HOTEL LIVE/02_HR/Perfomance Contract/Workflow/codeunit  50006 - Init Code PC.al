codeunit 50000 "Init Code PC"
{
    trigger OnRun()
    begin

    end;



    //Performance Criteria Cascade 2
    //PCC2
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPCC2forApproval(VAR PCC2: Record "Performance Criteria Cascade 2");
    begin
    end;

    procedure IsPCC2Enabled(var PCC2: Record "Performance Criteria Cascade 2"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code PC";
    begin
        exit(WFMngt.CanExecuteWorkflow(PCC2, WFCode.RunWorkflowOnSendPCC2ApprovalCode()))
    end;

    local procedure CheckPCC2WorkflowEnabled(): Boolean
    var
        PCC2: Record "Performance Criteria Cascade 2";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsPCC2Enabled(PCC2) then
            Error(NoWorkflowEnb);
    end;


    //End Performance Criteria Cascade 2

    //Performance Criteria Cascade 3
    //PCC3
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPCC3forApproval(VAR PCC3: Record "Performance Criteria Cascade 3");
    begin
    end;

    procedure IsPCC3Enabled(var PCC3: Record "Performance Criteria Cascade 3"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code PC";
    begin
        exit(WFMngt.CanExecuteWorkflow(PCC3, WFCode.RunWorkflowOnSendPCC3ApprovalCode()))
    end;

    local procedure CheckPCC3WorkflowEnabled(): Boolean
    var
        PCC3: Record "Performance Criteria Cascade 3";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsPCC3Enabled(PCC3) then
            Error(NoWorkflowEnb);
    end;


    //End Performance Criteria Cascade 3


    //Performance Criteria Cascade 4
    //PCC4
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPCC4forApproval(VAR PCC4: Record "Performance Criteria Cascade 4");
    begin
    end;

    procedure IsPCC4Enabled(var PCC4: Record "Performance Criteria Cascade 4"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code PC";
    begin
        exit(WFMngt.CanExecuteWorkflow(PCC4, WFCode.RunWorkflowOnSendPCC4ApprovalCode()))
    end;

    local procedure CheckPCC4WorkflowEnabled(): Boolean
    var
        PCC4: Record "Performance Criteria Cascade 4";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsPCC4Enabled(PCC4) then
            Error(NoWorkflowEnb);
    end;


    //End Performance Criteria Cascade 4

    //Performance Criteria Cascade 5
    //PCC5
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPCC5forApproval(VAR PCC5: Record "Performance Criteria Cascade 5");
    begin
    end;

    procedure IsPCC5Enabled(var PCC5: Record "Performance Criteria Cascade 5"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code PC";
    begin
        exit(WFMngt.CanExecuteWorkflow(PCC5, WFCode.RunWorkflowOnSendPCC5ApprovalCode()))
    end;

    local procedure CheckPCC5WorkflowEnabled(): Boolean
    var
        PCC5: Record "Performance Criteria Cascade 5";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsPCC5Enabled(PCC5) then
            Error(NoWorkflowEnb);
    end;


    //End Performance Criteria Cascade 5

}