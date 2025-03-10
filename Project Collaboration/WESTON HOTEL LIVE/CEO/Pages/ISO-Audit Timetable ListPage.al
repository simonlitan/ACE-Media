page 52178916 "Audit Timetable ListPage"
{
    Caption = 'ISO-Audit Timetable';
    PageType = List;
    SourceTable = "Audit Timetable";
    CardPageId = "Audit Timetable CardPage";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Timetable number"; Rec."Timetable No.")
                {
                    ApplicationArea = All;

                }
            }

        }
    }
}
