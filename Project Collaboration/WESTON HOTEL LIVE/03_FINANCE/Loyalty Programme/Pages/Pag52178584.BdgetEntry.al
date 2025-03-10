page 52178584 "Bdget Entry"
{
    Caption = 'Bdget Entry';
    PageType = List;
    SourceTable = "G/L Budget Entry";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Dimension Set ID";Rec."Dimension Set ID")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Budget Name";Rec."Budget Name")
                {
                    ApplicationArea = all;
                }
                field("Budget Dimension 1 Code";Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Dimension 2 Code";Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
