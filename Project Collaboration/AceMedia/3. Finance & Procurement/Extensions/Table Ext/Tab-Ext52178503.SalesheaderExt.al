tableextension 52178530 "Sales header Ext" extends "Sales Header"
{
    fields
    {
        field(6000; "HS Codes"; code[30])
        {

            DataClassification = ToBeClassified;
        }
    }
}
