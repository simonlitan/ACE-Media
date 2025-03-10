pageextension 52178432 "ExtG_L Account Card" extends "G/L Account Card"
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