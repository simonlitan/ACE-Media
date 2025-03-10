table 52179237 "Counties"
{
    Caption = 'Counties';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Counties List";
    LookupPageId = "Counties List";

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[150])
        {
            Caption = 'Name';
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
