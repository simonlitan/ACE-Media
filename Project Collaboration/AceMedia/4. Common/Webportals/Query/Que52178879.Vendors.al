query 52178879 Vendors
{
    Caption = 'Vendors';
    QueryType = Normal;

    elements
    {
        dataitem(Vendor; Vendor)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
