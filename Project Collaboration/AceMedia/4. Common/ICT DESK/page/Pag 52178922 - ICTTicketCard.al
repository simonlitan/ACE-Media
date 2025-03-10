page 52178962 "ICT Ticket Card"
{
    Caption = 'Raise Ticket';
    PageType = Card;
    SourceTable = "ICT Support Desk";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Ticket No. field.';
                    ApplicationArea = All;
                }
                field("Issue Area"; Rec."Issue Area")
                {
                    ToolTip = 'Specifies the value of the Issue Area field.';
                    ApplicationArea = All;
                }
                field("Issue Description"; Rec."Issue Description")
                {
                    ToolTip = 'Specifies the value of the Issue Description field.';
                    ApplicationArea = All;
                }
                field("Issue Status"; Rec."Issue Status")
                {
                    ToolTip = 'Specifies the value of the Issue Status field.';
                    ApplicationArea = All;
                }
                field("Requesting User"; Rec."Requesting User")
                {
                    ToolTip = 'Specifies the value of the Requesting User field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
