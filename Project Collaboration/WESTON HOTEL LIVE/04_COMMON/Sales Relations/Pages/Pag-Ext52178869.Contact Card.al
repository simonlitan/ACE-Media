pageextension 52178869 "ExtContact Card" extends "Contact Card"
{
    layout
    {
        addafter("Salutation Code")
        {
            field("User Id"; Rec."User Id")
            {
                ApplicationArea = all;
            }
        }
    }
}
