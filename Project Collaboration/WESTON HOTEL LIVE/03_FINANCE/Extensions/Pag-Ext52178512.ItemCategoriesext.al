pageextension 52178512 "Item Categories ext" extends "Item Categories"
{
    layout
    {
        // Add changes to page layout here
        addafter(code)
        {
            field("Item Group"; Rec."Item Group")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}