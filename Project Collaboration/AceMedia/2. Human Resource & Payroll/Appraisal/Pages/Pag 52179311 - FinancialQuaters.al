page 52179311 "Financial Quaters"
{
    Caption = 'Financial Quaters';
    PageType = List;
    SourceTable = "Financial Quater";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Quater Code"; Rec."Quater Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quater Code field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
    }
}
