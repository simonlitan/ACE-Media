page 52179072 "Alternative Dispute List"
{
    CardPageId = "Alternative DisputeCard";
    Caption = 'Alternative Dispute List';
    PageType = List;
    SaveValues = true;
    SourceTable = "HRM-Alternative Dispute R";
    deleteallowed = false;
    editable = false;
    InsertAllowed = false;
    DelayedInsert = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Investigating Officer Name"; Rec."Investigating Officer Name")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Status 2"; Rec."Status 2")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
