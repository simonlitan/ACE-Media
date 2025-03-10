page 52178917 "Audit Timetable CardPage"
{
    Caption = 'Audit Timetable';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Audit Timetable";

    layout
    {
        area(Content)
        {

            field("Timetable number"; Rec."Timetable No.")
            {
                Caption = 'Timetable number';
                ApplicationArea = All;
            }


            part("Audit Timetable"; "Audit Timetable ListPart")
            {
                SubPageLink = "Audit No." = FIELD("Timetable No.");
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action("Add Meeting Attendants")
            // {
            //     ApplicationArea = All;
            //     Image = Dimensions;
            //     RunObject = Page "CEO-Meeting Participants Page";
            //     //RunObject = Page "CEO-Meeting Participants Page";
            //     // RunObject = page "CEO-Meetings";
            //     // RunPageLink = "Code" = field(Code);


            //     trigger OnAction()
            //     begin

            //     end;
            // }

            action("Print Timetable")
            {
                ApplicationArea = All;
                RunObject = report "ISO-AuditTimetableReport";

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}