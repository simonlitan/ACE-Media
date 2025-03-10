page 52178910 "TR Closed Worktickets"
{
    Caption = 'TR Closed Worktickets';
    Editable = false;
    DeleteAllowed = false;
    DelayedInsert = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "TR Workticket Header";
    SourceTableView = where(Closed = const(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field("Ticket No"; Rec."Ticket No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ticket No field.';
                }
                field("Previous Ticket No"; Rec."Previous Ticket No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Previous Ticket No field.';
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
            }
        }
    }
    actions
    {

        area(Processing)
        {
            action("Work Ticket Report")
            {
                ApplicationArea = all;
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    rec.Reset();
                    rec.SetRange(rec."Ticket No", rec."Ticket No");
                    report.run(report::"TR Workticket", true, true, rec);
                end;
            }
        }
    }
}
