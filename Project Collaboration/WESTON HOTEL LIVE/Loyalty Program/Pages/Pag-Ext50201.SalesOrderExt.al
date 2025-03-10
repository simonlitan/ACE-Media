pageextension 50201 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("loyaltyStatus2"; "loyaltyStatus2")
            {
                ApplicationArea = all;
            }
        }
    }
}