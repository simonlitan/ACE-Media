page 68480 "HR Appraisal Goal Setting H S"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Appraisal indicators";

    layout
    {
        area(content)
        {
            group("Appraisee Information")
            {
                Caption = 'Appraisee Information';
                field("Entry No"; Rec."Entry No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                // field("Employee No"; "Employee No")
                // {
                //     Importance = Promoted;
                // }
                // field("Employee Name"; "Employee Name")
                // {
                //     Importance = Promoted;
                // }
                // field("Overal Rating Desc"; "Overal Rating Desc")
                // {
                // }
                // field("Job Title"; "Job Title")
                // {
                // }
                field(Test2; Rec.Test2)
                {
                    ApplicationArea = All;
                }
                field(Criteria; Rec.Criteria)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                // field("SuperVisor Email"; "SuperVisor Email")
                // {
                // }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
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
                field(Test; Rec.Test)
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
            group("Appraisal Ratings")
            {
                Caption = 'Appraisal Ratings';
                // field("Total PTarget Score"; "Total PTarget Score")
                // {
                // }
                // field("Total Value Assessment Score"; "Total Value Assessment Score")
                // {
                // }
                // field("Total Score of Targets(Points)"; "Total Score of Targets(Points)")
                // {
                // }
                // field("Total Score of Targets(%)"; "Total Score of Targets(%)")
                // {
                // }
            }
            part("Departmental Objectives"; "Department Objectives")
            {
                Caption = 'Departmental Objectives';
                SubPageLink = "Employee No" = FIELD(Code), "Appraisal Period" = FIELD("Appraisal Year"), "Appraisal Type" = FIELD("Performance Indicator");
                ApplicationArea = All;
            }
            part("Employee Performance Target"; "HR Employee Performance Target")
            {
                Caption = 'Employee Performance Target';
                ApplicationArea = All;
            }
            part("Employee Values assessment"; "HR Employee Values assessment")
            {
                Caption = 'Employee Values assessment';
                ApplicationArea = All;
            }
            part("Appraisal Other Details"; "HR Appraisal Other Details")
            {
                Caption = 'Appraisal Other Details';
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            systempart(Outlook; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
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
                action("Send To Supervisor")
                {
                    Caption = 'Send To Supervisor';
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //LinesExists;

                        IF CONFIRM('Do you want to send this Appraisal Form to  your Supervisor?', FALSE) = TRUE THEN BEGIN
                            Rec.Test := '1';
                            Rec.MODIFY;
                            MESSAGE('%1', 'Process Completed')
                        END;
                    end;
                }
            }
        }
    }

    var
        HasLines: Boolean;
        Text19033494: Label 'Set your goals and objectives in line with your departments strategy.';
        "Goal Setting": Record "HR Appraisal Goal Setting L";
        HRAppraisalGoals: Record "HR Appraisal Goal Setting L";

    procedure LinesExists(): Boolean
    var
        HRAppraisalGoals: Record "HR Appraisal Goal Setting L";
    begin
        HasLines := FALSE;
        HRAppraisalGoals.RESET;
        //HRAppraisalGoals.SETRANGE(HRAppraisalGoals."Appraisal No","Appraisal No.");
        IF HRAppraisalGoals.FIND('-') THEN BEGIN
            HasLines := TRUE;
            EXIT(HasLines);
        END;

    end;
}

