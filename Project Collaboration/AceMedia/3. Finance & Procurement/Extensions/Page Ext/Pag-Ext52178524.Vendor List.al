pageextension 52178524 "ExtVendor List" extends "Vendor List"
{
    layout
    {
        addafter(Name)
        {

            field("Vendor Categorization"; Rec."Vendor Categorization")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Categorization field.';
            }
            field("Goods to supply"; Rec."Goods to supply")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Goods/Services Supplied field.';
            }
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }
}
