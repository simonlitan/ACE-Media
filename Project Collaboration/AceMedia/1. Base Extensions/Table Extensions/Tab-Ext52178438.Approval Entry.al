tableextension 52178438 "ExtApproval Entry" extends "Approval Entry"
{
    fields
    {
        field(6000; "Approved The Document"; Boolean)
        {

        }
        modify("Last Date-Time Modified")
        {
            trigger OnAfterValidate()
            begin

            end;
        }
        field(6001; "Reason for rejecting"; text[250])
        {

        }
    }
}