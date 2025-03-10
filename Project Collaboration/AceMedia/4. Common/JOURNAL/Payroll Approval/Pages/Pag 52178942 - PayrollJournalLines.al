page 52178942 "Payroll Journal Lines"
{
    Caption = 'Payroll Journal Lines';
    PageType = ListPart;
    SourceTable = "Payroll Journal Details";
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.', Comment = '%';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.', Comment = '%';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Code field.', Comment = '%';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Name field.', Comment = '%';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Description field.', Comment = '%';
                }
                
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
            }
        }

    }


}
