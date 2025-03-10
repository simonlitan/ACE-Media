page 52178858 "FIN-Memo Refs"
{
    PageType = List;
    SourceTable = "FIN-Memo Refs";
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                    ApplicationArea = All;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.';
                    ApplicationArea = All;
                }
                field("Department  Prefix"; Rec."Department  Prefix")
                {
                    ToolTip = 'Specifies the value of the Department  Prefix field.';
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                    ApplicationArea = All;
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.';
                    ApplicationArea = All;
                }
                field("Memo Prefix"; Rec."Memo Prefix")
                {
                    ToolTip = 'Specifies the value of the Memo Prefix field.';
                    ApplicationArea = All;
                }

                field("Modified Date"; Rec."Modified Date")
                {
                    ToolTip = 'Specifies the value of the Modified Date field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}