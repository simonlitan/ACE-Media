page 52178586 "Dimensions correction Page"
{
    Caption = 'Dimensions correction Page';
    PageType = List;
    SourceTable = "G/L Entry";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("G/L Account No.";Rec."G/L Account No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Document No.";Rec."Document No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                    ApplicationArea =all;
                }
                    field("Posting Date";Rec."Posting Date")
                {
                    ApplicationArea =all;
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }
}
