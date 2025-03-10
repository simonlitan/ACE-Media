page 50042 "Payroll Journal Trasfer Header"
{
    PageType = Document;
    SourceTable = "Payroll Journal Transfer";

    layout
    {
        area(Content)
        {
            Group(General)
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
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field("Period Name"; Rec."Period Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Name field.';
                }
            }
            part(Lines; "Payroll Journal Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No."), "Payroll Period" = field("Payroll Period");
            }
        }
    }
}