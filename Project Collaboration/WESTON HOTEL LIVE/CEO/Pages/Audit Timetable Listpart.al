page 52179006 "Audit Timetable ListPart"
{
    Caption = 'Timetable';
    PageType = ListPart;
    SourceTable = "ISO-AuditTimetableListpartTabl";

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Audit No"; rec."Audit No.")
                {
                    // Visible = false;
                    Caption = 'Code';
                    ApplicationArea = All;
                }
                field("Audit date"; Rec."Audit date")
                {
                    ApplicationArea = All;

                }

                field("Time"; Rec."Time")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }
                field("Audit Area"; Rec."Audit Area")
                {
                    MultiLine = true;
                    ApplicationArea = All;

                }
                field("Participants"; Rec."Participants")
                {
                    ApplicationArea = All;

                }

            }
        }
    }

}
