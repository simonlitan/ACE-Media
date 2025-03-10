tableextension 52178423 "ExtWorkflow User Group" extends "Workflow User Group"
{
    fields
    {
        field(6000; Group; code[50])
        {
            TableRelation = "Reason Code".code;
            DataClassification = ToBeClassified;
        }
    }
}
