page 68905 "HRM-Exit Interview List"
{
    CardPageID = "HRM-Emp. Exit Requisition";
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Employee Exit Interviews";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Exit Clearance No"; Rec."Exit Clearance No")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Date Of Clearance"; Rec."Date Of Clearance")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Interview Done By"; Rec."Clearer Name")
                {
                    ApplicationArea = All;
                }
                field("Nature Of Separation"; Rec."Nature Of Separation")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755004; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1102755006; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

