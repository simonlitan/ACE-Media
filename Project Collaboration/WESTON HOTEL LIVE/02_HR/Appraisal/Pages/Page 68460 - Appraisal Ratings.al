page 68460 "Appraisal Ratings"
{
    PageType = List;
    SourceTable = "Appraisal Ratings";
    SourceTableView = SORTING(Rating)
                      ORDER(Descending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Rating; Rec.Rating)
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
    }
}

