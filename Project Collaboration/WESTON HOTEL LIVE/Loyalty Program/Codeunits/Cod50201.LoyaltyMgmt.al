codeunit 50201 "Loyalty Mgmt"
{
    procedure AddLoyaltyPoints(custCode: Code[20]; docNo: Code[20]; postDate: date; invAmt: Decimal)
    var
        ledger: Record "Loyalty Ledger";
    begin
        ledger."Customer No" := custCode;
        ledger."Document No" := docNo;
        ledger."Posting Date" := postDate;
        ledger."Points" := invAmt / 100;
        ledger.Insert(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, false)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean)

    var
        loyaltyMgmt: Codeunit "Loyalty Mgmt";
        salesInvHeader: Record "Sales Invoice Header";
    begin
        if SalesInvHeader.Get(SalesInvHdrNo) then begin
            salesInvHeader.CalcFields("Amount Including VAT");
            loyaltyMgmt.AddLoyaltyPoints(salesInvHeader."Sell-to Customer No.", salesInvHeader."No.", salesInvHeader."Posting Date", salesInvHeader."Amount Including VAT");
        end;
    end;
}
