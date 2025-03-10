codeunit 52179079 "Emp Req Work Flow Code"
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        //Emp Start
        SendEmpReq: TextConst ENU = 'Approval Request for Employee Requisition is requested',
                                ENG = 'Approval Request for Employee Requisition is requested';
        AppReqEmp: TextConst ENU = 'Approval Request for Employee Requisition is approved',
                                ENG = 'Approval Request for Employee Requisition is approved';
        RejReqEmp: TextConst ENU = 'Approval Request for Employee Requisition is rejected',
                                ENG = 'Approval Request for Employee Requisition is rejected';
        DelReqEmp: TextConst ENU = 'Approval Request for Employee Requisition is delegated',
                                ENG = 'Approval Request for Employee Requisition is delegated';
        CancelEmp: TextConst ENU = 'Approval Request for Employee Requisition is Cancelled By User',
                                ENG = 'Approval Request for Employee Requisition is Cancelled By User';
        SendEmpForPendAppTxt: TextConst ENU = 'Status of Employee Requisition changed to Pending approval',
                                        ENG = 'Status of Employee Requisition changed to Pending approval';
        ReleaseEmpTxt: TextConst ENU = 'Release Employee Requisition ', ENG = 'Release Employee Requisition ';
        ReOpenEmpTxt: TextConst ENU = 'ReOpen Employee Requisition ', ENG = 'ReOpen Employee Requisition ';


    //Emp
    procedure RunWorkflowOnSendEmpApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendEmpApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EmpReqIntCodeunit", 'OnSendEmpReqforApproval', '', false, false)]
    procedure RunWorkflowOnSendEmpApproval(var EmpReq: Record "HRM-Employee Requisitions")
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendEmpApprovalCode(), EmpReq);
    end;

    procedure RunWorkflowOnApproveEmpApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveEmpApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveEmpApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveEmpApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectEmpApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectEmpApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectEmpApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectEmpApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateEmpApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateEmpApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateEmpApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateEmpApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnCancelEmpApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelEmpApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"EmpReqIntCodeunit", 'OnCancelEmpReqforApproval', '', false, false)]
    procedure RunWorkflowOnCancelEmpApproval(var EmpReqReq: Record "HRM-Employee Requisitions")
    begin
        WFMngt.HandleEvent(RunWorkflowOnCancelEmpApprovalCode(), EmpReqReq);
    end;

    procedure SetStatusToPendingApprovalCodeEmp(): Code[128]
    begin
        exit(UpperCase('Set Status To PendingApproval on Emp'));
    end;

    procedure SetStatusToPendingApprovalEmp(var Variant: Variant)
    var
        RecRef: RecordRef;
        Emp: Record "HRM-Employee Requisitions";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"HRM-Employee Requisitions":
                begin
                    RecRef.SetTable(Emp);
                    Emp.Validate(Status, Emp.Status::"Pending Approval");
                    Emp.Modify();
                    Variant := Emp;
                end;
        end;
    end;

    procedure ReleaseEmpCode(): Code[128]
    begin
        exit(UpperCase('Release Emp Requisition'));
    end;

    procedure ReleaseEmp(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Emp: Record "HRM-Employee Requisitions";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseEmp(Variant);
                end;
            DATABASE::"HRM-Employee Requisitions":
                begin
                    RecRef.SetTable(Emp);
                    Emp.Validate(Status, Emp.Status::Approved);
                    emp.Advertised := true;
                    Emp.Modify();
                    Variant := Emp;
                end;
        end;
    end;

    procedure ReOpenEmpCode(): Code[128]
    begin
        exit(UpperCase('ReOpen Emp'));
    end;

    procedure ReOpenEmp(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Emp: Record "HRM-Employee Requisitions";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenEmp(Variant);
                end;
            DATABASE::"HRM-Employee Requisitions":
                begin
                    RecRef.SetTable(Emp);
                    Emp.Validate(Status, Emp.Status::New);
                    Emp.Modify();
                    Variant := Emp;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddEmpEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendEmpApprovalCode(), Database::"HRM-Employee Requisitions", SendEmpReq, 0, false);

        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveEmpApprovalCode(), Database::"Approval Entry", AppReqEmp, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveEmpApprovalCode(), Database::"Approval Entry", ReOpenEmpTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectEmpApprovalCode(), Database::"Approval Entry", RejReqEmp, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateEmpApprovalCode(), Database::"Approval Entry", DelReqEmp, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelEmpApprovalCode(), Database::"Approval Entry", CancelEmp, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddEmpRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeEmp(), 0, SendEmpForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseEmpCode(), 0, ReleaseEmpTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenEmpCode(), 0, ReOpenEmpTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForEmp(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeEmp():
                    begin
                        SetStatusToPendingApprovalEmp(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseEmpCode():
                    begin
                        ReleaseEmp(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenEmpCode():
                    begin
                        ReOpenEmp(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;




}
