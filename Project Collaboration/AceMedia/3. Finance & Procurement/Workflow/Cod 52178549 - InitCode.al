codeunit 52178549 "Init Code"
{
    trigger OnRun()
    begin

    end;


    //*************************Cancelling Approvals*********************//////

    //Cancel "Prl-Approval"


    //Imprest 
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendImprestforApproval(VAR Imprest: Record "FIN-Imprest Header");
    begin
    end;

    procedure IsImprestEnabled(var Imprest: Record "FIN-Imprest Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(Imprest, WFCode.RunWorkflowOnSendImprestApprovalCode()))
    end;

    local procedure CheckImprestWorkflowEnabled(): Boolean
    var
        Imprest: Record "FIN-Imprest Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
             ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsImprestEnabled(Imprest) then
            Error(NoWorkflowEnb);
    end;
    //End of Imprest

    //Imprest Accounting
    //ImprestAcc Accounting Workflow
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendImprestAccforApproval(VAR ImprestAcc: Record "FIN-Imprest Surr. Header");
    begin
    end;

    procedure IsImprestAccEnabled(var ImprestAcc: Record "FIN-Imprest Surr. Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(ImprestAcc, WFCode.RunWorkflowOnSendImprestAccApprovalCode()))
    end;

    local procedure CheckImprestAccWorkflowEnabled(): Boolean
    var
        ImprestAcc: Record "FIN-Imprest Surr. Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
             ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsImprestAccEnabled(ImprestAcc) then
            Error(NoWorkflowEnb);
    end;


    //End of Imprest Accountion


    //payment Vouchers Approvals
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPVSforApproval(VAR PVS: Record "FIN-Payments Header");
    begin
    end;

    procedure IsPVSEnabled(var PVS: Record "FIN-Payments Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(PVS, WFCode.RunWorkflowOnSendPVSApprovalCode()))
    end;

    local procedure CheckWorkflowEnabled(): Boolean
    var
        PVS: Record "FIN-Payments Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsPVSEnabled(PVS) then
            Error(NoWorkflowEnb);
    end;
    //end pvs


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

    //Claims Workflow
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendClaimforApproval(VAR Claims: Record "FIN-Staff Claims Header");
    begin
    end;

    procedure IsClaimsEnabled(var Claims: Record "FIN-Staff Claims Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(Claims, WFCode.RunWorkflowOnSendClaimApprovalCode()))
    end;

    local procedure CheckClaimsWorkflowEnabled(): Boolean
    var
        Claims: Record "FIN-Staff Claims Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsClaimsEnabled(Claims) then
            Error(NoWorkflowEnb);
    end;

    //Store Requisition
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendSRNforApproval(VAR SRN: Record "PROC-Store Requistion Header");
    begin
    end;

    procedure IsSRNEnabled(var SRN: Record "PROC-Store Requistion Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(SRN, WFCode.RunWorkflowOnSendSRNApprovalCode()))
    end;

    local procedure CheckSRNWorkflowEnabled(): Boolean
    var
        SRN: Record "PROC-Store Requistion Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsSRNEnabled(SRN) then
            Error(NoWorkflowEnb);
    end;
    //"PROC-Store Requistion Header"

    //Inter Bank Transfer
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendInterBankforApproval(VAR InterBank: Record "FIN-InterBank Transfers");
    begin
    end;

    procedure IsInterBankEnabled(var InterBank: Record "FIN-InterBank Transfers"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(InterBank, WFCode.RunWorkflowOnSendInterBankApprovalCode()))
    end;

    local procedure CheckInterBankWorkflowEnabled(): Boolean
    var
        InterBank: Record "FIN-InterBank Transfers";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
             ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsInterBankEnabled(InterBank) then
            Error(NoWorkflowEnb);
    end;

    //End Inter Bank Transfer

    //Purchase Quotes
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPurchQuoteforApproval(VAR PurchQuote: Record "PROC-Purchase Quote Header");
    begin
    end;

    procedure IsPurchQuoteEnabled(var PurchQuote: Record "PROC-Purchase Quote Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(PurchQuote, WFCode.RunWorkflowOnSendPurchQuoteApprovalCode()))
    end;

    local procedure CheckPurchQuoteWorkflowEnabled(): Boolean
    var
        PurchQuote: Record "PROC-Purchase Quote Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
             ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsPurchQuoteEnabled(PurchQuote) then
            Error(NoWorkflowEnb);
    end;

    //End Purchase Quotes

    //Finance Memo Workflows
    //Memo 
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendMemoforApproval(VAR Memo: Record "FIN-Memo Header");
    begin
    end;

    procedure IsMemoEnabled(var Memo: Record "FIN-Memo Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(Memo, WFCode.RunWorkflowOnSendMemoApprovalCode()))
    end;

    local procedure CheckMemoWorkflowEnabled(): Boolean
    var
        Memo: Record "FIN-Memo Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type',
         ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsMemoEnabled(Memo) then
            Error(NoWorkflowEnb);
    end;
    //End of Memo

    //"Tender Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendTenderingProcessforApproval(VAR TenderingProcess: Record "Tender Header");
    begin
    end;

    procedure IsTenderingProcessEnabled(var TenderingProcess: Record "Tender Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(TenderingProcess, WFCode.RunWorkflowOnSendTenderingProcessApprovalCode()))
    end;

    local procedure CheckTenderingProcessWorkflowEnabled(): Boolean
    var
        TenderingProcess: Record "Tender Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsTenderingProcessEnabled(TenderingProcess) then
            Error(NoWorkflowEnb);
    end;

    //"Tender Header"

    //"NW-Boad Almanac View"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendBALCforApproval(VAR BALC: Record "NW-Boad Almanac View");
    begin
    end;

    procedure IsBALCEnabled(var BALC: Record "NW-Boad Almanac View"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(BALC, WFCode.RunWorkflowOnSendBALCApprovalCode()))
    end;

    local procedure CheckBALCWorkflowEnabled(): Boolean
    var
        BALC: Record "NW-Boad Almanac View";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsBALCEnabled(BALC) then
            Error(NoWorkflowEnb);
    end;

    //"NW-Boad Almanac View"

    //"NW-Board Payroll"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendBPRLforApproval(VAR BPRL: Record "NW-Board Payroll");
    begin
    end;

    procedure IsBPRLEnabled(var BPRL: Record "NW-Board Payroll"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(BPRL, WFCode.RunWorkflowOnSendBPRLApprovalCode()))
    end;

    local procedure CheckBPRLWorkflowEnabled(): Boolean
    var
        BPRL: Record "NW-Board Payroll";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsBPRLEnabled(BPRL) then
            Error(NoWorkflowEnb);
    end;

    //"NW-Board Payroll"

    //"Advance PettyCash Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendAdvPettyCashforApproval(VAR AdvPettyCash: Record "Advance PettyCash Header");
    begin
    end;

    procedure IsAdvPettyCashEnabled(var AdvPettyCash: Record "Advance PettyCash Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(AdvPettyCash, WFCode.RunWorkflowOnSendAdvPettyCashApprovalCode()))
    end;

    local procedure CheckAdvPettyCashWorkflowEnabled(): Boolean
    var
        AdvPettyCash: Record "Advance PettyCash Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsAdvPettyCashEnabled(AdvPettyCash) then
            Error(NoWorkflowEnb);
    end;

    //"Advance PettyCash Header"


    //"PettyCash Surrender Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendSurrPettyCashforApproval(VAR SurrPettyCash: Record "PettyCash Surrender Header");
    begin
    end;

    procedure IsSurrPettyCashEnabled(var SurrPettyCash: Record "PettyCash Surrender Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(SurrPettyCash, WFCode.RunWorkflowOnSendSurrPettyCashApprovalCode()))
    end;

    local procedure CheckSurrPettyCashWorkflowEnabled(): Boolean
    var
        SurrPettyCash: Record "PettyCash Surrender Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsSurrPettyCashEnabled(SurrPettyCash) then
            Error(NoWorkflowEnb);
    end;


    /// //////////////////************************CANCELLING OF PROCESSES**********************************/////////////////////
    //cancelling of payment vouchers
    [IntegrationEvent(false, false)]
    procedure OnCancelPVSForApproval(var PVS: Record "FIN-Payments Header")
    begin

    end;
    //End cancel of Payment vouchers

    //cancelling of Imprest
    [IntegrationEvent(false, false)]
    procedure OnCancelImprestForApproval(var Imprest: Record "FIN-Imprest Header")
    begin

    end;
    //End cancel of Imprest

    //Cancel "Advance PettyCash Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelAdvPettyCashforApproval(VAR AdvPettyCash: Record "Advance PettyCash Header");
    begin
    end;
    //End Cancel "Advance PettyCash Header"

    //cancelling of Cliam
    [IntegrationEvent(false, false)]
    procedure OnCancelClaimForApproval(VAR Claims: Record "FIN-Staff Claims Header")
    begin

    end;
    //End cancel of Claim

    //Cancel "Tender Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelTenderingProcessforApproval(VAR TenderingProcess: Record "Tender Header");
    begin
    end;
    //End Cancel "Tender Header"

    //Cancel ImprestAcc Accounting Workflow
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelImprestAccforApproval(VAR ImprestAcc: Record "FIN-Imprest Surr. Header");
    begin
    end;

    //End Imprest Accounting workflow

    //Cancel Store Requisition
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSRNforApproval(VAR SRN: Record "PROC-Store Requistion Header");
    begin
    end;

    //End Cancel Store Requisition
    //Cancel "NW-Boad Almanac View"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelBALCforApproval(VAR BALC: Record "NW-Boad Almanac View");
    begin
    end;
    //End Cancel "NW-Boad Almanac View"
    //Cancel "NW-Board Payroll"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelBPRLforApproval(VAR BPRL: Record "NW-Board Payroll");
    begin
    end;
    //End Cancel "NW-Board Payroll"

    //Cancel Inter Bank Transfer
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelInterBankforApproval(VAR InterBank: Record "FIN-InterBank Transfers");
    begin
    end;

    //End cancel interbank transfer

    //Cancel Purchase Quotes
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelPurchQuoteforApproval(VAR PurchQuote: Record "PROC-Purchase Quote Header");
    begin
    end;
    // End Cancel of purchase Quotes

    //Cancel Purchase Quotes
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelMemoforApproval(VAR Memo: Record "FIN-Memo Header");
    begin
    end;
    // End Cancel of purchase Quotes
    //Cancel "PettyCash Surrender Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelSurrPettyCashforApproval(VAR SurrPettyCash: Record "PettyCash Surrender Header");
    begin
    end;
    //End Cancel "PettyCash Surrender Header"
    //"PettyCash Surrender Header"
    //"Journal Voucher Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendJvsforApproval(VAR Jvs: Record "Journal Voucher Header");
    begin
    end;

    procedure IsJvsEnabled(var Jvs: Record "Journal Voucher Header"): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit "Workflow Code";
    begin
        exit(WFMngt.CanExecuteWorkflow(Jvs, WFCode.RunWorkflowOnSendJvsApprovalCode()))
    end;

    local procedure CheckJvsWorkflowEnabled(): Boolean
    var
        Jvs: Record "Journal Voucher Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';

    begin
        if not IsJvsEnabled(Jvs) then
            Error(NoWorkflowEnb);
    end;
    //Cancel "Journal Voucher Header"
    [IntegrationEvent(false, false)]
    PROCEDURE OnCancelJvsforApproval(VAR Jvs: Record "Journal Voucher Header");
    begin
    end;
    //End Cancel "Journal Voucher Header"
    //"Journal Voucher Header"



    ///////////////////////**************************POPULATE APPROVAL ENTRY AGRUMENT*****************////////////////////
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")
    var
        payHeader: Record "Fin-Payments Header";
        imprestHeader: Record "FIN-Imprest Header";
        InterBankTransfers: Record "FIN-InterBank Transfers";
        StaffClaims: Record "FIN-Staff Claims Header";
        StoreRequisition: Record "PROC-Store Requistion Header";
        PurchaseRequisition: Record "Purchase Header";
        Memo: Record "FIN-Memo Header";
        TenderingProcess: Record "Tender Header";
        AdvPettyCash: Record "Advance PettyCash Header";
        SurrPettyCash: Record "PettyCash Surrender Header";
        imprestSurrender: Record "FIN-Imprest Surr. Header";
        Boardalmanac: Record "Board Almanac";
        Boardprl: Record "NW-Board Payroll";
        purRfq: Record "PROC-Purchase Quote Header";

    begin
        case
            RecRef.Number of
            Database::"FIN-Payments Header":
                begin
                    RecRef.SetTable(payHeader);
                    ApprovalEntryArgument."Document No." := payHeader."No.";
                    if payHeader."Payment Type" = payHeader."Payment Type"::Normal then
                        //ApprovalEntryArgument.Amount:=payHeader."Advance Amount";
                        ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Payment Voucher"
                    else
                        ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Petty Cash";
                end;



            Database::"FIN-Imprest Header":
                begin
                    RecRef.SetTable(imprestHeader);
                    ApprovalEntryArgument."Document No." := imprestHeader."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Imprest;

                end;
            Database::"FIN-InterBank Transfers":
                begin
                    RecRef.SetTable(InterBankTransfers);
                    ApprovalEntryArgument."Document No." := InterBankTransfers.No;
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Bank Transfers"
                end;
            Database::"FIN-Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaims);
                    ApprovalEntryArgument."Document No." := StaffClaims."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Claims";
                end;
            Database::"PROC-Store Requistion Header":
                begin
                    RecRef.SetTable(StoreRequisition);
                    ApprovalEntryArgument."Document No." := StoreRequisition."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Store Requisitions";
                end;
            Database::"FIN-Memo Header":
                begin
                    RecRef.SetTable(Memo);
                    ApprovalEntryArgument."Document No." := Memo."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Memo;
                    ApprovalEntryArgument.Amount := Memo."Memo Value";
                end;
            Database::"Tender Header":
                begin
                    RecRef.SetTable(TenderingProcess);
                    ApprovalEntryArgument."Document No." := TenderingProcess."No.";
                    //  ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::
                end;
            Database::"Advance PettyCash Header":
                begin
                    RecRef.SetTable(AdvPettyCash);
                    ApprovalEntryArgument."Document No." := AdvPettyCash."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Petty Cash";
                    ApprovalEntryArgument.Amount := AdvPettyCash."Payment Amount";

                end;
            Database::"PettyCash Surrender Header":
                begin
                    RecRef.SetTable(SurrPettyCash);
                    ApprovalEntryArgument."Document No." := SurrPettyCash."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"PC Surrender";
                    ApprovalEntryArgument.Amount := SurrPettyCash.Amount;
                end;

            Database::"FIN-Imprest Surr. Header":
                begin
                    RecRef.SetTable(imprestSurrender);
                    ApprovalEntryArgument."Document No." := imprestSurrender."No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Imprest Surrender";
                    ApprovalEntryArgument.Amount := imprestSurrender.Amount;
                    ApprovalEntryArgument."Amount (LCY)" := imprestSurrender."Amount Surrendered LCY";
                end;
            Database::"Board Almanac":
                begin
                    RecRef.SetTable(Boardalmanac);
                    ApprovalEntryArgument."Document No." := Boardalmanac."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Boardalmanac;
                end;
            Database::"NW-Board Payroll":
                begin
                    RecRef.SetTable(Boardprl);
                    ApprovalEntryArgument."Document No." := Boardprl."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::BoardPrl;
                end;
            Database::"PROC-Purchase Quote Header":
                begin
                    RecRef.SetTable(purRfq);
                    ApprovalEntryArgument."Document No." := purRfq."No.";
                    //ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::BoardPrl;
                end;
        end;
    end;



    //////////////////////**************************END OF POPULATE APPROVAL ENTRY AGRUMENT*****************////////////////////




    var
        DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.',
          Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
        PendingApprovalMsg: Label 'An approval request has been sent.';

}