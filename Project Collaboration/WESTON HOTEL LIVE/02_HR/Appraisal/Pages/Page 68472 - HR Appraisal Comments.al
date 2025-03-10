page 68472 "HR Appraisal Comments"
{
    PageType = ListPart;
    SourceTable = "HR Overall Comments";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = All;
                }
                field("HR comments"; Rec."HR comments")
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

