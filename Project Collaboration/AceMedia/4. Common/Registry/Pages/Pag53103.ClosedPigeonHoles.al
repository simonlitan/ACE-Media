page 52179066 "Closed Pigeon Holes"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Pigeon Hole";
    UsageCategory = Lists;
    CardPageId = "Pigeon Hole";
    SourceTableView = where(Status = filter(Closed));
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Hole ID"; Rec."Hole ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hole ID field.';
                }
                field(Owner; Rec.Owner)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Owner field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
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
