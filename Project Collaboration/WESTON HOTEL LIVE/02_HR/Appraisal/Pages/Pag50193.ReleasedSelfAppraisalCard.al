page 50205 "Released Self Appraisal Card"
{
    Caption = 'Released Self Appraisal Card';
    PageType = Card;
    SourceTable = "Employee Self-Appraisal";
    SourceTableView = where(Status = const(Released));

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
                field("Period Under Review"; Rec."Period Under Review")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Under Review field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }

            }
            part("Strategic Objective"; "Strategic Objective")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            part("Operational Efficiency"; "Operational Efficiency")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            part("Communication Skill"; "Communication Skills")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            part("Personal Attributes"; "Personal Attributes")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            part("Leadership Skills"; "Leadership Skills")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            part("Role Execution Oversite"; "Role Execution Oversite")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            part(training; "Training Line")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = FIELD("WorkPlan No.");
                UpdatePropagation = Both;
            }
            group(Totals)
            {

                field(" Self Operation Efficiency"; Rec." Self Operation Efficiency")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the  Self Operation Efficiency field.';
                }
                field("Agreed Leadership Skills"; Rec."Agreed Leadership Skills")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Agreed Leadership Skills field.';
                }
                field("Agreed Operation Effic"; Rec."Agreed Operation Effic")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Agreed Operation Effic field.';
                }
                field("Agreed Personal Attributes"; Rec."Agreed Personal Attributes")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Agreed Personal Attributes field.';
                }
                field("Agreed Role Execution"; Rec."Agreed Role Execution")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Agreed Role Execution field.';
                }
                field("Self Communication Skills"; Rec."Self Communication Skills")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Communication Skills field.';
                }
                field("Self Leadership Skills"; Rec."Self Leadership Skills")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Leadership Skills field.';
                }
                field("Self Personal Attributes"; Rec."Self Personal Attributes")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Personal Attributes field.';
                }
                field("Self Role Execution Oversite"; Rec."Self Role Execution Oversite")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Self Role Execution Oversite field.';
                }
                field("Supervisor Communication Skill"; Rec."Supervisor Communication Skill")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor Communication Skill field.';
                }
                field("Supervisor Leadership Skills"; Rec."Supervisor Leadership Skills")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor Leadership Skills field.';
                }
                field("Supervisor Operation Effic"; Rec."Supervisor Operation Effic")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor Operation Effic field.';
                }
                field("Supervisor Personal Attributes"; Rec."Supervisor Personal Attributes")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor Personal Attributes field.';
                }
                field("Supervisor Role Execution"; Rec."Supervisor Role Execution")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supervisor Role Execution field.';
                }
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
                begin
                    //  if ApprovalsMgmtCut.CheckEmployeeAppraisalObjectivesApprovalsWorkflowEnable(Rec) then
                    // ApprovalsMgmtCut.OnSendEmployeeAppraisalObjectivesForApproval(Rec);
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
                end;
            }
            action("Automatically Populate Lines")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                trigger OnAction()
                var
                    AppraisalCategories: Record "Appraisal Category Level";
                    SelfAppraisalline: Record "Self Appraisal Line";
                    LineNo: Integer;
                begin
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
                        //if Rec.GradeInt <= 4 then
                            Report.Run(Report::"Appraisal Report", true, true, rec)
                     //   else
                           // Report.Run(Report::"Appraisal Report2", true, true, rec);
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
    // ApprovalsMgmtCut: Codeunit "EAO Approval Mgmt. Ext";

}
