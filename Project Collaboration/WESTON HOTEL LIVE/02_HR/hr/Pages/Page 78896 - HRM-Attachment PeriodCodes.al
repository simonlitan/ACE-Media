page 78896 "HRM-Attachment PeriodCodes"
{
    PageType = List;
    SourceTable = "HRM-Attachment PeriodCodes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Code"; rec."Period Code")
                {
                    ApplicationArea = All;
                }
                field("Period Description"; rec."Period Description")
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

