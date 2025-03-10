page 52178949 "Registry Setup"

{
    Caption = 'Registry Setup';
    PageType = Card;
    SourceTable = "Admin No Series";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Mail ID"; Rec."Mail ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mail ID field.';
                }
                field("Folio No."; Rec."Folio No.")
                {
                    ApplicationArea = All;
                }
                field("Personal Mail"; Rec."Personal Mail")
                {
                    ApplicationArea = ALl;
                }
                field("Outbound Mail ID"; Rec."Outbound Mail ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

