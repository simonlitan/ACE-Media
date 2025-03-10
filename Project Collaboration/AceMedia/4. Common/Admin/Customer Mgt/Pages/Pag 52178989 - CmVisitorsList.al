page 52178989 "Cm Visitors List"
{
    Caption = 'Visitors List';
    CardPageId = "Cm Visitors Card";
    Editable = false;
    InsertAllowed = false;
    DelayedInsert = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Cm Visitors";
    SourceTableView = where(Status = const(New));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = All;
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Purpose of Visit"; Rec."Purpose of Visit")
                {
                    ApplicationArea = All;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = All;
                }
                field(Feedback; Rec.Feedback)
                {
                    ApplicationArea = All;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
        }
    }
}
