table 52179174 "Means Of Verification"
{
    Caption = 'Means Of Verification';
    LookupPageId = "Means Of Verification";
    DrillDownPageId = "Means Of Verification";
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
