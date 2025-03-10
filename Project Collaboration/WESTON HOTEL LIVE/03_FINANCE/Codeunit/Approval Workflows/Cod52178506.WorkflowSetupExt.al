codeunit 52178511 "Workflow Setup Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]

    local procedure OnAddWorkflowCategoriesToLibrary()

    begin
        /* Casual Requisition */
        WorkflowSetup.InsertWorkflowCategory(CasualRequisitionWorkflowCategoryTxt, CasualRequisitionWorkflowCategoryDescTxt);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]

    local procedure OnAfterInsertApprovalsTableRelations()
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        WorkflowSetup.InsertTableRelation(Database::"Casual Requisition", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]

    local procedure OnInsertWorkflowTemplates()
    begin
        InsertCasualRequisitionApprovalWorkflowTemplate();
    end;

    /* Casual Requisition */
    local procedure InsertCasualRequisitionApprovalWorkflowTemplate()
    var
        Workflow: Record Workflow;
    begin
        WorkflowSetup.InsertWorkflowTemplate(Workflow, CasualRequisitionApprovalWorkflowCodeTxt, CasualRequisitionApprovalWorkfowDescTxt, CasualRequisitionWorkflowCategoryTxt);
        InsertCasualRequisitionApprovalWorkflowDetails(Workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    end;

    local procedure InsertCasualRequisitionApprovalWorkflowDetails(var Workflow: Record Workflow)
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
        BlankDateFormula: DateFormula;
        WorkflowEventHandling: Codeunit WorkFlowEventHandling;
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        CasualRequisition: Record "Casual Requisition";
    begin
        WorkflowSetup.initWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);
        WorkflowSetup.InsertDocApprovalWorkflowSteps(
            Workflow,
            BuildCasualRequisitionTypeConditions(CasualRequisition.Status::Open),
            WorkflowEventHandling.RunWorkflowOnSendCasualRequisitionForApprovalCode,
            BuildCasualRequisitionTypeConditions(CasualRequisition.Status::"Pending Approval"),
            WorkflowEventHandling.RunWorkflowOnCancelCasualRequisitionApprovalCode,
            WorkflowStepArgument,
            true
        );
    end;

    local procedure BuildCasualRequisitionTypeConditions(Status: Integer): Text
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        CasualRequisition.SetRange(Status, Status);
        exit(StrSubstNo(CasualRequisitionTypeCondTxt, WorkflowSetup.Encode(CasualRequisition.GetView(false))))
    end;

    var
        WorkflowSetup: CodeUnit "Workflow Setup";
        /* Casual Requisition */
        CasualRequisitionWorkflowCategoryTxt: TextConst ENU = 'CASREQ';
        CasualRequisitionWorkflowCategoryDescTxt: TextConst ENU = 'Casual Requisition Approval Document';
        CasualRequisitionApprovalWorkflowCodeTxt: TextConst ENU = 'CRAAW';
        CasualRequisitionApprovalWorkfowDescTxt: TextConst ENU = 'Casual Requisition Approval Workflow';
        CasualRequisitionTypeCondTxt: TextConst ENU = '<?xml version = "1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name=CasualRequisition>%1</DataItem></DataItems></ReportParameters>';

}
