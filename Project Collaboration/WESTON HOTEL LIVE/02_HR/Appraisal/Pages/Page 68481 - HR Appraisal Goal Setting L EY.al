page 68481 "HR Appraisal Goal Setting L EY"
{
    PageType = ListPart;
    SourceTable = "HR Appraisal Goal Setting L";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Planned Targets/Objectives"; Rec."Planned Targets/Objectives")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Criteria/Target Date"; Rec."Criteria/Target Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                }
                field("Target Points (Total=100)"; Rec."Target Points (Total=100)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        "Agreement With RatingEditable" := TRUE;
        ScoreVisible := TRUE;
        "Appraisal RatingVisible" := TRUE;
    end;

    trigger OnOpenPage()
    begin

        HRAppraisalGoalSettingH.SETRANGE("Code", Rec."Appraisal No");
        IF HRAppraisalGoalSettingH.FIND('-') THEN
            IF HRAppraisalGoalSettingH.Code = HRAppraisalGoalSettingH.Code THEN BEGIN
                "Agreement With RatingEditable" := FALSE;
                "Appraisal RatingVisible" := FALSE;
                ScoreVisible := FALSE;
            END ELSE BEGIN
                "Agreement With RatingEditable" := TRUE;
            END;
    end;

    var
        HRAppraisalGoalSettingH: Record "HR Appraisal indicators";
        [InDataSet]
        "Appraisal RatingVisible": Boolean;
        [InDataSet]
        ScoreVisible: Boolean;
        [InDataSet]
        "Agreement With RatingEditable": Boolean;
}

