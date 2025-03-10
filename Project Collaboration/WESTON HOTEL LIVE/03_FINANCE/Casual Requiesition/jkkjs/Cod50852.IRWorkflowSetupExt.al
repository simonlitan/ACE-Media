codeunit 52178507 "IR Workflow Setup Ext"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowSetup: Codeunit "Workflow Setup";
        CasualRequisitionTypeCondTxt: TextConst ENU = '<?xml version = "1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Casual Requisition">%1</DataItem></DataItems></ReportParameters>';
        CasualRequisitionApprovalWorkflowCodeTxt: TextConst ENU = 'CRAPW';
        CasualRequisitionWorkflowCategoryTxt: TextConst ENU = 'CRW';
        CasualRequisitionApprovalWorkfowDescTxt: TextConst ENU = 'Casual Requisition Approval Workflow';
        CasualRequisitionWorkflowCategoryDescTxt: TextConst ENU = 'Casual Requisition Document';

    local procedure BuildCasualRequisitionTypeConditions(Status: Integer): Text
    var
        CasualRequisition: Record "Casual Requisition";
    begin
        CasualRequisition.SetRange(Status, Status);
        exit(StrSubstNo(CasualRequisitionTypeCondTxt, WorkflowSetup.Encode(CasualRequisition.GetView(false))));
    end;

    local procedure InsertCasualRequisitionApprovalWorkflowDetails(Workflow: Record Workflow)
    var
        CasualRequisition: Record "Casual Requisition";
        WorkflowStepArgument: Record "Workflow Step Argument";
        WorkflowEventHandlingCust: Codeunit "IR Workflow Event Handling Ext";
        BlankDateFormula: DateFormula;
    begin
        // Error
        WorkflowSetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);
        WorkflowSetup.InsertDocApprovalWorkflowSteps(Workflow, BuildCasualRequisitionTypeConditions(CasualRequisition.Status::Open), WorkflowEventHandlingCust.RunWorkflowOnSendCasualRequisitionForApprovalCode(), BuildCasualRequisitionTypeConditions(CasualRequisition.Status::"Pending Approval"), WorkflowEventHandlingCust.RunWorkflowOnCancelCasualRequisitionForApprovalCode(), WorkflowStepArgument, true);
    end;

    local procedure InsertCasualRequisitionApprovalWorkflowTemplate()
    var
        Workflow: Record Workflow;
    begin
        WorkflowSetup.InsertWorkflowTemplate(Workflow, CasualRequisitionApprovalWorkflowCodeTxt, CasualRequisitionApprovalWorkfowDescTxt, CasualRequisitionWorkflowCategoryTxt);
        InsertCasualRequisitionApprovalWorkflowDetails(Workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin
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
}
