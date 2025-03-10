report 52178580 "Bank Acc. Recon. - Manuals"
{
    DefaultLayout = RDLC;
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Reports/SSR/BankAccReconManuals1.rdl';
    Caption = 'Bank Acc. Recon. - Test';

    dataset
    {
        dataitem("Bank Acc. Reconciliation"; "Bank Acc. Reconciliation")
        {
            RequestFilterFields = "Statement Type", "Bank Account No.", "Statement No.";
            column(BankCode; BankCode)
            {
            }
            column(BankAccountNo_BankAccReconciliation; "Bank Acc. Reconciliation"."Bank Account No.")
            {
            }
            column(StatementNo_BankAccReconciliation; "Bank Acc. Reconciliation"."Statement No.")
            {
            }
            column(StatementDate_BankAccReconciliation; "Bank Acc. Reconciliation"."Statement Date")
            {
            }
            column(TotalBalanceonBankAccount_BankAccReconciliation; "Bank Acc. Reconciliation"."Total Applied Amount")
            {
            }
            column(TotalAppliedAmount_BankAccReconciliation; "Bank Acc. Reconciliation"."Total Transaction Amount")
            {
            }
            column(TotalTransactionAmount_BankAccReconciliation; "Bank Acc. Reconciliation"."Total Transaction Amount")
            {
            }
            column(BankAccountNo; BankAccountNo)
            {
            }
            column(StatementEndingBalance_BankAccReconciliation; "Bank Acc. Reconciliation"."Statement Ending Balance")
            {
            }
            column(TotalDifference; TotalDifference)
            {
            }
            column(BankName; BankName)
            {
            }
            column(BankAccountBalanceasperCashBook; BankAccountBalanceasperCashBook)
            {
            }
            column(UnpresentedChequesTotal; UnpresentedChequesTotal)
            {
            }
            column(UncreditedBanking; UncreditedBanking)
            {
            }
            column(ReconciliationStatement; ReconciliationStatement)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(TotalDifferenceUncredited; TotalDifferenceUncredited)
            {
            }
            column(TotalDifferenceUnPresented; TotalDifferenceUnPresented)
            {
            }
            column(Reconciled_CasBookBal; BankAccountBalanceasperCashBook + UnpresentedChequesTotal - UncreditedBanking)
            {
            }
            column(DifferenceToExplain; DifferenceToExplain)
            {
            }
            column(ShowReviewers; ShowReviewers)
            {
            }
            dataitem("Bank Acc. Reconciliation Line"; 274)
            {
                DataItemLink = "Bank Account No." = FIELD("Bank Account No."),
                               "Statement No." = FIELD("Statement No.");
                // DataItemTableView = WHERE(Reconciled = CONST(false));
                column(CheckNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Check No.")
                {
                }
                column(DocumentNo_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Document No.")
                {
                }
                column(TransactionDate_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Transaction Date")
                {
                }
                column(Description_BankAccReconciliationLine; "Bank Acc. Reconciliation Line".Description)
                {
                }
                column(StatementAmount_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Statement Amount")
                {
                }
                column(OpenType_BankAccReconciliationLine; "Bank Acc. Reconciliation Line"."Open Type")
                {
                }
                column(Reconciled_BankAccReconciliationLine; "Bank Acc. Reconciliation Line".Reconciled)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //  IF  "Bank Account Statement Line"."Statement Amount">0 THEN CurrReport.SKIP;
                    IF ("Bank Acc. Reconciliation Line"."Statement Amount" > 0) AND ("Bank Acc. Reconciliation Line"."Document No." <> '') THEN
                        "Bank Acc. Reconciliation Line"."Open Type" := "Bank Acc. Reconciliation Line"."Open Type"::Uncredited;
                    IF ("Bank Acc. Reconciliation Line"."Statement Amount" < 0) AND ("Bank Acc. Reconciliation Line"."Document No." <> '') THEN
                        "Bank Acc. Reconciliation Line"."Open Type" := "Bank Acc. Reconciliation Line"."Open Type"::Unpresented;
                    IF "Bank Acc. Reconciliation Line"."Document No." = '' THEN
                        "Bank Acc. Reconciliation Line"."Open Type" := "Bank Acc. Reconciliation Line"."Open Type"::Manual;
                    "Bank Acc. Reconciliation Line".MODIFY;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                BankCode := '';
                BankAccountNo := '';
                BankName := '';
                BankAccountBalanceasperCashBook := 0;
                UnpresentedChequesTotal := 0;
                UncreditedBanking := 0;

                TotalDiffFunc();

                Bank.RESET;
                Bank.SETRANGE(Bank."No.", "Bank Account No.");
                IF Bank.FIND('-') THEN BEGIN
                    BankCode := Bank."No.";
                    BankAccountNo := Bank."Bank Account No.";
                    BankName := Bank.Name;
                    Bank.SETRANGE(Bank."Date Filter", 0D, "Statement Date");
                    Bank.CALCFIELDS(Bank.Balance);
                    BankAccountBalanceasperCashBook := Bank.Balance;

                    //DifferenceToExplain

                    DifferenceToExplain := ABS("Bank Acc. Reconciliation"."Statement Ending Balance" - BankAccountBalanceasperCashBook);

                    BankStatementLine.RESET;
                    BankStatementLine.SETRANGE(BankStatementLine."Bank Account No.", Bank."No.");
                    BankStatementLine.SETRANGE(BankStatementLine."Statement No.", "Statement No.");
                    BankStatementLine.SETRANGE(BankStatementLine.Reconciled, FALSE);
                    IF BankStatementLine.FIND('-') THEN
                        REPEAT
                            IF (BankStatementLine."Statement Amount" < 0) AND (BankStatementLine."Document No." <> '') THEN
                                UnpresentedChequesTotal := UnpresentedChequesTotal + BankStatementLine."Statement Amount"
                            ELSE
                                IF (BankStatementLine."Statement Amount" > 0) AND (BankStatementLine."Document No." <> '') THEN
                                    UncreditedBanking := UncreditedBanking + BankStatementLine."Statement Amount";
                        UNTIL BankStatementLine.NEXT = 0;
                    UnpresentedChequesTotal := UnpresentedChequesTotal * -1;

                    BankStatBalance := "Bank Acc. Reconciliation"."Statement Ending Balance";
                    Bal := (BankAccountBalanceasperCashBook + UnpresentedChequesTotal - UncreditedBanking) + TotalDifference
                    /*+(UncreditedBanking-UnpresentedChequesTotal)*/;

                    IF Bal = BankStatBalance THEN
                        ReconciliationStatement := ''
                    ELSE
                        ReconciliationStatement := 'Reconciliation is incomplete please go through it again';
                END;

                //MESSAGE('Bal is %1',Bal);
                //MESSAGE('BankStatBalance is %1',BankStatBalance);

            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                // Hide some columns
                ShowReviewers := FALSE;
                // IF CompanyInfo.Company = CompanyInfo.Company::Fund THEN
                //     ShowReviewers := TRUE;

                ReconciliationStatement := 'Reconciliation is incomplete please go through it again';
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        //BankAccReconFilter := "Bank Acc. Reconciliation".GETFILTERS;
    end;

    var
        Text000: Label '%1 must be specified.';
        Text001: Label '%1 is not equal to Total Balance.';
        Text002: Label '%1 must be %2 for %3 %4.';
        Text003: Label '%1 %2 does not exist.';
        Text004: Label '%1 must be %2.';
        Text005: Label 'Application is wrong.';
        Text006: Label 'The total difference is %1. It must be %2.';
        Bank: Record "Bank Account";
        BankCode: Code[20];
        BankAccountNo: Code[20];
        BankName: Text;
        BankAccountBalanceasperCashBook: Decimal;
        UnpresentedChequesTotal: Decimal;
        UncreditedBanking: Decimal;
        BankStatementLine: Record "Bank Acc. Reconciliation Line";
        CompanyInfo: Record "Company Information";
        ReconciliationStatement: Text;
        TotalDifference: Decimal;
        BankRecPresented: Record "Bank Acc. Reconciliation Line";
        BankRecUnPresented: Record "Bank Acc. Reconciliation Line";
        BankStatBalance: Decimal;
        Bank_Account_Statement___TestCaptionLbl: Label 'Bank Account Statement - Test';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Bank_Acc__Reconciliation___Balance_Last_Statement_CaptionLbl: Label 'Balance Last Statement';
        Bank_Acc__Reconciliation___Statement_Date_CaptionLbl: Label 'Statement Date';
        Bank_Acc__Reconciliation___Statement_Ending_Balance_CaptionLbl: Label 'Statement Ending Balance';
        ErrorText_Number_CaptionLbl: Label 'Warning!';
        Bank_Acc__Reconciliation_Line__Transaction_Date_CaptionLbl: Label 'Transaction Date';
        Bank_Acc__Reconciliation_Line__Value_Date_CaptionLbl: Label 'Value Date';
        TotalsCaptionLbl: Label 'Totals';
        ErrorText_Number__Control97CaptionLbl: Label 'Warning!';
        ErrorText_Number__Control31CaptionLbl: Label 'Warning!';
        Bal: Decimal;
        TotalDifferenceUncredited: Decimal;
        TotalDifferenceUnPresented: Decimal;
        DifferenceToExplain: Decimal;
        ShowReviewers: Boolean;

    local procedure AddError(Text: Text[250])
    begin
        //ErrorCounter := ErrorCounter + 1;
        //ErrorText[ErrorCounter] := Text;
    end;

    procedure TotalDiffFunc()
    begin
        BankRecPresented.RESET;
        BankRecPresented.SETRANGE(BankRecPresented."Bank Account No.", "Bank Acc. Reconciliation"."Bank Account No.");
        BankRecPresented.SETRANGE(BankRecPresented."Statement No.", "Bank Acc. Reconciliation"."Statement No.");
        BankRecPresented.SETRANGE(BankRecPresented."Document No.", '');
        IF BankRecPresented.FIND('-') THEN BEGIN
            REPEAT
                TotalDifference := TotalDifference + BankRecPresented."Statement Amount";
                IF BankRecPresented."Statement Amount" > 0 THEN
                    TotalDifferenceUncredited := TotalDifferenceUncredited + BankRecPresented."Statement Amount"
                ELSE
                    IF BankRecPresented."Statement Amount" < 0 THEN
                        TotalDifferenceUnPresented := TotalDifferenceUnPresented + BankRecPresented."Statement Amount";


            //MESSAGE('TotalDifferenceUnPresented %1',TotalDifferenceUnPresented);
            //MESSAGE('TotalDifferenceUncredited %1',TotalDifferenceUncredited);
            //MESSAGE('TotalDifference%1',TotalDifference);


            UNTIL BankRecPresented.NEXT = 0;
        END;
    end;
}

