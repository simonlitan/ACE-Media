page 52179097 "HRM-Leave Allowance List"
{
    Caption = 'HRM-Leave Allowance List';
    CardPageId = "HRM-Leave  Allowance Card";

    PageType = list;
    SaveValues = true;
    Editable = false;
    SourceTable = "HRM-Leave Allowance Header";

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
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Name field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
