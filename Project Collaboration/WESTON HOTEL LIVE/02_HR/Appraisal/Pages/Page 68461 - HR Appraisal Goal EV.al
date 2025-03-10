page 68461 "HR Appraisal Goal EV"
{
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Functions,NextPage';
    SourceTable = "HR Appraisal indicators";
    //SourceTableView = WHERE(Code= CONST(1));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Entry No"; Rec."Entry No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Criteria; Rec.Criteria)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Test1; Rec.Test1)
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
            }
            part("PERSONAL GOALS/OBJECTIVES"; "HR Appraisal Goal Setting L EY")
            {
                Caption = 'PERSONAL GOALS/OBJECTIVES';
                SubPageLink = "Appraisal No" = FIELD("Code");
                ApplicationArea = All;
            }
            part(SF; "HR Appraisal Evaluation EY Lin")
            {
                Caption = 'PERSONAL PROFESSIONAL ATTRIBUTES';
                SubPageLink = "Appraisal No" = FIELD("Code");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
            }
        }
        area(processing)
        {
            action("&Next Page")
            {
                Caption = '&Next Page';
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "HR Appraisal Goal Setting NY";
                RunPageLink = "Appraisal No" = FIELD(Code);
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //FORM.RUNMODAL(39005843
                    //PAGE.RUN(39003985,Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //  IF HREmp.GET("Employee No") THEN
        //  "Job Title":=HREmp."Job Title";
    end;

    var
        HRAppraisalEvaluationAreas: Record "HR Appraisal Evaluation Areas";
        HRAppraisalEvaluations: Record "HR Appraisal Evaluations";
        HRAppraisalEvaluationsF: Page "HR Appraisal Evaluation Lines";
        HREmp: Record "HRM-Employee C";
}

