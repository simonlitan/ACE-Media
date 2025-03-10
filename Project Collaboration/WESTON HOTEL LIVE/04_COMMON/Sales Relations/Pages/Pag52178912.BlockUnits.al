page 52178912 "Block Units"
{
    PageType = ListPart;
    SourceTable = "Block Units";
    DeleteAllowed = false;
    CardPageId = "Block Units Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
        }
    }
}