page 52178596 "Post Value Entry to G/L"
{
    Caption = 'Post Value Entry to G/L';
    PageType = List;
    SourceTable = "Post Value Entry to G/L";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Value Entry No.";Rec."Value Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Item No.";Rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field("Posting Date";Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
