report 50200 "Reset Loyalty Ledger"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Invoices; "Sales Invoice Header")
        {
            trigger OnPreDataItem()
            begin
                if not loyalLedger.IsEmpty then
                    loyalLedger.DeleteAll();
                SetAutoCalcFields("Amount Including VAT");
            end;

            trigger OnAfterGetRecord()
            begin
                loyalMgmt.AddLoyaltyPoints("Sell-to Customer No.", "No.", "Posting Date", "Amount Including VAT");
            end;
        }
    }

    trigger OnPostReport()
    begin
        Message('Loyalty Ledger Reset');
    end;

    var
        loyalLedger: Record "Loyalty Ledger";
        loyalMgmt: Codeunit "Loyalty Mgmt";
}