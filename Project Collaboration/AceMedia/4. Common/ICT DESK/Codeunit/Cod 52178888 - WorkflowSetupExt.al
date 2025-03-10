codeunit 52178888 WorkflowSetupExt
{
    /* =================================================== Globals ========================================================= */


    var
        WorkflowSetup: CodeUnit "Workflow Setup";
        WorkflowStepArgument: Record "Workflow Step Argument";
        BlankDateFormula: DateFormula;
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit WorkFlowEventHandling;


        /* Incoming Mail */
        IncomingMailWorkflowCategoryTxt: TextConst ENU = 'Incoming Mail';
        IncomingMailWorkflowCategoryDescTxt: TextConst ENU = 'Incoming Mail Approval Document';
        IncomingMailApprovalWorkflowCodeTxt: TextConst ENU = 'IMAPW';
        IncomingMailApprovalWorkfowDescTxt: TextConst ENU = 'Incoming Mail Approval Approval Workflow';
        IncomingMailTypeCondTxt: TextConst ENU = '<?xml version = "1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Incoming Mail">%1</DataItem></DataItems></ReportParameters>';


        /* ICT Support Desk */
        ICTSupport: Record "ICT Support Desk";
        ICTSupportWorkflowCategoryTxt: TextConst ENU = 'ICT Support';
        ICTSupportWorkflowCategoryDescTxt: TextConst ENU = 'ICT Support Document';
        ICTSupportWorkflowCodeTxt: TextConst ENU = 'ICTSAW';
        ICTSupportWorkfowDescTxt: TextConst ENU = 'ICT Support Approval Workflow';
        ICTSupportTypeCondTxt: TextConst ENU = '<?xml version = "1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name=ICTSupport>%1</DataItem></DataItems></ReportParameters>';

    trigger OnRun()

    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin

        /* Incoming Mail */
        WorkflowSetup.InsertWorkflowCategory(IncomingMailWorkflowCategoryTxt, IncomingMailWorkflowCategoryDescTxt);

        /* ICT Support Desk */
        WorkflowSetup.InsertWorkflowCategory(ICTSupportWorkflowCategoryTxt, ICTSupportWorkflowCategoryDescTxt);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
    local procedure OnAfterInsertApprovalTableRelations()
    var
        ApprovalEntry: Record 454;
    begin
        // workflowSetup.InsertTableRelation(Database::"FIN-Payments Header", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));

        WorkflowSetup.InsertTableRelation(Database::"Incoming Mail", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));

        WorkflowSetup.InsertTableRelation(Database::"ICT Support Desk", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin


        InsertICTSupportWorkflowTemplate();


    end;

    /* Incoming Mail */

    local procedure InsertIncomingMailApprovalWorkflowDetails(var Workflow: Record Workflow)
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
        BlankDateFormula: DateFormula;
        WorkflowEventHandling: Codeunit WorkFlowEventHandling;
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        IncomingMail: Record "Incoming Mail";
    begin
        WorkflowSetup.initWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);
        WorkflowSetup.InsertDocApprovalWorkflowSteps(
            Workflow,
            BuildIncomingMailTypeConditions(IncomingMail.Status::Open),
            WorkflowEventHandling.RunWorkflowOnSendIncomingMailForApprovalCode,
            BuildIncomingMailTypeConditions(IncomingMail.Status::Pending),
            WorkflowEventHandling.RunWorkflowOnCancelIncomingMailApprovalCode,
            WorkflowStepArgument,
            true
        );
    end;


    local procedure BuildIncomingMailTypeConditions(Status: Integer): Text
    var
        IncomingMail: Record "Incoming Mail";
    begin
        IncomingMail.SetRange(Status, Status);
        exit(StrSubstNo(IncomingMailTypeCondTxt, WorkflowSetup.Encode(IncomingMail.GetView(false))))
    end;


    /* ICT Support Desk */
    local procedure InsertICTSupportWorkflowTemplate()
    var
        Workflow: Record Workflow;
    begin
        WorkflowSetup.InsertWorkflowTemplate(Workflow, ICTSupportWorkflowCodeTxt, ICTSupportWorkfowDescTxt, ICTSupportWorkflowCategoryTxt);
        InsertICTSupportWorkflowDetails(Workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    end;

    local procedure InsertICTSupportWorkflowDetails(var Workflow: Record Workflow)
    begin
        WorkflowSetup.initWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);
        WorkflowSetup.InsertDocApprovalWorkflowSteps(
            Workflow,
            BuildICTSupportTypeConditions(ICTSupport.Status::Pending),
            WorkflowEventHandling.RunWorkflowOnSendICTSupportForApprovalCode,
            BuildICTSupportTypeConditions(ICTSupport.Status::"Pending Approval"),
            WorkflowEventHandling.RunWorkflowOnCancelICTSupportCode,
            WorkflowStepArgument,
            true
        );
    end;

    local procedure BuildICTSupportTypeConditions(Status: Integer): Text
    begin
        ICTSupport.Reset;
        ICTSupport.SetRange(Status, Status);
        exit(StrSubstNo(ICTSupportTypeCondTxt, WorkflowSetup.Encode(ICTSupport.GetView(false))))
    end;

    //Workplan




}





