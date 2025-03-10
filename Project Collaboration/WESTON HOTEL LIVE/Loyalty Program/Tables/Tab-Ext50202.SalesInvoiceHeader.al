tableextension 50202 "Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        // Add changes to table fields here
        field(50200; "loyaltyStatus2"; Enum "Loyalty Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Loyalty Status';
            Editable = false;
        }
    }
}