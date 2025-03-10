/// <summary>
/// PageExtension ExtDimension Values (ID 52179305) extends Record Dimension Values.
/// </summary>
pageextension 52178430 "Dimension Value PageExt" extends "Dimension Values"
{
    layout
    {
        addafter("Dimension Value Type")
        {
            field("Falls Under"; Rec."Falls Under")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Falls Under field.';
            }
            field("G/L Account No."; Rec."G/L Account No.")
            {
                Caption = 'Budget Account';
                ApplicationArea = All;
            }
            field("G/L Name"; Rec."G/L Name")
            {
                ApplicationArea = All;
            }

        }
        addafter(Blocked)
        {

            field("Global Dimension No."; Rec."Global Dimension No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension No. field.';
            }
        }

    }
}