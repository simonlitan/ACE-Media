tableextension 50200 "Customer Ext" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50200; "loyaltyStatus2"; Enum "Loyalty Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Loyalty Status';
        }
        field(50201; "Loyalty Program"; Boolean)
        {
            Caption = 'Loyalty Program';
            DataClassification = ToBeClassified;
        }
        field(50202; "Loyalty Points"; Decimal)
        {
            Caption = 'Loyalty Points';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Loyalty Ledger".Points where("Customer No" = field("No.")));
        }
    }
}