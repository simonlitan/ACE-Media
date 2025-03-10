pageextension 50200 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            group("Customer Loyalty")
            {
                field("Loyalty Program"; "Loyalty Program")
                {
                    ApplicationArea = ALL;
                }
                field("Loyalty Points"; "Loyalty Points")
                {
                    ApplicationArea = all;
                }
                field("loyaltyStatus2"; "loyaltyStatus2")
                {
                    ApplicationArea = All;
                }
            }

        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(History)
        {
            action(loyalty)
            {
                Caption = 'Loyalty Points';
                Image = LedgerEntries;
                RunObject = page "Loyalty Ledger Entries Ext";
                ApplicationArea = all;
                RunPageLink = "Customer No" = field("No.");
            }

            action(loyaltyReport)
            {
                Caption = 'Detailed Loyalty Report';
                Image = Report;
                ApplicationArea = all;
                trigger OnAction()
                var
                    cust: Record Customer;
                begin
                    cust := rec;
                    cust.SetRecFilter();
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

    var
        myInt: Integer;
}

