page 70181 "Income and Expend Step Code"
{
    PageType = List;
    SourceTable = "Income and Expend Step Code";

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
                field(Steps; Rec.Steps)
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

