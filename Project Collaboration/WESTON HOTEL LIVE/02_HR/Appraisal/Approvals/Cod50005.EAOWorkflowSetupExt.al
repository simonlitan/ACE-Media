// codeunit 52179365 "EAO Workflow Setup Ext"
// {
//     trigger OnRun()
//     begin
//     end;

//     var
//         WorkflowSetup: Codeunit "Workflow Setup";
//         EmployeeAppraisalObjectivesTypeCondTxt: TextConst ENU = '<?xml version = "1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Self Appraisal">%1</DataItem></DataItems></ReportParameters>';
//         EmployeeAppraisalObjectivesApprovalWorkflowCodeTxt: TextConst ENU = 'CRAPW';
//         EmployeeAppraisalObjectivesWorkflowCategoryTxt: TextConst ENU = 'CRW';
//         EmployeeAppraisalObjectivesApprovalWorkfowDescTxt: TextConst ENU = 'Self Appraisal Approval Workflow';
//         EmployeeAppraisalObjectivesWorkflowCategoryDescTxt: TextConst ENU = 'Self Appraisal Document';

//     local procedure BuildEmployeeAppraisalObjectivesTypeConditions(Status: Integer): Text
//     var
//         EmployeeAppraisalObjectives: Record "Self Appraisal";
//     begin
//         EmployeeAppraisalObjectives.SetRange(Status, Status);
//         exit(StrSubstNo(EmployeeAppraisalObjectivesTypeCondTxt, WorkflowSetup.Encode(EmployeeAppraisalObjectives.GetView(false))));
//     end;

//     local procedure InsertEmployeeAppraisalObjectivesApprovalWorkflowDetails(Workflow: Record Workflow)
//     var
//         EmployeeAppraisalObjectives: Record "Self Appraisal";
//         WorkflowStepArgument: Record "Workflow Step Argument";
//         WorkflowEventHandlingCust: Codeunit "EAO Workflow Event Handling";
//         BlankDateFormula: DateFormula;
//     begin
//         // Error
//         WorkflowSetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);
//         WorkflowSetup.InsertDocApprovalWorkflowSteps(Workflow, BuildEmployeeAppraisalObjectivesTypeConditions(EmployeeAppraisalObjectives.Status::Open), WorkflowEventHandlingCust.RunWorkflowOnSendEmployeeAppraisalObjectivesForApprovalCode(), BuildEmployeeAppraisalObjectivesTypeConditions(EmployeeAppraisalObjectives.Status::"Pending Approval"), WorkflowEventHandlingCust.RunWorkflowOnCancelEmployeeAppraisalObjectivesForApprovalCode(), WorkflowStepArgument, true);
//     end;

//     local procedure InsertEmployeeAppraisalObjectivesApprovalWorkflowTemplate()
//     var
//         Workflow: Record Workflow;
//     begin
//         WorkflowSetup.InsertWorkflowTemplate(Workflow, EmployeeAppraisalObjectivesApprovalWorkflowCodeTxt, EmployeeAppraisalObjectivesApprovalWorkfowDescTxt, EmployeeAppraisalObjectivesWorkflowCategoryTxt);
//         InsertEmployeeAppraisalObjectivesApprovalWorkflowDetails(Workflow);
//         WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
//     local procedure OnAddWorkflowCategoriesToLibrary()
//     begin
//         WorkflowSetup.InsertWorkflowCategory(EmployeeAppraisalObjectivesWorkflowCategoryTxt, EmployeeAppraisalObjectivesWorkflowCategoryDescTxt);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
//     local procedure OnAfterInsertApprovalsTableRelations()
//     var
//         ApprovalEntry: Record "Approval Entry";
//     begin
//         WorkflowSetup.InsertTableRelation(Database::"Self Appraisal", 0, Database::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
//     local procedure OnInsertWorkflowTemplates()
//     begin
//         InsertEmployeeAppraisalObjectivesApprovalWorkflowTemplate();
//     end;
// }
