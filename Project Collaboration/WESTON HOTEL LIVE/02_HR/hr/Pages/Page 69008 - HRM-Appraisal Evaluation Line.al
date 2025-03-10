page 69008 "HRM-Appraisal Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "HRM-Appraisal Evaluations";

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

