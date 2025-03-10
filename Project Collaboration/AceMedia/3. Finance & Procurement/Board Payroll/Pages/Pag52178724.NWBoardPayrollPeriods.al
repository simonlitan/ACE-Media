page 52178724 "NW-Board Payroll Periods"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    //ModifyAllowed = false;
    PageType = List;
    SourceTable = "NW-Board Payroll Periods";

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
        area(Processing)
        {
            action(closeP)
            {
                Caption = 'Close Period';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}