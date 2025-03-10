/// <summary>
/// PageExtension ExtExtExtExtExtExtExtExtExtExtExtExtExtExtExtExtExtExtExtPurchase Order Archives (ID 52178501) extends Record Purchase Order Archives.
/// </summary>
pageextension 52178531 "Purchase Order Archive" extends "Purchase Order Archive"
{
    layout
    {

    }
    actions
    {
        modify(Print)
        {
            Caption = 'Print LPO';
            Visible = true;
        }
        addafter(Print)
        {
            action("Print Order")
            {
                ApplicationArea = Suite;
                Caption = 'Print Order';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                // PromotedCategory = Category5;
                ToolTip = 'Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header Archive";
                begin
                     PurchaseHeader := Rec;
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    REPORT.RUN(Report::"Archive LPO", TRUE, TRUE, Rec);

                    Rec.RESET;
                end;
            }


            action("Print LPO")
            {
                ApplicationArea = All;
                Caption = 'Print LPO';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category10;
                ToolTip = 'Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header Archive";
                begin
                    PurchaseHeader := Rec;
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    REPORT.RUN(Report::"Archive LPO", TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }


    }
}

