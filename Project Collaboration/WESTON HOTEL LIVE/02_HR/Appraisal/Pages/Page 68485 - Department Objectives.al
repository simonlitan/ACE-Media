page 68485 "Department Objectives"
{
    PageType = ListPart;
    SourceTable = "HR Appraisals Perfomance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Factors; Rec.Factors)
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

