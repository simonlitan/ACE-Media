page 52178895 "TR Drivers List"
{
    Caption = 'TR Drivers List';
    CardPageId = "TR Drivers Card";
    DeleteAllowed = false;
    Editable = false;

    PageType = List;
    SourceTable = "TR Drivers";

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field("License Class"; Rec."License Class")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the License Class field.';
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
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last License Renewal field.';
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Next License Renewal field.';
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
