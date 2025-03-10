page 68465 "HR Appraisal Evaluation 3"
{
    PageType = List;
    SourceTable = "HR Appraisal Evaluations";
    SourceTableView = WHERE(Category = CONST("EMPLOYEE PERFORMANCE FACTOR"));

    layout
    {
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
        HRLookupValues: Record "HRM-Lookup Values";

    procedure TotScore()
    begin
    end;
}

