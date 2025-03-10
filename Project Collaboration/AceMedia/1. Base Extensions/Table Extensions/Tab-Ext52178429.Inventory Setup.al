/// <summary>
/// TableExtension ExtInventory Setup (ID 52179303) extends Record Inventory Setup.
/// </summary>
tableextension 52178429 "Inventory Setup" extends "Inventory Setup"
{
    fields
    {
        field(6000; "Item Issue Batch"; code[20])
        {
            TableRelation = "Item Journal Batch".Name;
        }
        field(6001; "Item Issue Template"; code[20])
        {
            TableRelation = "Item Journal Template".Name;
        }
    }
}