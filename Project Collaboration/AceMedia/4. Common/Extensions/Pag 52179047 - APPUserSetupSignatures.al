page 52179047 "APP-User-Setup Signatures"

{
    // DeleteAllowed = true;
    PageType = Card;
    SourceTable = "User Setup";
    Editable = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("User Signature"; Rec."User Signature")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}