page 52179085 "Training and Development List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "HRM-Training Projection Header";
    CardPageId = "Training and Development Card";
    PromotedActionCategories = 'New,Function,Approvals,Setup, Report';

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;

                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;

                }


                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;

                }
                field(period; Rec.period)
                {
                    ApplicationArea = All;
                    Caption = 'Training Period';

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }

            }
        }
    }

    actions
    {
        area(Reporting)
        {

            action("Training Projection")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = report "Training Projection";
            }
        }
    }

    var
        TrHead: Record "Annual Training Plan";
}