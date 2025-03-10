page 52178925 "Legal-Cases List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Legal-Cases";
    CardPageId = "Legal-Cases Card";
    SourceTableView = WHERE(Status = FILTER(Open | Suspended));

    layout
    {
        area(Content)
        {
            repeater("Legal Cases List")
            {
                field("Case Number"; Rec."File Case Number")
                {
                    ApplicationArea = All;

                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = All;

                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = All;

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
            action("Legal Cases List Report")
            {
                Image = "Report";
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETFILTER("File Case Number", Rec."File Case Number");
                    IF Rec.FINDFIRST THEN
                        REPORT.RUN(Report::"Legal-CaseList Report", TRUE, FALSE, Rec);
                end;
            }
        }
        area(Processing)
        {
            action("Conveyancing Reports")
            {
                ApplicationArea = All;
                Image = Receipt;

                trigger OnAction()
                begin

                end;
            }
            action("Contractual Reports")
            {
                ApplicationArea = All;
                Image = WageLines;

                trigger OnAction()
                begin

                end;
            }
            action("Labour Reports")
            {
                ApplicationArea = All;
                Image = WageLines;

                trigger OnAction()
                begin

                end;
            }
            action("Commercial Reports")
            {
                ApplicationArea = All;
                Image = WageLines;

                trigger OnAction()
                begin

                end;
            }

        }
    }

    var
        myInt: Integer;
}