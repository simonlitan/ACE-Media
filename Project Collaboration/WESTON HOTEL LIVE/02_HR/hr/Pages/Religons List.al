page 50049 "Religions List"
{
    PageType = List;
    SourceTable = "ACA-Religions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Tribe Code"; Rec.Religion)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Remarks)
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

