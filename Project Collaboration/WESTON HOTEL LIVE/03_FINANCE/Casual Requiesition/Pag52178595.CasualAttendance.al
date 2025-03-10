page 52178595 "Casual Attendance"
{
    Caption = 'Casual Attendance';
    PageType = List;
    SourceTable = "Casual Attendance";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Person ID";Rec."Person ID")
                {
                    ApplicationArea = all;
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea =all;
                }
                field(Department;Rec.Department)
                {
                    ApplicationArea = all;
                }
                field(Time;Rec.Time)
                {

                }
                field("Attendance Status";Rec."Attendance Status")
                {
                    ApplicationArea = all;
                }
                field("Check Point";Rec."Check Point")
                {
                    ApplicationArea = all;
                }
                field("Custom Name";Rec."Custom Name")
                {
                    ApplicationArea= all;
                }
                field("Data Source";Rec."Data Source")
                {
                    ApplicationArea = all;
                }
            }

        }
    }
}
