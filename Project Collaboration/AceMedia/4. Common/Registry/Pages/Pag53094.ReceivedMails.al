page 52179031 "Received Mails"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Received Mail";
    UsageCategory = Lists;
    CardPageId = "Received Mail Card";

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
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender field.';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field("KEFRI's"; Rec."KEFRI's")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the KEFRI''s field.';
                }
                field("Send back to Sender"; Rec."Send back to Sender")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Send back to Sender field.';
                }
                field("Receieved by"; Rec."Receieved by")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Receieved by field.';
                }
                field("Received at"; Rec."Received at")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Received at field.';
                }
            }
        }
    }
}
