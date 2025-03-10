tableextension 50201 "Sales Header Ext2" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(5020011; "loyaltyStatus2"; Enum "Loyalty Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Loyalty Status';
            Editable = false;
        }
    }
}