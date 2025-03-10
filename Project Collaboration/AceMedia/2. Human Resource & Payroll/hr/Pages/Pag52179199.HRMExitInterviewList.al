page 52179199 "HRM-Exit Interview List"
{
    CardPageID = "HRM-Emp. Exit Requisition";
    Editable = false;
    DeleteAllowed = false;
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

                    ApplicationArea = All;
                }
                field("Date Of Clearance"; Rec."Date Of Clearance")
                {

                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Interview Done By"; Rec."Clearer Name")
                {
                    ApplicationArea = All;
                }
                field("Nature Of Separation"; Rec."Nature Of Separation")
                {

                    ApplicationArea = All;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {

                    ApplicationArea = All;
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {

                    ApplicationArea = All;
                }
            }
        }

    }

    actions
    {
    }
}

