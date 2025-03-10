pageextension 52178536 "Posted Sales Invoice Card Ext" extends "Posted Sales Invoice"
{
    actions
    {
        modify(print)
        {
            Visible = false;
        }
        addafter(correct)
        {
            action(PrintSalesInvoice)
            {
                Caption = 'Print Invoice';
                ApplicationArea = all;
                Image = PrintDocument;
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Category6;
                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    SalesInvHeader.PrintRecords(true);

                    report.Run(report::"Sales Invoice", true, true, rec);
                end;
            }
            action(PrintSalesinvoice2)
            {
                Caption = 'Print Invoice 2';
                ApplicationArea = all;
                Image = PrintDocument;
                Promoted = true;
                PromotedCategory = category6;
                trigger OnAction()
                begin
                    rec.Reset();
                    rec.SetRange("No.", REC."No.");
                    report.Run(report::"Posted Sales Invoice", true, true, rec);
                end;
            }
        }
    }
}
