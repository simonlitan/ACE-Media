query 52178878 Dimensions
{
    Caption = 'Dimensions';
    QueryType = Normal;

    elements
    {
        dataitem(DimensionValue; "Dimension Value")
        {
            DataItemTableFilter = Blocked = const(false);
            column("Code"; "Code")
            {
            }
            column(Name; Name)
            {
            }
            column(DimensionCode; "Dimension Code")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
