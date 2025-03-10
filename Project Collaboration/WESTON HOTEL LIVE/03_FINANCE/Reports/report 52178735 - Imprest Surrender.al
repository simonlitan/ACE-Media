report 52178735 "Imprest Surrender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/ImprestAccounting.rdl';

    dataset
    {
        dataitem(impSurrHead; "FIN-Imprest Surr. Header")
        {
            RequestFilterFields = No, "Surrender Date";
            column(No_ImprestSurrenderHeader; impSurrHead.No)
            {
            }




            column(CompanyInfoName; CompInf.Name)
            {
            }
            column(CompanyInfoAddress; CompInf.Address)
            {
            }
            column(CompanyInfoPicture; CompInf.Picture)
            {
            }
            column(CompanyInfoPhone1; CompInf."Phone No.")
            {
            }
            column(CompanyInfoPhone2; CompInf."Contact Person")
            {
            }
            column(CompanyInfoAdress; CompInf.Address)
            {
            }
            column(CompanyInfoPostal; CompInf."Post Code")
            {
            }
            column(CompanyInfoEmail; CompInf."E-Mail")
            {
            }
            column(CompanyInfoWebpage; CompInf."Home Page")
            {
            }
            column(CompanyInfoCity; CompInf.City)
            {
            }



            column(Cashier_ImprestSurrenderHeader; impSurrHead.Cashier)
            {
            }
            column(SurrenderDate_ImprestSurrenderHeader; impSurrHead."Surrender Date")
            {
            }
            column(Type_ImprestSurrenderHeader; impSurrHead.Type)
            {
            }
            column(PayMode_ImprestSurrenderHeader; impSurrHead."Pay Mode")
            {
            }
            column(ChequeNo_ImprestSurrenderHeader; impSurrHead."Cheque No")
            {
            }
            column(ChequeDate_ImprestSurrenderHeader; impSurrHead."Cheque Date")
            {
            }
            column(ChequeType_ImprestSurrenderHeader; impSurrHead."Cheque Type")
            {
            }
            column(BankCode_ImprestSurrenderHeader; impSurrHead."Bank Code")
            {
            }
            column(ReceivedFrom_ImprestSurrenderHeader; impSurrHead."Received From")
            {
            }
            column(OnBehalfOf_ImprestSurrenderHeader; impSurrHead."On Behalf Of")
            {
            }

            column(AccountType_ImprestSurrenderHeader; impSurrHead."Account Type")
            {
            }
            column(AccountNo_ImprestSurrenderHeader; impSurrHead."Account No.")
            {
            }
            column(NoSeries_ImprestSurrenderHeader; impSurrHead."No. Series")
            {
            }
            column(AccountName_ImprestSurrenderHeader; impSurrHead."Account Name")
            {
            }
            column(Posted_ImprestSurrenderHeader; impSurrHead.Posted)
            {
            }
            column(DatePosted_ImprestSurrenderHeader; impSurrHead."Date Posted")
            {
            }
            column(TimePosted_ImprestSurrenderHeader; impSurrHead."Time Posted")
            {
            }
            column(PostedBy_ImprestSurrenderHeader; impSurrHead."Posted By")
            {
            }
            column(Amount_ImprestSurrenderHeader; impSurrHead.Amount)
            {
            }
            column(Remarks_ImprestSurrenderHeader; impSurrHead.Remarks)
            {
            }
            column(TransactionName_ImprestSurrenderHeader; impSurrHead."Transaction Name")
            {
            }
            column(NetAmount_ImprestSurrenderHeader; impSurrHead."Net Amount")
            {
            }
            column(PayingBankAccount_ImprestSurrenderHeader; impSurrHead."Paying Bank Account")
            {
            }
            column(Payee_ImprestSurrenderHeader; impSurrHead.Payee)
            {
            }
            column(GlobalDimension1Code_ImprestSurrenderHeader; impSurrHead."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ImprestSurrenderHeader; impSurrHead."Global Dimension 2 Code")
            {
            }
            column(BankAccountNo_ImprestSurrenderHeader; impSurrHead."Bank Account No")
            {
            }
            column(CashierBankAccount_ImprestSurrenderHeader; impSurrHead."Cashier Bank Account")
            {
            }
            column(Status_ImprestSurrenderHeader; impSurrHead.Status)
            {
            }
            column(Grouping_ImprestSurrenderHeader; impSurrHead.Grouping)
            {
            }
            column(PaymentType_ImprestSurrenderHeader; impSurrHead."Payment Type")
            {
            }
            column(BankType_ImprestSurrenderHeader; impSurrHead."Bank Type")
            {
            }
            column(PVType_ImprestSurrenderHeader; impSurrHead."PV Type")
            {
            }
            column(ApplytoID_ImprestSurrenderHeader; impSurrHead."Apply to ID")
            {
            }
            column(NoPrinted_ImprestSurrenderHeader; impSurrHead."No. Printed")
            {
            }
            column(ImprestIssueDate_ImprestSurrenderHeader; impSurrHead."Imprest Issue Date")
            {
            }
            column(Surrendered_ImprestSurrenderHeader; impSurrHead.Surrendered)
            {
            }
            column(ImprestIssueDocNo_ImprestSurrenderHeader; impSurrHead."Imprest Issue Doc. No")
            {
            }
            column(VoteBook_ImprestSurrenderHeader; impSurrHead."Vote Book")
            {
            }
            column(TotalAllocation_ImprestSurrenderHeader; impSurrHead."Total Allocation")
            {
            }
            column(TotalExpenditure_ImprestSurrenderHeader; impSurrHead."Total Expenditure")
            {
            }
            column(TotalCommitments_ImprestSurrenderHeader; impSurrHead."Total Commitments")
            {
            }
            column(Balance_ImprestSurrenderHeader; impSurrHead.Balance)
            {
            }
            column(BalanceLessthisEntry_ImprestSurrenderHeader; impSurrHead."Balance Less this Entry")
            {
            }
            column(PettyCash_ImprestSurrenderHeader; impSurrHead."Petty Cash")
            {
            }
            column(ShortcutDimension2Code_ImprestSurrenderHeader; impSurrHead."Shortcut Dimension 2 Code")
            {
            }
            column(FunctionName_ImprestSurrenderHeader; impSurrHead."Function Name")
            {
            }
            column(BudgetCenterName_ImprestSurrenderHeader; impSurrHead."Budget Center Name")
            {
            }
            column(UserID_ImprestSurrenderHeader; impSurrHead."User ID")
            {
            }
            column(IssueVoucherType_ImprestSurrenderHeader; impSurrHead."Issue Voucher Type")
            {
            }
            column(ShortcutDimension3Code_ImprestSurrenderHeader; impSurrHead."Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code_ImprestSurrenderHeader; impSurrHead."Shortcut Dimension 4 Code")
            {
            }
            column(Dim3_ImprestSurrenderHeader; impSurrHead.Dim3)
            {
            }
            column(Dim4_ImprestSurrenderHeader; impSurrHead.Dim4)
            {
            }
            column(CurrencyFactor_ImprestSurrenderHeader; impSurrHead."Currency Factor")
            {
            }
            column(CurrencyCode_ImprestSurrenderHeader; impSurrHead."Currency Code")
            {
            }
            column(ResponsibilityCenter_ImprestSurrenderHeader; impSurrHead."Responsibility Center")
            {
            }
            column(AmountSurrenderedLCY_ImprestSurrenderHeader; impSurrHead."Amount Surrendered LCY")
            {
            }
            column(PVNo_ImprestSurrenderHeader; impSurrHead."PV No")
            {
            }
            column(PrintNo_ImprestSurrenderHeader; impSurrHead."Print No.")
            {
            }
            column(CashSurrenderAmt_ImprestSurrenderHeader; impSurrHead."Cash Surrender Amt")
            {
            }
            column(FinancialPeriod_ImprestSurrenderHeader; impSurrHead."Financial Period")
            {
            }
            column(CompanyName; CompInf.Name)
            {
            }
            column(CompanyPicture; CompInf.Picture)
            {
            }
            column(CompanyEMail; CompInf."E-Mail")
            {

            }
            column(Companyhomepage; CompInf."Home Page")
            {

            }
            column(CompanyAddr1; CompInf.Address)
            {
            }
            column(CompanyAddr2; CompInf."Address 2")
            {
            }
            column(CompanyPhone; CompInf."Phone No.")
            {
            }
            column(CompanyName2; CompInf."Name 2")
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            column(ssign; userSet."User Signature")
            {

            }
            column(utitle; userSet."Approval Title")
            {

            }

            dataitem(ImpSurrDetails; "FIN-Imprest Surrender Details")
            {
                DataItemLink = "Surrender Doc No." = FIELD(No);
                column(SurrenderDocNo_ImprestSurrenderDetails; "Surrender Doc No.")
                {
                }
                column(AccountNo_ImprestSurrenderDetails; "Account No:")
                {
                }
                column(AccountName_ImprestSurrenderDetails; "Account Name")
                {
                }
                column(Amount_ImprestSurrenderDetails; Amount)
                {
                }
                column(DueDate_ImprestSurrenderDetails; "Due Date")
                {
                }
                column(ImprestHolder_ImprestSurrenderDetails; "Imprest Holder")
                {
                }
                column(ActualSpent_ImprestSurrenderDetails; "Actual Spent")
                {
                }
                column(Applyto_ImprestSurrenderDetails; "Apply to")
                {
                }
                column(ApplytoID_ImprestSurrenderDetails; "Apply to ID")
                {
                }
                column(SurrenderDate_ImprestSurrenderDetails; "Surrender Date")
                {
                }
                column(Surrendered_ImprestSurrenderDetails; Surrendered)
                {
                }
                column(CashReceiptNo_ImprestSurrenderDetails; "Cash Receipt No")
                {
                }
                column(DateIssued_ImprestSurrenderDetails; "Date Issued")
                {
                }
                column(TypeofSurrender_ImprestSurrenderDetails; "Type of Surrender")
                {
                }
                column(DeptVchNo_ImprestSurrenderDetails; "Dept. Vch. No.")
                {
                }
                column(CashSurrenderAmt_ImprestSurrenderDetails; "Cash Surrender Amt")
                {
                }
                column(BankPettyCash_ImprestSurrenderDetails; "Bank/Petty Cash")
                {
                }
                column(DocNo_ImprestSurrenderDetails; "Doc No.")
                {
                }
                column(ShortcutDimension1Code_ImprestSurrenderDetails; "Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_ImprestSurrenderDetails; "Shortcut Dimension 2 Code")
                {
                }
                column(ShortcutDimension3Code_ImprestSurrenderDetails; "Shortcut Dimension 3 Code")
                {
                }
                column(ShortcutDimension4Code_ImprestSurrenderDetails; "Shortcut Dimension 4 Code")
                {
                }
                column(ShortcutDimension5Code_ImprestSurrenderDetails; "Shortcut Dimension 5 Code")
                {
                }
                column(ShortcutDimension6Code_ImprestSurrenderDetails; "Shortcut Dimension 6 Code")
                {
                }
                column(ShortcutDimension7Code_ImprestSurrenderDetails; "Shortcut Dimension 7 Code")
                {
                }
                column(ShortcutDimension8Code_ImprestSurrenderDetails; "Shortcut Dimension 8 Code")
                {
                }
                column(VATProdPostingGroup_ImprestSurrenderDetails; "VAT Prod. Posting Group")
                {
                }
                column(ImprestType_ImprestSurrenderDetails; "Imprest Type")
                {
                }
                column(CurrencyFactor_ImprestSurrenderDetails; "Currency Factor")
                {
                }
                column(CurrencyCode_ImprestSurrenderDetails; "Currency Code")
                {
                }
                column(AmountLCY_ImprestSurrenderDetails; "Amount LCY")
                {
                }
                column(CashSurrenderAmtLCY_ImprestSurrenderDetails; "Cash Surrender Amt LCY")
                {
                }
                column(ImprestReqAmtLCY_ImprestSurrenderDetails; "Imprest Req Amt LCY")
                {
                }
                column(CashReceiptAmount_ImprestSurrenderDetails; "Cash Receipt Amount")
                {
                }
                column(ChequeDepositSlipNo_ImprestSurrenderDetails; "Cheque/Deposit Slip No")
                {
                }
                column(ChequeDepositSlipDate_ImprestSurrenderDetails; "Cheque/Deposit Slip Date")
                {
                }
                column(ChequeDepositSlipType_ImprestSurrenderDetails; "Cheque/Deposit Slip Type")
                {
                }
                column(ChequeDepositSlipBank_ImprestSurrenderDetails; "Cheque/Deposit Slip Bank")
                {
                }
                column(CashPayMode_ImprestSurrenderDetails; "Cash Pay Mode")
                {
                }
                column(OverExpenditure_ImprestSurrenderDetails; "Over Expenditure")
                {
                }


                dataitem(ApprovalEntry; "Approval Entry")
                {
                    DataItemLink = "Document No." = FIELD("Surrender Doc No.");
                    DataItemTableView = WHERE(Status = CONST(Approved));
                    column(ApproverID_ApprovalEntry; ApprovalEntry."Approver ID")
                    {
                    }
                    column(LastDateTimeModified_ApprovalEntry; ApprovalEntry."Last Date-Time Modified")
                    {
                    }
                    column(Sender_ID; "Sender ID")
                    {

                    }

                    dataitem(UserSetUp; "User Setup")
                    {
                        DataItemLink = "User ID" = FIELD("Approver ID");
                        column(Signature_UserSetup; UserSetUp."User Signature")
                        {
                        }
                        column(ApprovalDesignation_UserSetup; UserSetUp."Approval Title")
                        {
                        }
                        trigger OnPreDataItem()
                        begin
                            ApprovalEntry.SETRANGE(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
                            ApprovalEntry.SetFilter(ApprovalEntry."Approver ID", '<>%1', impSurrHead.Cashier);
                        end;
                    }
                }


                trigger OnAfterGetRecord()
                begin
                    InitTextVariable;
                    FormatNoText(NumberText, "Actual Spent", CurrencyCodeText);
                    //impSurrHead.CalcFields(Amount);
                end;
            }

            trigger OnPreDataItem()
            begin
                CompInf.GET;
                CompInf.CALCFIELDS(CompInf.Picture);

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

    var
        budgetbal: Decimal;
        GLAccount: Record "G/L Account";
        budgetname: Text[100];
        userSet: Record "User Setup";
        CompInf: Record "Company Information";
        CheckReport: Report Check;

        NumberText: array[2] of Text[1024];
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        CurrencyCodeText: Code[10];

        Text000: Label 'Preview is not allowed.';
        TXT002: Label '%1, %2 %3';
        Text001: Label 'Last Check No. must be filled in.';
        Text002: Label 'Filters on %1 and %2 are not allowed.';
        Text003: Label 'XXXXXXXXXXXXXXXX';
        Text004: Label 'must be entered.';
        Text005: Label 'The Bank Account and the General Journal Line must have the same currency.';
        Text006: Label 'Salesperson';
        Text007: Label 'Purchaser';
        Text008: Label 'Both Bank Accounts must have the same currency.';
        Text009: Label 'Our Contact';
        Text010: Label 'XXXXXXXXXX';
        Text011: Label 'XXXX';
        Text012: Label 'XX.XXXXXXXXXX.XXXX';
        Text013: Label '%1 already exists.';
        Text014: Label 'Check for %1 %2';
        Text015: Label 'Payment';
        Text016: Label 'In the Check report, One Check per Vendor and Document No.\';
        Text017: Label 'must not be activated when Applies-to ID is specified in the journal lines.';
        Text018: Label 'XXX';
        Text019: Label 'Total';
        Text020: Label 'The total amount of check %1 is %2. The amount must be positive.';
        Text021: Label 'VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID VOID';
        Text022: Label 'NON-NEGOTIABLE';
        Text023: Label 'Test print';
        Text024: Label 'XXXX.XX';
        Text025: Label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        Text026: Label 'ZERO';
        Text027: Label 'HUNDRED';
        Text028: Label 'AND';
        Text029: Label '%1 results in a written number that is too long.';
        Text030: Label ' is already applied to %1 %2 for customer %3.';
        Text031: Label ' is already applied to %1 %2 for vendor %3.';
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'MILLION';
        Text061: Label 'BILLION';
        Text062: Label 'G/L Account,Customer,Vendor,Bank Account';
        Text063: Label 'Net Amount %1';
        Text064: Label '%1 must not be %2 for %3 %4.';



    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '**';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        else begin
            for Exponent := 4 downto 1 do begin
                PrintExponent := false;
                Ones := No div Power(1000, Exponent - 1);
                Hundreds := Ones div 100;
                Tens := (Ones mod 100) div 10;
                Ones := Ones mod 10;
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;
        end;

        if CurrencyCode = '' then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' KENYA SHILLINGS');
            if No <> 0 then begin
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
                //Translate KOBO to words
                if (No * 100) > 0 then begin
                    No := No * 100;
                    for Exponent := 4 downto 1 do begin
                        PrintExponent := false;
                        Ones := No div Power(1000, Exponent - 1);
                        Hundreds := Ones div 100;
                        Tens := (Ones mod 100) div 10;
                        Ones := Ones mod 10;
                        if Hundreds > 0 then begin
                            AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                            AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                        end;
                        if Tens >= 2 then begin
                            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                            if Ones > 0 then
                                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                        end else
                            if (Tens * 10 + Ones) > 0 then
                                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                        if PrintExponent and (Exponent > 1) then
                            AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                        No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
                    end;
                end;
                //
                //AddToNoText(NoText,NoTextIndex,PrintExponent,FORMAT(No * 100) + ' KOBO');
                AddToNoText(NoText, NoTextIndex, PrintExponent, ' CENTS');
            end;
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ONLY****');
        end;
        if CurrencyCode <> '' then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);
            if No <> 0 then begin
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
                AddToNoText(NoText, NoTextIndex, PrintExponent, Format(No * 100) + ' CENTS');
            end;
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ONLY');
        end;
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := true;

        while StrLen(NoText[NoTextIndex] + ' ' + AddText) > MaxStrLen(NoText[1]) do begin
            NoTextIndex := NoTextIndex + 1;
            if NoTextIndex > ArrayLen(NoText) then
                Error(Text029, AddText);
        end;

        NoText[NoTextIndex] := DelChr(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;


    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;
}
