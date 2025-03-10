page 52178911 "Blocks Card"
{
    PageType = Document;
    SourceTable = Blocks;
    layout
    {
        area(Content)
        {
            group(General)
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
            group("Block Units")
            {
                part(Units; "Block Units")
                {
                    ApplicationArea = All;
                    SubPageLink = "Block Code" = field("Block Code"), "Dimension 1 Code" = field("Dimension 1 Code");
                }
            }
        }
    }
}