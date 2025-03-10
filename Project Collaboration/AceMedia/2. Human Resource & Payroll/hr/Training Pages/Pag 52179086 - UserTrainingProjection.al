page 52179086 "User Training Projection"
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
            action("3YR Training Plan Report")
            {
                ApplicationArea = All;
                Image = Report2;
                Promoted = true;
                PromotedCategory = Category5;
                //  RunObject = report "Recruitment Plan Report";
                // trigger OnAction()
                // begin
                //     TrHead.RESET;
                //     TrHead.SETRANGE(Rec."Ref. No.", Rec."Ref. No.");
                //     IF TrHead.FIND('-') THEN BEGIN
                //         REPORT.RUN(Report::"TR-TNA", TRUE, FALSE, TrHead);
                //     END;
                // end;
            }
        }
    }

    var
        TrHead: Record "Annual Training Plan";
}
