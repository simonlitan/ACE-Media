tableextension 52179315 "Approval Entry Ext" extends "Approval Entry"
{
    fields
    {
        field(32; "Approved The Document"; Boolean)
        {

        }
        modify("Last Date-Time Modified")
        {
            trigger OnAfterValidate()
            begin

            end;
        }
    }
}