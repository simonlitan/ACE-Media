table 52179079 Activities
{
    ;
    Caption = 'Activities';
    LookupPageId = Activities;
    DrillDownPageId = Activities;
    DataClassification = ToBeClassified;
    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}