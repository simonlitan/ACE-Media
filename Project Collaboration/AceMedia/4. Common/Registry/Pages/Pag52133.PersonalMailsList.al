page 52178955 "Personal Mails List"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Personal Mail";
    UsageCategory = Lists;
    CardPageId = "Personal Mail Card";
    SourceTableView = order(descending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Mail ID"; Rec."Mail ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Mail ID field.';
                }
                field("Subject"; Rec."Subject")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = All;
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender field.';
                }
                field("Pigeon Hole"; Rec."Hole ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Recepient; Rec.Recepient)
                {
                    ApplicationArea = All;
                }
                field("Received by"; Rec."Received by")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received by field.';
                }
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = all;
                }
                field("Collected"; Rec."Collected?")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}

