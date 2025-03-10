page 52178917 "Opportunity Booking Schedules"
{
    PageType = ListPart;
    SourceTable = "Booking Schedule";

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                //  Editable = edt;
                field("Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Block Code"; Rec."Block Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Block Code field.';
                }
                field("Unit Code"; Rec."Unit Code")
                {
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
    var
        edt: Boolean;


    procedure editability()
    begin

        edt := true;
        if Rec."Booking Confirmed" = true then
            edt := false;

    end;
}