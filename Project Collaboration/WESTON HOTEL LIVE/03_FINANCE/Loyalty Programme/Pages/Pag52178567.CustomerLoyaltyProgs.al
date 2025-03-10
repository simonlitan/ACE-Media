page 52178567 "Customer Loyalty Progs"
{
    SourceTable = "Customer Loyalty Progs";
    PageType = ListPart;

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
                field(Programme; Rec.Programme)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Programme field.';
                }
                field("ID/Passport No."; Rec."ID/Passport No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID/Passport No. field.';
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone No. field.';
                }
            }
        }
    }
}