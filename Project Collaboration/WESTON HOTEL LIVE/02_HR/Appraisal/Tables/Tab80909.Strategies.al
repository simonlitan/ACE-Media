table 50226 Strategies
{
    Caption = 'Strategies';
    DataClassification = ToBeClassified;
    LookupPageId = Strategies;
    DrillDownPageId = Strategies;

    fields
    {
        field(1; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Description)
        {
            Clustered = true;
        }
    }
}
