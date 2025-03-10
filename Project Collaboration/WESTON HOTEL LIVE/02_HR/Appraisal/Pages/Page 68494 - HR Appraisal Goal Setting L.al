page 68494 "HR Appraisal Goal Setting L"
{
    PageType = List;
    SourceTable = "HR Appraisal Goal Setting L";

    layout
    {
        area(content)
        {
            repeater(__)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = All;
                }
                field("Planned Targets/Objectives"; Rec."Planned Targets/Objectives")
                {
                    ApplicationArea = All;
                }
                field("Criteria/Target Date"; Rec."Criteria/Target Date")
                {
                    Caption = 'Assesment Criteria';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        Updatecontrols();
    end;

    trigger OnInit()
    begin
        /*Targets:=TRUE;
        AssesmentCriteria:=TRUE;
        "Agreement With RatingEditable" := TRUE;
        ScoreEditable := TRUE;
        "Appraisal RatingVisible" := TRUE;
         */

    end;

    var
        // HRAppraisalGoalSettingH: Record "HR Appraisal Goal Setting L";
        [InDataSet]
        "Appraisal RatingVisible": Boolean;
        [InDataSet]
        ScoreEditable: Boolean;
        [InDataSet]
        "Agreement With RatingEditable": Boolean;
        Targets: Boolean;
        AssesmentCriteria: Boolean;

    procedure Updatecontrols()
    begin
        /* HRAppraisalGoalSettingH.SETRANGE(HRAppraisalGoalSettingH."Appraisal No","Appraisal No");
         IF HRAppraisalGoalSettingH.FIND('-') THEN
         IF HRAppraisalGoalSettingH.Sent=HRAppraisalGoalSettingH.Sent::"At Appraisee" THEN BEGIN
         IF Sent<>Sent::"At Appraisee" THEN BEGIN
         Targets:=TRUE;
         AssesmentCriteria:=TRUE;
         "Agreement With RatingEditable" :=TRUE;
         "Appraisal RatingVisible" :=TRUE;
         ScoreEditable :=TRUE;
         CurrPage.Updatecontrols();
         END ELSE BEGIN
         Targets:=FALSE;
         AssesmentCriteria:=FALSE;
         "Agreement With RatingEditable" :=FALSE;
         ScoreEditable :=FALSE;
         CurrPage.Updatecontrols();
         END;
*/

    end;
}

