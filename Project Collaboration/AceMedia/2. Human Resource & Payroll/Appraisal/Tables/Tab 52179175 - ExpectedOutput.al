table 52179175 "Expected Output"
{
    Caption = 'Expected Output';
    LookupPageId = "Expected Output";
    DrillDownPageId = "Expected Output";
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Code"; Code[20])
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
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}