page 52178505 "PROC-Store Requisition Line UP"
{
    PageType = ListPart;
    Caption = 'Store Requisition Lines';
    SourceTable = "PROC-Store Requistion Lines";

    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        rec.Validate(Description);
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin

                        CurrPage.Update();
                    end;
                }

                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = all;
                }
                field("Qty in store"; Rec."In store")
                {
                    Caption = 'Qty in store';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ApplicationArea = all;
                }
                field("Quantity To Issue"; Rec."Quantity To Issue")
                {
                    ApplicationArea = all;
                }
                field("Quantity Issued"; Rec."Quantity Issued")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = all;
                }
                field("Item Status";Rec."Item Status")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = all;
                }
                field("Issue UserID"; Rec."Issue UserID")
                {
                    ApplicationArea = all;
                }
                field(Committed; Rec.Committed)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        IF QtyStore.GET(Rec."No.") THEN
            QtyStore.CALCFIELDS(QtyStore.Inventory);
        Rec."Qty in store" := QtyStore.Inventory;
    end;

    trigger OnOpenPage()
    begin
        //"Qty in store":=Item.Inventory;
        IF QtyStore.GET(Rec."No.") THEN
            QtyStore.CALCFIELDS(QtyStore.Inventory);
        Rec."Qty in store" := QtyStore.Inventory;
    end;

    var
        QtyStore: Record Item;
}

