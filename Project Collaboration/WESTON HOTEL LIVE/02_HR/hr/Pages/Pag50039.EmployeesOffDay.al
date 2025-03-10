page 50047 "Employees Off Day"
{
    ApplicationArea = All;
    Caption = 'Employees Off Day';
    PageType = List;
    SourceTable = "Employee Off Day";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Off Day"; Rec."Off Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Off Day field.';
                }
            }
        }
    }
}
