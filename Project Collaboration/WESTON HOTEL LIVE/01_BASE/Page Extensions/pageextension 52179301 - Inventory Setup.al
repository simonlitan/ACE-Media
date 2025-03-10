pageextension 52179301 "Inventory Setup" extends "Inventory Setup"
{
    layout
    {
        addafter("Inventory Movement Nos.")
        {
            field("Item Issue Batch"; Rec."Item Issue Batch")
            {
                ApplicationArea = All;
            }
            field("Item Issue Template"; Rec."Item Issue Template")
            {
                ApplicationArea = All;
            }
        }
    }
}