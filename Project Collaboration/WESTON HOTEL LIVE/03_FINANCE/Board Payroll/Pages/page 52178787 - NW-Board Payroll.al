page 52178787 "NW-Board Payroll"
{
    PageType = List;
    Editable = false;
    SourceTable = "NW-Board Payroll";
    CardPageId = "NW-Board Payroll Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Almanac Ref."; Rec."Almanac Ref.")
                {
                    ToolTip = 'Specifies the value of the Almanac Ref. field.';
                    ApplicationArea = All;
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
                field("Period Week"; Rec."Period Week")
                {
                    ToolTip = 'Specifies the value of the Period Week field.';
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
                field("Committee Name"; Rec."Committee Name")
                {
                    ToolTip = 'Specifies the value of the Committee Name field.';
                    ApplicationArea = All;
                }
                field("Meeting Details 1"; Rec."Meeting Details 1")
                {
                    ToolTip = 'Specifies the value of the Meeting Details 1 field.';
                    ApplicationArea = All;
                }
                field("Meeting Details 2"; Rec."Meeting Details 2")
                {
                    ToolTip = 'Specifies the value of the Meeting Details 2 field.';
                    ApplicationArea = All;
                }
                field("Estimated Budget"; Rec."Estimated Budget")
                {
                    ToolTip = 'Specifies the value of the Estimated Budget field.';
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}