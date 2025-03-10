page 52179065 "Completed Mails"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Outbound Mail";
    UsageCategory = Lists;
    CardPageId = "Outbound Mail Card";
    SourceTableView = order(descending) where(Status = filter(Complete));
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Mail ID"; Rec."Mail ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mail ID field.';
                }
                field("Subject"; Rec."Mail Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mail Decription field.';
                }
                field("Dispatching Officer"; Rec."Dispatching Officer")
                {
                    ApplicationArea = All;
                }
                field("Date Dispatched"; Rec."Date Dispatched")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Dispatched field.';
                }
                field("Mode of Dispatch"; Rec."Mode of Dispatch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mode of Dispatch field.';
                }
                field("Receiving Officer"; Rec."Receiving Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receiving Officer field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
