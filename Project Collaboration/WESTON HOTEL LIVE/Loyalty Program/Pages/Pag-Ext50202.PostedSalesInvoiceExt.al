pageextension 50202 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("loyaltyStatus2"; "loyaltyStatus2")
            {
                ApplicationArea = All;
            }
        }
    }
}