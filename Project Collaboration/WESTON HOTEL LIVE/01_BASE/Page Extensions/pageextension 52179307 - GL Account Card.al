pageextension 52179307 "G/L Account Card" extends "G/L Account Card"
{
    layout
    {
        addlast(General)
        {
            field("Budget Controlled"; Rec."Budget Controlled")
            {
                ApplicationArea = All;
                Importance = Promoted;
            }

        }
    }
}