pageextension 52178550 "ExtGeneral Ledger Entries" extends "General Ledger Entries"
{
layout
{
    modify("Reason Code")
    {
        Visible = true;
        Editable = true;
    }
    addafter(Description)
    {
        field(Remarks;Rec.Remarks)
        {
            ApplicationArea = all;
        }
    }
}
}
