/// <summary>
/// PageExtension Posted Sales Invoices (ID 52178506) extends Record Posted Sales Invoices.
/// </summary>
pageextension 52178506 "Posted Sales Invoices" extends "Posted Sales Invoices"
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
                PromotedCategory = Category7;
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
                PromotedCategory = category7;
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
