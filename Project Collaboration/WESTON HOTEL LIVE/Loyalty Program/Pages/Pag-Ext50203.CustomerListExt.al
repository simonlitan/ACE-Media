pageextension 50203 "Customer List Ext" extends "Customer List"
{
    actions
    {
        addlast(History)
        {
            action(loyalty)
            {
                Caption = 'Loyalty Points';
                Image = LedgerEntries;
                RunObject = page "Loyalty Ledger Entries Ext";
                RunPageLink = "Customer No" = field("No.");
                ApplicationArea = All;
            }

            action(loyaltyReport)
            {
                Caption = 'Detailed Loyalty Report';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    cust := Rec;
                    Cust.SetRecFilter();
                    Report.RunModal(Report::"Cust Loyalty Detail", true, false, cust);
                end;
            }

            action(XML)
            {
                Caption = 'Xml Test';
                Image = "8ball";
                RunObject = xmlport "Export Loyalty Data";
                ApplicationArea = All;
            }
        }
    }
}