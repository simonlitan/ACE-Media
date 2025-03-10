tableextension  52178424 "Responsibility Centres" extends "Responsibility Center"
{
    fields
    {
        field(6000; Grouping; Code[50])
        {
            TableRelation = "Reason Code".code;
            DataClassification = ToBeClassified;
        }
    }
}
