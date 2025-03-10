page 68462 "HR Appraisal Evaluation Lines"
{
    PageType = List;
    SourceTable = "HR Appraisal Evaluations";
    SourceTableView = WHERE(Category = CONST("JOB SPECIFIC EVALUATION AREA"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
            }
            field("Evaluation Code"; Rec."Evaluation Code")
            {
                ApplicationArea = All;
            }
            field("Evaluation Description"; Rec."Evaluation Description")
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
        }
    }

    actions
    {
    }

    var
        YesNo: Boolean;
        HRAppraisalEvaluations: Record "HR Appraisal Evaluations";
        HREmp: Record "HRM-Employee C";
        HRAppraisalRatings: Record "HR Appraisal Ratings";
        TotalScore: Decimal;

    procedure TotScore()
    begin
    end;
}

