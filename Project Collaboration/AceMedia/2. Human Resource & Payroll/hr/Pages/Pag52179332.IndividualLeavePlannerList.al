page 52179332 "Individual Leave Planner List"
{
    CardPageId = "Leave Planner Card";
    Caption = 'Individual Leave Planner';
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
    trigger OnOpenPage()
    begin
        rec.SetFilter("Created By", UserId);
    end;

    trigger OnAfterGetRecord()
    begin
        rec.SetFilter("Created By", UserId);
    end;
}
