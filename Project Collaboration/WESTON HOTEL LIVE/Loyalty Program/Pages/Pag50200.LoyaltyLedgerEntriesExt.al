page 50200 "Loyalty Ledger Entries Ext"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Loyalty Ledger";
    Caption = 'Loyalty Ledger Entries';
    SourceTableView = sorting("Customer No", "Posting Date");
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(ledgerEntriesRptr)
            {
                field("Entry No"; "Entry No")
                {
                    ApplicationArea = All;

                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;

                }
                field("Customer No"; "Customer No")
                {
                    ApplicationArea = All;

                }
                field("Document No"; "Document No")
                {
                    ApplicationArea = All;

                }
                field("Points"; "Points")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}