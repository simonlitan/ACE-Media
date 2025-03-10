page 52179333 "Leave Planner Card"
{
    Caption = 'Leave Planner Card';
    PageType = Card;
    SourceTable = "HRM-Leave Planner Header";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Period; Rec.Period)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Period Start Date"; Rec."Period Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Start Date field.';
                }
                field("Period End Date"; Rec."Period End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period End Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part("Leave Planner Lines"; "Leave Planner Lines")
            {
                ApplicationArea = all;
                SubPageLink = Period = field(Period), "Employee No" = field("Employee No");
            }
        }
    }
}
