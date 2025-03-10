page 52178910 "Blocks"
{
    PageType = List;
    SourceTable = Blocks;
    Editable = false;
    DeleteAllowed = false;
    CardPageId = "Blocks Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Block Code"; Rec."Block Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Block Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
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