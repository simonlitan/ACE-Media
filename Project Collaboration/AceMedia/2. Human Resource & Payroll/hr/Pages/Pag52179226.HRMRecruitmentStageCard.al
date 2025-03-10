page 52179226 "HRM-Recruitment  Stage Card"
{
    PageType = Card;
    SourceTable = "HRM-Recruitment Stages";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                action(Requirements)
                {
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;

                    ApplicationArea = All;
                }
            }
        }
    }
}

