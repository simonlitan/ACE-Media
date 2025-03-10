page 52179340 "Training Needs Analysis List"
{
    CardPageId = "Training Needs Analysis Card";
    Editable = false;
    InsertAllowed = false;
    Caption = 'Training Needs Analysis List';
    PageType = List;
    SourceTable = "HRM-Training Needs Analysis 2";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Course Relevant"; Rec."Course Relevant")
                {
                    ApplicationArea = All;
                }
                field("Trainings Attended"; Rec."Trainings Attended")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
