/// <summary>
/// PageExtension Purchase Order Archives (ID 52178501) extends Record Purchase Order Archives.
/// </summary>
pageextension 52178501 "Purchase Order Archive" extends "Purchase Order Archive"
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
        addafter(print)
        {
            action("Print LPO")
            {
                Visible = FALSE;
                ApplicationArea = all;
                Image = PrintDocument;
                trigger OnAction()

                begin

                    rec.RESET;
                    Rec.SETFILTER("No.", Rec."No.");
                    CurrPage.SetSelectionFilter(rec);
                    REPORT.RUN(Report::LPO2, TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
        }
    }
}
