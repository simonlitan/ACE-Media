page 52178964 "ICT Setup"
{
    Caption = 'ICT Setup';
    PageType = Card;
    SourceTable = "ICT Support Desk Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Ticket No."; Rec."Ticket No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ticket No. field.';
                }
                field("Support Area No."; Rec."Support Area No.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
