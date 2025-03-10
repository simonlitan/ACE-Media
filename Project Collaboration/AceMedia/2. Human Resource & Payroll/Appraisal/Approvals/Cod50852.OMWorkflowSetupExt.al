codeunit 52179368 "OM Workflow Setup Ext"
{
    trigger OnRun()
    begin
    end;

    var
        WorkflowSetup: Codeunit "Workflow Setup";
        AppraisalHeaderTypeCondTxt: TextConst ENU = '<?xml version = "1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Appraisal Header">%1</DataItem></DataItems></ReportParameters>';
        AppraisalHeaderApprovalWorkflowCodeTxt: TextConst ENU = 'CRAPW';
        AppraisalHeaderWorkflowCategoryTxt: TextConst ENU = 'CRW';
        AppraisalHeaderApprovalWorkfowDescTxt: TextConst ENU = 'Appraisal Header Approval Workflow';
        AppraisalHeaderWorkflowCategoryDescTxt: TextConst ENU = 'Appraisal Header Document';

    local procedure BuildAppraisalHeaderTypeConditions(Status: Integer): Text
    var
        AppraisalHeader: Record "Employee Self-Appraisal";
    begin
        AppraisalHeader.SetRange(Status, Status);
        exit(StrSubstNo(AppraisalHeaderTypeCondTxt, WorkflowSetup.Encode(AppraisalHeader.GetView(false))));
    end;

    local procedure InsertAppraisalHeaderApprovalWorkflowDetails(Workflow: Record Workflow)
    var
        AppraisalHeader: Record "Employee Self-Appraisal";
        WorkflowStepArgument: Record "Workflow Step Argument";
        WorkflowEventHandlingCust: Codeunit "OM Workflow Event Handling Ext";
        BlankDateFormula: DateFormula;
    begin
        // Error
        WorkflowSetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);
        WorkflowSetup.InsertDocApprovalWorkflowSteps(Workflow, BuildAppraisalHeaderTypeConditions(AppraisalHeader.Status::Open), WorkflowEventHandlingCust.RunWorkflowOnSendAppraisalHeaderForApprovalCode(), BuildAppraisalHeaderTypeConditions(AppraisalHeader.Status::"Pending Approval"), WorkflowEventHandlingCust.RunWorkflowOnCancelAppraisalHeaderForApprovalCode(), WorkflowStepArgument, true);
    end;

    local procedure InsertAppraisalHeaderApprovalWorkflowTemplate()
    var
        Workflow: Record Workflow;
    begin
        WorkflowSetup.InsertWorkflowTemplate(Workflow, AppraisalHeaderApprovalWorkflowCodeTxt, AppraisalHeaderApprovalWorkfowDescTxt, AppraisalHeaderWorkflowCategoryTxt);
        InsertAppraisalHeaderApprovalWorkflowDetails(Workflow);
        WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin
        WorkflowSetup.InsertWorkflowCategory(AppraisalHeaderWorkflowCategoryTxt, AppraisalHeaderWorkflowCategoryDescTxt);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
    local procedure OnAfterInsertApprovalsTableRelations()
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        WorkflowSetup.InsertTableRelation(Database::"Employee Self-Appraisal", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertAppraisalHeaderApprovalWorkflowTemplate();
    end;
}
