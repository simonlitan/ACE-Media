codeunit 52178503 "Cust. Entry-SetAppl.ID3"
{
    Permissions = TableData "Cust. Ledger Entry" = imd;

    trigger OnRun()
    begin
    end;

    var
        CustEntryApplID: Code[50];

    procedure SetApplId(var CustLedgEntry: Record 21; ApplyingCustLedgEntry: Record 21; AppliedAmount: Decimal; PmtDiscAmount: Decimal; AppliesToID: Code[50])
    begin
        CustLedgEntry.LOCKTABLE;
        IF CustLedgEntry.FIND('-') THEN BEGIN
            // Make Applies-to ID
            IF CustLedgEntry."Applies-to ID" <> '' THEN
                CustEntryApplID := ''
            ELSE BEGIN
                CustEntryApplID := AppliesToID;
                IF CustEntryApplID = '' THEN BEGIN
                    CustEntryApplID := USERID;
                    IF CustEntryApplID = '' THEN
                        CustEntryApplID := '***';
                END;
            END;

            // Set Applies-to ID
            REPEAT
                CustLedgEntry.TESTFIELD(Open, TRUE);
                CustLedgEntry."Applies-to ID" := CustEntryApplID;
                IF CustLedgEntry."Applies-to ID" = '' THEN BEGIN
                    CustLedgEntry."Accepted Pmt. Disc. Tolerance" := FALSE;
                    CustLedgEntry."Accepted Payment Tolerance" := 0;
                END;
                // Set Amount to Apply
                IF ((CustLedgEntry."Amount to Apply" <> 0) AND (CustEntryApplID = '')) OR
                   (CustEntryApplID = '')
                THEN
                    CustLedgEntry."Amount to Apply" := 0
                ELSE
                    IF CustLedgEntry."Amount to Apply" = 0 THEN BEGIN
                        CustLedgEntry.CALCFIELDS("Remaining Amount");
                        CustLedgEntry."Amount to Apply" := CustLedgEntry."Remaining Amount"
                    END;

                IF CustLedgEntry."Entry No." = ApplyingCustLedgEntry."Entry No." THEN
                    CustLedgEntry."Applying Entry" := ApplyingCustLedgEntry."Applying Entry";
                CustLedgEntry.MODIFY;
            UNTIL CustLedgEntry.NEXT = 0;
        END;
    end;

    local procedure UpdateCustLedgerEntry(var TempCustLedgerEntry: Record "Cust. Ledger Entry" temporary; ApplyingCustLedgerEntry: Record "Cust. Ledger Entry"; AppliesToID: Code[50])
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeUpdateCustLedgerEntry(TempCustLedgerEntry, ApplyingCustLedgerEntry, AppliesToID, IsHandled, CustEntryApplID);
        if IsHandled then
            exit;

        CustLedgerEntry.Copy(TempCustLedgerEntry);
        CustLedgerEntry.TestField(Open, true);
        CustLedgerEntry."Applies-to ID" := CustEntryApplID;
        if CustLedgerEntry."Applies-to ID" = '' then begin
            CustLedgerEntry."Accepted Pmt. Disc. Tolerance" := false;
            CustLedgerEntry."Accepted Payment Tolerance" := 0;
        end;
        if ((CustLedgerEntry."Amount to Apply" <> 0) and (CustEntryApplID = '')) or
           (CustEntryApplID = '')
        then
            CustLedgerEntry."Amount to Apply" := 0
        else
            if CustLedgerEntry."Amount to Apply" = 0 then begin
                CustLedgerEntry.CalcFields("Remaining Amount");
                CustLedgerEntry."Amount to Apply" := CustLedgerEntry."Remaining Amount"
            end;

        if CustLedgerEntry."Entry No." = ApplyingCustLedgerEntry."Entry No." then
            CustLedgerEntry."Applying Entry" := ApplyingCustLedgerEntry."Applying Entry";
        OnUpdateCustLedgerEntryOnBeforeCustLedgerEntryModify(CustLedgerEntry, TempCustLedgerEntry, ApplyingCustLedgerEntry, AppliesToID);
        CustLedgerEntry.Modify();

        OnAfterUpdateCustLedgerEntry(CustLedgerEntry, TempCustLedgerEntry, ApplyingCustLedgerEntry, AppliesToID);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCustLedgerEntry(var TempCustLedgerEntry: Record "Cust. Ledger Entry" temporary; ApplyingCustLedgerEntry: Record "Cust. Ledger Entry"; AppliesToID: Code[50]; var IsHandled: Boolean; var CustEntryApplID: Code[50]);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateCustLedgerEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; var TempCustLedgerEntry: Record "Cust. Ledger Entry" temporary; ApplyingCustLedgerEntry: Record "Cust. Ledger Entry"; AppliesToID: Code[50]);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnUpdateCustLedgerEntryOnBeforeCustLedgerEntryModify(var CustLedgerEntry: Record "Cust. Ledger Entry"; var TempCustLedgerEntry: Record "Cust. Ledger Entry" temporary; ApplyingCustLedgerEntry: Record "Cust. Ledger Entry"; AppliesToID: Code[50]);
    begin
    end;
}

