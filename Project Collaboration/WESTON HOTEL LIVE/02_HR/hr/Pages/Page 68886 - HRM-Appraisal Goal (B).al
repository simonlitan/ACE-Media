page 68886 "HRM-Appraisal Goal (B)"
{
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Functions,NextPage';
    SourceTable = "HRM-Appraisal Goal Setting H";
    SourceTableView = WHERE(Status = CONST(Approved));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Appraisal No"; Rec."Appraisal No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Appraisal Stage"; Rec."Appraisal Stage")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
            }
            part("PERSONAL GOALS/OBJECTIVES"; "HRM-Appraisal Goal Set. (B1)")
            {
                Caption = 'PERSONAL GOALS/OBJECTIVES';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No");
                ApplicationArea = All;
            }
            part(SF; "HRM-Appraisal Evaluation Line")
            {
                Caption = 'PERSONAL PROFESSIONAL ATTRIBUTES';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No");
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
                RunObject = Page "HRM-Appraisal Goal Setting";
                RunPageLink = "Appraisal No" = FIELD("Appraisal No");
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
        if HREmp.Get(Rec."Employee No") then Begin
            //  "Job Title":=HREmp."Job Title";

        end;
    end;

    var
        //HRAppraisalEvaluationAreas: Record "HRM-Job Assessment  lines";
        HRAppraisalEvaluations: Record "PRL-Payroll Variations";
        HRAppraisalEvaluationsF: Page "HRM-Appraisal Evaluation Lines";
        HREmp: Record "HRM-Short Listed Applicant";
}

