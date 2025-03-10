page 70222 "Performance Contract List"
{
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Performance Contract Activitie";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Income and Expenditure Code"; Rec."Expenditure Code")
                {
                    Caption = 'Income and Expenditure Code';
                    ApplicationArea = All;
                }
                field("Income and Expend Step Code"; Rec."Income and Expend Step Code")
                {
                    ApplicationArea = All;
                }
                field("Targets Description"; Rec."Targets Description")
                {
                    ApplicationArea = All;
                }
                field(Actuals; Rec.Actuals)
                {
                    ApplicationArea = All;
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = All;
                }
                field(Variance; Rec.Variance)
                {
                    ApplicationArea = All;
                }
                field("Cumm To Date Actual"; Rec."Cumm To Date Actual")
                {
                    ApplicationArea = All;
                }
                field("Cumm To Date Target"; Rec."Cumm To Date Target")
                {
                    ApplicationArea = All;
                }
                field("Cumm To Date Variance"; Rec."Cumm To Date Variance")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("Actual Same Period Last Year"; Rec."Actual Same Period Last Year")
                {
                    ApplicationArea = All;
                }
                field("Actual Cumm Last Year"; Rec."Actual Cumm Last Year")
                {
                    ApplicationArea = All;
                }
                field("Q Cummulative to Date Variance"; Rec."Q Cummulative to Date Variance")
                {
                    ApplicationArea = All;
                }
                field("C Cummulative to Date Variance"; Rec."C Cummulative to Date Variance")
                {
                    ApplicationArea = All;
                }
                field("Cummulative Comment"; Rec."Cummulative Comment")
                {
                    Caption = 'Comment Compared To Last Year';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

