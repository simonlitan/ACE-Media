codeunit 52178528 "bank recon post"
{

    TableNo = "Bank Acc. Reconciliation";

    trigger OnRun()
    begin
        if BankAccReconPostYesNo(Rec) then;
    end;

    var
        PostReconciliationQst: Label 'Do you want to post the Reconciliation?';
        PostPaymentsOnlyQst: Label 'Do you want to post the payments?';
        PostPaymentsAndReconcileQst: Label 'Do you want to post the payments and reconcile the bank account?';

    procedure BankAccReconPostYesNo(var BankAccReconciliation: Record "Bank Acc. Reconciliation") Result: Boolean
    var
        BankAccRecon: Record "Bank Acc. Reconciliation";
        Question: Text;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeBankAccReconPostYesNo(BankAccReconciliation, Result, IsHandled);
        if IsHandled then
            exit(Result);

        BankAccRecon.Copy(BankAccReconciliation);

        if BankAccRecon."Statement Type" = BankAccRecon."Statement Type"::"Payment Application" then
            if BankAccRecon."Post Payments Only" then
                Question := PostPaymentsOnlyQst
            else
                Question := PostPaymentsAndReconcileQst
        else
            Question := PostReconciliationQst;

        if not Confirm(Question, false) then
            exit(false);

        // CODEUNIT.Run(CODEUNIT::"Bank Acc. Reconciliation Post", BankAccRecon);
        BankAccReconciliation := BankAccRecon;
        exit(true);
    end;

    procedure RunPreview(BankAccReconciliation: Record "Bank Acc. Reconciliation"): Boolean
    begin
        Error('Procedure RunPreview not implemented.');
    end;

    [IntegrationEvent(false, false)]
    procedure OnBeforeBankAccReconPostYesNo(var BankAccReconciliation: Record "Bank Acc. Reconciliation"; var Result: Boolean; var Handled: Boolean)
    begin
    end;
}
