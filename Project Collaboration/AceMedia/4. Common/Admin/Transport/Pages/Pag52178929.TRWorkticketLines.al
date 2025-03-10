page 52178903 "TR Workticket Lines"
{
    Caption = 'TR Workticket Lines';
    PageType = ListPart;
    SourceTable = "TR Workticket Lines";

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
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field("Tr Request No"; Rec."Tr Request No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tr Request No field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Driver No"; Rec."Driver No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver No field.';
                }
                field(Route; Rec.Route)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route field.';
                }
                field("Authorizing Officer No"; Rec."Authorizing Officer No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Authorizing Officer No field.';
                }
                field("Authorizing Officer Name"; Rec."Authorizing Officer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Authorizing Officer Name field.';
                }
                field("Oil Drawn"; Rec."Oil Drawn")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Oil Drawn field.';
                }
                field("Fuel Drawn"; Rec."Fuel Drawn")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fuel Drawn field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Time Out field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Odometer Reading"; Rec."Odometer Reading")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Odometer Reading field.';
                }
                field("Distance Covered"; Rec."Distance Covered")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Distance Covered field.';
                }
            }
        }
    }
}
