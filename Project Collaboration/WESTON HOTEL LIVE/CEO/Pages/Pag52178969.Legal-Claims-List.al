page 52178969 "Legal-Claims List"
{
    Caption = 'Legal-Claims List';
    ApplicationArea = All;
    UsageCategory = Administration;
    PageType = List;
    CardPageId = "Legal-Claims Card";
    SourceTable = "Legal-Claims Table";

    layout
    {
        area(Content)
        {
            repeater("Legal Cases List")
            {
                field("Claim Number"; Rec."Claim Number")
                {
                    ApplicationArea = All;

                }
                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;

                }
                field("Date Raised"; Rec."Date Raised")
                {
                    ApplicationArea = All;

                }
                field("Raised By"; Rec."Raised By")
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
            // action("Legal Cases List Report")
            // {
            //     Image = "Report";
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     begin
            //         Rec.RESET;
            //         Rec.SETFILTER("File Case Number", Rec."File Case Number");
            //         IF Rec.FINDFIRST THEN
            //             REPORT.RUN(Report::"Legal-CaseList Report", TRUE, FALSE, Rec);
            //     end;
            // }
        }
        area(Processing)
        {
            // action("Internal")
            // {
            //     ApplicationArea = All;
            //     Image = Receipt;

            //     trigger OnAction()
            //     begin

            //     end;
            // }
            // action("External")
            // {
            //     ApplicationArea = All;
            //     Image = WageLines;

            //     trigger OnAction()
            //     begin

            //     end;
            // }

        }
    }

    var
        myInt: Integer;
}