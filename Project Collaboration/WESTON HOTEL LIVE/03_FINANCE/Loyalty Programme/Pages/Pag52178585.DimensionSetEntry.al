page 52178585 "Dimension Set Entry"
{
    Caption = 'Dimension Set Entry';
    PageType = List;
    SourceTable = "Dimension Set Entry";
    
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
                field("Dimension Code";Rec."Dimension Code")
                {
                    ApplicationArea= all;
                }
                field("Dimension Value Code";Rec."Dimension Value Code")
                {
                    ApplicationArea = all;
                }
                field("Dimension Value ID";Rec."Dimension Value ID")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
