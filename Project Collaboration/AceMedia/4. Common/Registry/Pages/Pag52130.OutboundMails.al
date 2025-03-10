page 52178932 "Outbound Mails"
{
    ApplicationArea = All;
    Caption = 'Open Outbound Mails';
    PageType = List;
    SourceTable = "Outbound Mail";
    UsageCategory = Lists;
    CardPageId = "Outbound Mail Card";
    SourceTableView = sorting("Mail ID") order(descending) where(Status = filter(Open));

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
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Destination field.';
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
                field("Weight "; Rec."Weight ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight  field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
            }
        }
    }
}
