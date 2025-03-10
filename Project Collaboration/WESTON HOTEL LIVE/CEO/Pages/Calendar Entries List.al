page 52179008 "CEO-Calendar Deytails"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CEO-Calendar Entries";
    CardPageId = "Calendar Entries Card";

    layout
    {
        area(Content)
        {
            repeater("Calendar List")
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Meeting Code';

                }
                field("Period Start"; Rec."Period Start")
                {
                    Caption = 'Date';
                    ApplicationArea = All;

                }
                field("Calendar Name"; Rec."Calendar Name")
                {
                    ApplicationArea = All;

                }

                field("AgendaDescription"; Rec.Agenda)
                {
                    Caption = 'Agenda';
                    ApplicationArea = All;

                }
                field("MeetingDescription"; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print Meetings")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = report "CEO-AllMeetingsList";

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}