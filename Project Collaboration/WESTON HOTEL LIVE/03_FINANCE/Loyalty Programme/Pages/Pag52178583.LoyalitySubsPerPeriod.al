page 52178583 "Loyality Subs Per Period"
{
    PageType = ListPart;
    SourceTable = "Loyality Subs Per Period";

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field(Programme; Rec.Programme)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Programme field.';
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Registered field.';
                }
                field("Registered By"; Rec."Registered By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registered By field.';
                }
                field("Subscription Posted"; Rec."Subscription Posted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subscription Posted field.';
                }
                field(Balance; Rec.Balance)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
            }
        }
    }
}