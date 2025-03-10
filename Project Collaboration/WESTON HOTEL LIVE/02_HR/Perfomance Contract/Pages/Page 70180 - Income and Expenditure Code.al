page 70180 "Income and Expenditure Code"
{
    PageType = List;
    SourceTable = "Income and Expenditure Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Income & Expenditure Code"; Rec."Income & Expenditure Code")
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

