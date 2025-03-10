page 52179350 "HRM-Recalled Leave List"
{
    CardPageId = "HRM-Leave Recall Card";
    Caption = 'HRM-Recalled Leave List';
    PageType = List;
    SourceTable = "HRM-Leave Recall";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Leave No"; Rec."Leave No")
                {
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ApplicationArea = All;
                }
                field("Utilized Days"; Rec."Utilized Days")
                {
                    ApplicationArea = All;
                }
                field("Days Recalled"; Rec."Days Recalled")
                {
                    ApplicationArea = All;
                }

                field("Type of leave"; Rec."Type of leave")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Reason for Recall"; Rec."Reason for Recall")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Recall Report")
            {
                ApplicationArea = all;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                RunObject = report "Leave Recall Report";

            }
        }
    }
}
