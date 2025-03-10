pageextension 52178530 "ExtCustomer Ledger Entries" extends "Customer Ledger Entries"
{
    layout
{
    addafter(Description)
    {
        field(Narration;Rec.Narration)
        {
            Visible = false;
            ApplicationArea = all;

        }
    }
}
}
