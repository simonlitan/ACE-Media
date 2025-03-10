tableextension 52179303 "Inventory Setup" extends "Inventory Setup"
{
    fields
    {
        field(7307; "Item Issue Batch"; code[20])
        {
            TableRelation = "Item Journal Batch".Name;
        }
        field(7308; "Item Issue Template"; code[20])
        {
            TableRelation = "Item Journal Template".Name;
        }
    }
}