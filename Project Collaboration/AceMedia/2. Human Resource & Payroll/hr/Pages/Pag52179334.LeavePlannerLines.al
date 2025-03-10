page 52179334 "Leave Planner Lines"
{
    Caption = 'Leave Planner Lines';
    PageType = ListPart;
    SourceTable = "HRM-Leave Planner Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Period; Rec.Period)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("S/No"; Rec."S/No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the S/No field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
    }
}
