table 52179366 Strategies
{
    Caption = 'Strategies';
    DataClassification = ToBeClassified;
    LookupPageId = Strategies;
    DrillDownPageId = Strategies;

    fields
    {
        field(1; Code; Code[10])
        {

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
