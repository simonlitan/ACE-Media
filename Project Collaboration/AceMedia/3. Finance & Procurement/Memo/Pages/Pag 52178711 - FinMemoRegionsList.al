page 52178711 "Fin Memo Regions List"
{
    PageType = List;
    SourceTable = "Fin Memo Regions";
    UsageCategory = Administration;
    ApplicationArea = all;

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
                field(Regions; Rec.Regions)
                {
                    ToolTip = 'Specifies the value of the Regions field.';
                    ApplicationArea = All;
                }
                field(Classification; Rec.Classification)
                {
                    ToolTip = 'Specifies the value of the Classification field.';
                    ApplicationArea = All;
                }
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field.';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                }

            }
        }
    }
}