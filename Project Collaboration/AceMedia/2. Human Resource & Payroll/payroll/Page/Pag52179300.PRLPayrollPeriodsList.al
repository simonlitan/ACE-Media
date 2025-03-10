page 52179300 "PRL-Payroll Periods List"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "PRL-Payroll Periods";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date Opened"; Rec."Date Opened")
                {
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                }
                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = All;
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = All;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = All;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                }
                field("JV No."; Rec."JV No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the JV No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

