tableextension 52179307 "Workflow User Group Ext" extends "Workflow User Group"
{
    fields
    {
        field(52179300; Group; code[50])
        {
            TableRelation = "Reason Code".code;
            DataClassification = ToBeClassified;
        }
    }
}
