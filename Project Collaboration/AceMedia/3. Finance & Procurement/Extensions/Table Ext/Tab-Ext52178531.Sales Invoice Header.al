tableextension 52178531 "ExtSales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(6000; "HS Codes"; code[30])
        {

            DataClassification = ToBeClassified;
        }
    }
}
