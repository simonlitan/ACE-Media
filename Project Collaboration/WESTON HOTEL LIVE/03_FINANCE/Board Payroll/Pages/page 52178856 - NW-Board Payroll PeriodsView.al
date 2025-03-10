page 52178856 "NW-Board Payroll PeriodsView"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    //ModifyAllowed = false;
    PageType = List;
    SourceTable = "NW-Board Payroll Periods";
    SourceTableView = where(Closed = filter(false));

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
            }
        }
    }

    actions
    {
    }
}