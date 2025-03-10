page 52179354 "Self Appraisal Card"
{
    Caption = 'Self Appraisal Card';
    PageType = Card;
    SourceTable = "Employee Self-Appraisal";
    DeleteAllowed = false;
    // SourceTableView = where(Closed = filter(false));
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnValidate()
                    var
                        AppraisalCategories: Record "Appraisal Category Level";
                        SelfAppraisalline: Record "Self Appraisal Line";
                        LineNo: Integer;
                    begin

                    end;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("Period Under Review"; Rec."Period Under Review")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Under Review field.';
                }
                field("WorkPlan No."; Rec."WorkPlan No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WorkPlan No. field.';
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                }

                field("Supervisor’s Name:"; Rec."Supervisor’s Name:")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor’s Name: field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Divison/section"; Rec."Divison/section")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Divison/section field.';
                }
                field("Last Review Date"; Rec."Last Review Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Review Date field.';
                }
                field("Years of service"; Rec."Years of service")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Years of service field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("User ID"; Rec."User ID")
                {

                }

            }
            part("Strategic Objective"; "Strategic Objective")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            label("PART II: TRAININGS IDENTIFICATION")
            {
                ApplicationArea = Basic, Suite;
                Style = Strong;
                StyleExpr = true;

            }
            field("Training Identification"; Rec."Training Identification")
            {
                ApplicationArea = all;
                MultiLine = true;
            }

            label("PART III: COMMENTS/RECOMMENDATIONS")
            {
                ApplicationArea = Basic, Suite;
                Style = Strong;
                StyleExpr = true;
            }
            field("Appraisee Comments"; Rec."Appraisee Comments")
            {
                ApplicationArea = all;
                MultiLine = true;
            }
            label("Supervisor Comments and Recomendations")
            {
                ApplicationArea = Basic, Suite;
                Style = Strong;
                StyleExpr = true;
            }
            field("Supervisor Comments"; Rec."Supervisor Comments")
            {
                ApplicationArea = all;
                MultiLine = true;
            }
            label("PART IV: ADDITIONAL ASSIGNMENTS")
            {
                ApplicationArea = Basic, Suite;
                Style = Strong;
                StyleExpr = true;
            }
            group("Additional Assignments.")
            {

                field("Additional Assignments"; Rec."Additional Assignments")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }




            }
        }
        area(FactBoxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Send For Approval")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    ApprovalMgnt: Codeunit IntCodeunit2;
                begin
                    if ApprovalMgnt.IsAppraisalEnabled(Rec) = true then
                        ApprovalMgnt.OnSendAppraisalforApproval(Rec)
                    else
                        Error('No workflow enabled!');
                end;
            }
            action("Cancel Approval Approval")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    ApprovalsMgmtCut.OnCancelAppraisalHeaderForApproval(Rec);
                end;
            }
            action("Appraise")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                //Visible = Sup;

                Trigger OnAction()
                var
                    Selfapp: Record "Employee Self-Appraisal";
                    App_appr: Record "Appraisal Approvals";
                    Opera: Record "Self Appraisal Line";
                begin
                    Rec.TestField(Rec."Appraising Supervisor");
                    Rec.TestField(Rec."Appraising Supervisor Name");
                    Rec.TestField(Status, Rec.Status::Submitted);

                    Selfapp.SetRange("No.", Rec."No.");
                    //Selfapp.SetRange(Status, Rec.Status::Submitted);
                    If Selfapp.Find('-') then begin
                        Message('Here');
                        App_appr.Init();
                        App_appr.Id := App_appr.Entryno() + 1;
                        App_appr.Code := Selfapp."No.";
                        App_appr."Appraising Supervisor" := Selfapp."Appraising Supervisor Userid";
                        App_appr."Employee" := Selfapp."User ID";
                        App_appr."Sender Id" := Selfapp."Appraising Supervisor Userid";
                        App_appr."Approver Id" := Selfapp."User ID";
                        App_appr."Workplan No" := Selfapp."WorkPlan No.";
                        App_appr.Approved := True;
                        App_appr.Status := Rec.Status;
                        App_appr.Insert();
                        Message('Submitted SuccessFully');
                        Rec."Send To" := Rec."User ID";
                        Rec.Status := Rec.Status::"Supervisor's Rating";
                        Rec.Modify();
                        If Confirm('Add Comment', True) = false Then Exit;
                        AddComment();
                        CurrPage.Close();
                    end;

                End;
            }

            action("Automatically Populate Lines")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                // Visible = false;
                trigger OnAction()
                var
                    AppraisalCategories: Record "Appraisal Category Level";
                    SelfAppraisalline: Record "Self Appraisal Line";
                    LineNo: Integer;
                begin
                    if (Rec.Grade = 'Salary Grade 1') or (Rec.Grade = 'Salary Grade 2') or (Rec.Grade = 'Salary Grade 3') then
                        AppraisalCategories.SetFilter(Grade, '%1|%2', AppraisalCategories.Grade::Both, AppraisalCategories.Grade::"123")
                    else
                        AppraisalCategories.SetFilter(Grade, '%1|%2', AppraisalCategories.Grade::Both, AppraisalCategories.Grade::"456");
                    SelfAppraisalline.Init();
                    repeat
                        if SelfAppraisalline.FindLast() then
                            LineNo := SelfAppraisalline."Line No." + 10000
                        else
                            LineNo := 10000;
                        SelfAppraisalline.Reset();
                        SelfAppraisalline."Line No." := LineNo;
                        SelfAppraisalline."Document No." := Rec."No.";
                        SelfAppraisalline.Type := AppraisalCategories.Category;
                        SelfAppraisalline."Max Score" := AppraisalCategories.Score;
                        SelfAppraisalline."Type Code" := AppraisalCategories.Code;
                        SelfAppraisalline.Description := AppraisalCategories.Description;
                        SelfAppraisalline.Insert();
                    until AppraisalCategories.Next() = 0;
                    Message('Generated Successfully');
                end;
            }
            action(Close)
            {
                ApplicationArea = all;
                PromotedCategory = Process;
                Promoted = true;
                Image = CloseDocument;
                Visible = false;
                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    ID: Code[20];
                begin
                    UserSetup.SetRange("User ID", 'Appkings');
                    if UserSetup.FindFirst() then begin
                        ID := UserSetup."User ID";
                    end;

                    if UserId = ID then begin
                        Rec.Closed := true;
                        Rec.Modify();
                    end else
                        Error('Only %1 can close this appraisal', ID);
                end;
            }
        }
        area(Creation)
        {
            action(Comment)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Comments List";
                RunPageLink = "No." = FIELD("No.");
                // RunPageMode = View;
                trigger OnAction()
                begin

                end;
            }
        }
        area(Reporting)
        {
            action("Appraisal Report")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    if Rec.FindFirst() then begin
                        // if Rec.GradeInt <= 4 then
                        Report.Run(Report::"Appraisal Report", true, true, rec)
                        //  else
                        //  Report.Run(Report::"Appraisal Report2", true, true, rec);
                    end;
                end;
            }
        }
        area(Navigation)
        {
            group(GROUP4)
            {

            }
        }
    }


    var
        ApprovalsMgmtCut: Codeunit "OM Approval Mgmt. Ext";


    procedure AddComment()
    Var
        Appcom: Record "Appraisal Comments";
    begin
        Rec.Reset();
        Rec.SetRange("No.", Rec."No.");
        If Rec.Find('-') then begin
            Appcom.Init();
            Appcom."Appraisal No" := Rec."No.";
            Appcom.UserId := UserId;
            Appcom."Comment Date" := Today;
            Appcom."Rating Status" := Rec.Status;
            //Appcom."Entry No" := 
            Appcom.Insert();
            Page.Run(Page::"Appraisal Comments", Appcom);
        end;
    end;
}


