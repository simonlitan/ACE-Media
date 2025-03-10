page 52179206 "HRM-Interview Details Card"
{
    PageType = Card;
    SourceTable = "HRM-Interview Details";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
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

