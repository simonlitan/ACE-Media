pageextension 52179305 "Dimension Value PageExt" extends "Dimension Values"
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
            field(Casuals;Rec.Casuals)
            {
                ApplicationArea = all;
            }
            field("Dimension Code 2";Rec."Dimension Code 2")
            {
                ApplicationArea = all;

            }
            field("Dimension Name 2";Rec."Dimension Name 2")
            {
                ApplicationArea = all;

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
        addafter(Name)
        {
            field(Main; Rec.Main)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
}