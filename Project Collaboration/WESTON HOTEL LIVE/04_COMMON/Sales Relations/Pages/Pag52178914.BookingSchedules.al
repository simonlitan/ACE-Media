page 52178914 "Booking Schedules"
{
    PageType = ListPart;
    SourceTable = "Booking Schedule";

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("Unit Code"; Rec."Unit Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Code field.';
                }

                field(Opportunity; Rec.Opportunity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Opportunity field.';
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start date field.';
                }
                field("No of days"; Rec."No of days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of days field.';
                }
                field("End date"; Rec."End date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End date field.';
                }

                field("View Opportunity"; Rec."View Opportunity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the View Opportunity field.';
                }
                field("Booking Status"; Rec."Booking Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking Status field.';
                }
            }
        }
    }
}