page 52178777 "Board Almanac List"
{
    PageType = List;
    CardPageId = "Board Almanac Card";
    SourceTable = "Board Almanac";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
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
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                    ApplicationArea = All;
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}