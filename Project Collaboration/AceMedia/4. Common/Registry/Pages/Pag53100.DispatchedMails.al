page 52179063 "Dispatched Mails"
{
    ApplicationArea = All;
    Caption = 'Dispatched Mails';
    PageType = List;
    SourceTable = "Outbound Mail";
    UsageCategory = Lists;
    CardPageId = "Outbound Mail Card";
    SourceTableView = order(descending) where(Status = filter(Dispatched));
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
                field("Mail Description"; Rec."Mail Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mail Decription field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("Date Received"; Rec."Date Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Received field.';
                }
                field("Receiving Officer"; Rec."Receiving Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receiving Officer field.';
                }
                field("Mode of Dispatch"; Rec."Mode of Dispatch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mode of Dispatch field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
