page 52179331 "HRM-Leave Plan List"
{
    CardPageId = "Leave Planner Card";
    Caption = 'HRM-Leave Plan List';
    PageType = List;
    SourceTable = "HRM-Leave Planner Header";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Period; Rec.Period)
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Period Start Date"; Rec."Period Start Date")
                {
                    ApplicationArea = All;
                }
                field("Period End Date"; Rec."Period End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
