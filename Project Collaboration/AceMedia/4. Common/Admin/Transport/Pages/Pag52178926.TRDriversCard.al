page 52178899 "TR Drivers Card"
{
    Caption = 'TR Drivers Card';
    PageType = Card;
    SourceTable = "TR Drivers";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Driver No"; Rec."Driver No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver No field.';
                }
                field("Drivers Name"; Rec."Drivers Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Drivers Name field.';
                }
                field("License No"; Rec."License No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the License No field.';
                }
                field("Years Of Experience"; Rec."Years Of Experience")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Years Of Experience field.';
                }
                field("License Class"; Rec."License Class")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the License Class field.';
                }
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last License Renewal field.';
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Renewal Interval Value field.';
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Next License Renewal field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active field.';
                }
            }
        }
    }
}
