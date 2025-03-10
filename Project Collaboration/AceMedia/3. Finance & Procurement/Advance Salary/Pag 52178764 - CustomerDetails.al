page 52178764 "Customer Details"
{
    Caption = 'Customer Details';
    PageType = List;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }

            }
        }
    }
}
