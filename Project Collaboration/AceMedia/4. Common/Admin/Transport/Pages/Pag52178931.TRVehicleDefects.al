page 52178904 "TR Vehicle Defects"
{
    Caption = 'TR Vehicle Defects';
    PageType = ListPart;
    SourceTable = "TR Vehicle Defects";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Ticket No"; Rec."Ticket No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ticket No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }

                field(Defects; Rec.Defects)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Defects field.';
                }
                field("Actions taken"; Rec."Actions taken")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actions taken field.';
                }
            }
        }
    }
}
