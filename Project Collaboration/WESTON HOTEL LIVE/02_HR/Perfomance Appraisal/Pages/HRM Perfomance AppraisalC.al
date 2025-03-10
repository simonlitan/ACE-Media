page 50021 "HRM Perfomance AppraisalC"
{
    PageType = Card;
    SourceTable = "HRM Perfomance Appraisal";

    layout
    {
        area(Content)
        {
            group(general)
            {

                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                    ApplicationArea = All;

                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                    ApplicationArea = All;
                }
                field(UserName; Rec.UserName)
                {
                    ToolTip = 'Specifies the value of the UserName field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ToolTip = 'Specifies the value of the Institution Code field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Closed; Rec.Closed)
                {
                    ToolTip = 'Specifies the value of the Closed field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
            part(targets; "Periodic Appraisal TargetsL")
            {
                SubPageLink = "Appraisal Period" = field("Appraisal Period"), "Institution Code" = field("Institution Code");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UpdateTargets)
            {
                Caption = 'Update Targets';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                trigger OnAction()
                begin
                    Rec.TestField("Appraisal Period");
                    Rec.TestField("Start Date");
                    Rec.TestField("End Date");
                    Rec.TestField("Institution Code");
                    Rec.EscalateTargets();
                    Message('Updated Successifully');
                end;
            }
            action(ClassifyTargets)
            {
                Caption = 'Clasify Targets';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                trigger OnAction()
                begin
                    Rec.TestField("Appraisal Period");
                    Rec.TestField("Start Date");
                    Rec.TestField("End Date");
                    Rec.TestField("Institution Code");
                    Rec.ClassifyTargets();
                    Message('Updated Successifully');
                end;

            }
            action(ReportView)
            {
                ApplicationArea = All;
                Caption = 'Appraisal report';
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = report 52179251;

                trigger OnAction()
                var
                    HrmAppraisal: Record "HRM Perfomance Appraisal";
                begin
                    HrmAppraisal.Reset();
                    HrmAppraisal.SetRange("Appraisal Period", Rec."Appraisal Period");
                    if HrmAppraisal.FindFirst() then
                        REPORT.Run(50012, true, false, HrmAppraisal);

                end;
            }

        }
    }
}