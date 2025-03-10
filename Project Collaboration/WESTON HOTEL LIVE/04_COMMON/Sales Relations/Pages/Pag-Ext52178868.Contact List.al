pageextension 52178868 "ExtContact List" extends "Contact List"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("User Id"; Rec."User Id")
            {
                ApplicationArea = all;
            }
        }
    }
}




