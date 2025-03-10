pageextension 52178532 "ExtPurch. Invoice Subform" extends "Purch. Invoice Subform"
{
    layout
    {

        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
    }

}
