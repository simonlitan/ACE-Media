page 52179059 "Clearance Lines"
{
    Caption = 'Clearance Lines';
    PageType = ListPart;
    SourceTable = "Clearance lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Cleared By"; Rec."Cleared By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cleared By field.';
                }
                field("Clearer Name"; Rec."Clearer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Clearer Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Date Initiated"; Rec."Date Initiated")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Initiated field.';
                }
                field(Cleared; Rec.Cleared)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cleared? field.';
                }
                field("Not Cleared"; Rec."Not Cleared")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Not Cleared? field.';
                }
                field("Date Cleared"; Rec."Date Cleared")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Cleared field.';
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
