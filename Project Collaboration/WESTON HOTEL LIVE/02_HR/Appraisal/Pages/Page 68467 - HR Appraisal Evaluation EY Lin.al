page 68467 "HR Appraisal Evaluation EY Lin"
{
    PageType = ListPart;
    SourceTable = "HR Appraisal Evaluations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Code"; Rec."Evaluation Code")
                {
                    ApplicationArea = All;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = All;
                }
                field("Evaluation Description"; Rec."Evaluation Description")
                {
                    ApplicationArea = All;
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
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

