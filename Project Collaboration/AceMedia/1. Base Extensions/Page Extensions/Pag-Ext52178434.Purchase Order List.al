pageextension 52178434 "ExtPurchase Order List" extends "Purchase Order List"
{

    layout

    {


    }
    actions
    {
        modify(Print)
        {
            Visible = false;
        }
        addbefore(Send)
        {
            action("Print Order")
            {
                ApplicationArea = Suite;
                Caption = 'Print Order';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader := Rec;
                    Rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    REPORT.RUN(52178731, TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }
        modify("Delete Invoiced")
        {
            Visible = false;
        }
    }
    trigger OnOpenPage()
    begin
        
    end;


}
