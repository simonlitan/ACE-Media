page 52178780 "Board Almanac Card"
{
    PageType = Card;
    SourceTable = "Board Almanac";

    layout
    {
        area(Content)
        {
            group(general)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Quater; Rec.Quater)
                {
                    ToolTip = 'Specifies the value of the Quater field.';
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ToolTip = 'Specifies the value of the Period Month field.';
                    ApplicationArea = All;
                }

                field("Meeting Date"; Rec."Meeting Date")
                {
                    ToolTip = 'Specifies the value of the Meeting Date field.';
                    ApplicationArea = All;
                }
                field("Committee Code"; Rec."Committee Code")
                {
                    ToolTip = 'Specifies the value of the Committee Code field.';
                    ApplicationArea = All;
                }
                field("Budget Period"; Rec."Budget Period")
                {
                    ToolTip = 'Specifies the value of the Budget Period field.';
                    ApplicationArea = All;
                }

                field(Closed; Rec.Closed)
                {
                    ToolTip = 'Specifies the value of the Closed field.';
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Committee Name"; Rec."Committee Name")
                {
                    ToolTip = 'Specifies the value of the Committee Name field.';
                    ApplicationArea = All;
                }
                field("Meeting Details 1"; Rec."Meeting Details 1")
                {
                    ToolTip = 'Specifies the value of the Meeting Details 1 field.';
                    ApplicationArea = All;
                    MultiLine = true;

                }
                field("Meeting Details 2"; Rec."Meeting Details 2")
                {
                    ToolTip = 'Specifies the value of the Meeting Details 2 field.';
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Estimated Budget"; Rec."Estimated Budget")
                {
                    ToolTip = 'Specifies the value of the Estimated Budget field.';
                    ApplicationArea = All;
                }
                field(Approved; Rec.Approved)
                {
                    ToolTip = 'Specifies the value of the Approved field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }
}