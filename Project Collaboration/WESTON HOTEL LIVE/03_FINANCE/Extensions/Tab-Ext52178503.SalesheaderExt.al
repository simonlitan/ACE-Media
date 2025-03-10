tableextension 52178503 "Sales header Ext" extends "Sales Header"
{
    fields
    {
        field(52178500; "HS Codes"; code[30])
        {

            DataClassification = ToBeClassified;
        }
             field(50200; "loyaltyStatus"; Enum "Loyalty Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Loyalty Status';
            Editable = false;
        }
    }
}
