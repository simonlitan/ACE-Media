page 68999 "HRM-Appraisal Goal Setting (B)"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HRM-Appraisal Goal Setting H";

    layout
    {
        area(content)
        {
            group("Appraisee Information")
            {
                Caption = 'Appraisee Information';
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
                field("Overal Rating Desc"; Rec."Overal Rating Desc")
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("SuperVisor Email"; Rec."SuperVisor Email")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
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
                field(Sent; Rec.Sent)
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
            group("Appraisal Ratings")
            {
                Caption = 'Appraisal Ratings';
                field("Total PTarget Score"; Rec."Total PTarget Score")
                {
                    ApplicationArea = All;
                }
                field("Total Value Assessment Score"; Rec."Total Value Assessment Score")
                {
                    ApplicationArea = All;
                }
                field("Total Score of Targets(Points)"; Rec."Total Score of Targets(Points)")
                {
                    ApplicationArea = All;
                }
                field("Total Score of Targets(%)"; Rec."Total Score of Targets(%)")
                {
                    ApplicationArea = All;
                }
            }
            // part("Departmental Objectives";"HRM-Department Objectives")
            // {
            //     Caption = 'Departmental Objectives';
            //     SubPageLink = "Employee No"=FIELD("Employee No"),
            //                   "Appraisal Period"=FIELD("Appraisal Period"),
            //                   "Appraisal Type"=FIELD("Appraisal Type");
            // }
            part("Employee Performance Target"; "HRM-Emp. Performance Target")
            {
                Caption = 'Employee Performance Target';
                ApplicationArea = All;
            }
            // part("Employee Values assessment";"HRM-Emp. Values assesment")
            // {
            //     Caption = 'Employee Values assessment';
            // }
            part("Appraisal Other Details"; "HRM-Appraisal Other Details")
            {
                Caption = 'Appraisal Other Details';
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000002; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1000000003; Notes)
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

                        if Confirm('Do you want to send this Appraisal Form to  your Supervisor?', false) = true then begin
                            Rec.Sent := 1;
                            Rec.Modify;
                            Message('%1', 'Process Completed')
                        end;
                    end;
                }
            }
        }
    }

    var
        HasLines: Boolean;
        Text19033494: Label 'Set your goals and objectives in line with your departments strategy.';
        "Goal Setting": Record "HRM-Appraisal Goal Setting L";
        HRAppraisalGoals: Record "HRM-Appraisal Goal Setting L";

    procedure LinesExists(): Boolean
    var
        HRAppraisalGoals: Record "PRL-Pension Details";
    begin
        /*HasLines:=FALSE;
        HRAppraisalGoals.RESET;
        HRAppraisalGoals.SETRANGE(HRAppraisalGoals."Appraisal No","Appraisal No");
        IF HRAppraisalGoals.FIND('-') THEN BEGIN
             HasLines:=TRUE;
             EXIT(HasLines);
          END;  */

    end;
}

