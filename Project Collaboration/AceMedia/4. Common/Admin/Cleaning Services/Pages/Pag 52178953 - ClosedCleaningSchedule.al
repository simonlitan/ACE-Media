page 52178953 "Closed Cleaning Schedule"
{
    Caption = 'Closed Cleaning Schedule';
    CardPageId = "Cleaning Card";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    DelayedInsert = false;
    PageType = List;
    SourceTable = "Cleaning Header";
    SourceTableView = where(Closed = const(true));

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
                field("Schedule Type"; Rec."Schedule Type")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Supervisor No"; Rec."Supervisor No")
                {
                    ApplicationArea = All;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
