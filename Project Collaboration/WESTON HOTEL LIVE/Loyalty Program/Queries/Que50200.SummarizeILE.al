query 50200 "Summarize ILE"
{
    QueryType = Normal;

    elements
    {
        dataitem(ILE; "Item Ledger Entry")
        {
            column(Location_Code; "Location Code") { }
            column(Item_No_; "Item No.") { }
            column(Unit_of_Measure_Code; "Unit of Measure Code") { }
            column(Lot_No_; "Lot No.") { }
            column(Quantity; "Quantity")
            {
                Method = Sum;
            }
        }
    }
}
