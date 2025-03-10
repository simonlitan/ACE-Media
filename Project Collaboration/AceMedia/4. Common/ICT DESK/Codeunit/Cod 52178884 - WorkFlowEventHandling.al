codeunit 52178886 WorkFlowEventHandling
{
    /* ====================================================== Global =============================================================== */

    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";




        /* Incoming Mail */
        IncomingMailSendForApprovalEventDescTxt: TextConst ENU = 'Approval of a Incoming Mail is requested';
        IncomingMailApprovalRequestCncelEventDescTxt: TextConst ENU = 'Approval of a Incoming Mail is canceled';

        /* ICT Support Desk */
        ICTSupportSendForApprovalEventDescTxt: TextConst ENU = 'Approval of ICT Support is Requested';
        ICTSupportRequestCancelEventDescTxt: TextConst ENU = 'Approval of ICT Support is Canceled';
        // Workplan Approval
        WorkplanSendForApprovalEventDescTxt: TextConst ENU = 'Approval of Workplan is Requested';
        WorkplanRequestCancelEventDescTxt: TextConst ENU = 'Approval of Workplan is Canceled';
        //Project
        ProjectSendForApprovalEventDescTxt: TextConst ENU = 'Approval of Project is Requested';
        ProjectRequestCancelEventDescTxt: TextConst ENU = 'Approval of Project is Canceled';


    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin

        // rsementCode, Database::"Scholarship Disbursement", ScholarshipDisbursementRequestCancelEventDescTxt, 0, false);
        /* ICT Support Desk */
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendICTSupportForApprovalCode, Database::"ICT Support Desk", ICTSupportSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelICTSupportCode, Database::"ICT Support Desk", ICTSupportRequestCancelEventDescTxt, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]

    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    var
        WorkflowEvent: Codeunit "Workflow Event Handling";
    begin

        /* Incoming Mail */
        case EventFunctionName of
            RunWorkflowOnCancelIncomingMailApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelIncomingMailApprovalCode, RunWorkflowOnSendIncomingMailForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendIncomingMailForApprovalCode);
        end;


        /* ICT Support Desk */
        case EventFunctionName of
            RunWorkflowOnCancelICTSupportCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelICTSupportCode, RunWorkflowOnSendICTSupportForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendICTSupportForApprovalCode);
        end;

    end;

    /* ICT Support Desk */
    procedure RunWorkflowOnSendICTSupportForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendICTSupportForApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Management", 'OnSendICTSupportForApproval', '', true, true)]
    local procedure RunWorkflowOnSendICTSupportForApproval(Var ICTSupport: Record "ICT Support Desk")
    begin

        WorkflowManagement.HandleEvent(RunWorkflowOnSendICTSupportForApprovalCode, ICTSupport)
    end;

    procedure RunWorkflowOnCancelICTSupportCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelICTSupport'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Management", 'OnCancelICTSupportForApproval', '', true, true)]
    local procedure RunWorkflowOnCancelICTSupport(Var ICTSupport: Record "ICT Support Desk")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelICTSupportCode, ICTSupport);
        ICTSupport.Reset();

        ICTSupport.SetRange("No.", ICTSupport."No.");
        if ICTSupport.FindFirst() then begin
            ICTSupport.Status := ICTSupport.Status::Pending;
            ICTSupport.Modify()
        end;
    end;



    /* Incoming Mail */
    procedure RunWorkflowOnSendIncomingMailForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendIncomingMailForApproval'));
    end;

    local procedure RunWorkflowOnSendIncomingMailForApproval(Var IncomingMail: Record "Incoming Mail")
    begin

        WorkflowManagement.HandleEvent(RunWorkflowOnSendIncomingMailForApprovalCode, IncomingMail)
    end;

    procedure RunWorkflowOnCancelIncomingMailApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelIncomingMailApproval'));
    end;



    local procedure RunWorkflowOnCancelIncomingMailApproval(Var IncomingMail: Record "Incoming Mail")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelIncomingMailApprovalCode, IncomingMail);
        IncomingMail.Reset();
        IncomingMail.SetRange("Ref No", IncomingMail."Ref No");
        if IncomingMail.FindFirst() then begin
            IncomingMail.Status := IncomingMail.Status::Open;
            IncomingMail.Modify()
        end;
    end;






    /* ********************************************************************************************************************************************* */

    procedure RunWorkflowOnSendBContrForApprovalCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnSendBContrForApproval'));
    end;

    procedure RunWorkflowOnCancelBContrApprovalRequestCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnCancelBContrApprovalRequest'));
    end;

    procedure RunWorkflowOnAfterReleaseBContrCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnAfterReleaseBContr'));
    end;

}
