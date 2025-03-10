page 52178913 "Block Units Card"
{
    PageType = Document;
    SourceTable = "Block Units";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Block Code"; Rec."Block Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Block Code field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Usage Category"; Rec."Usage Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Usage Category field.';
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Type field.';
                }
                field("Rate Per Pax"; Rec."Rate Per Pax")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rate Per Pax field.';
                }
                field("Maximum Pax"; Rec."Maximum Pax")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maximum Pax field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }


            }
            group("Booking Schedules")
            {
                part(Bookings; "Booking Schedules")
                {
                    ApplicationArea = All;
                    SubPageLink = "Block Code" = field("Block Code"), "Unit Code" = field("Unit Code"), "Dimension 1 Code" = field("Dimension 1 Code");
                }
            }
        }
    }
}