page 52178565 "Loyalty Subscription"
{
    PageType = List;
    SourceTable = "Loyalty Subscriptions";
    CardPageId = "Loyalty Customers";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("ID/Passport No."; Rec."ID/Passport No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID/Passport No. field.';
                }
            }
        }
    }
}