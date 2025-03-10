table 52179365 "Appraisal Period"
{
    Caption = 'Appraisal Period';
    DataClassification = ToBeClassified;
    LookupPageId = "Appraisal period List";
    DrillDownPageId = "Appraisal period List";
    fields
    {
        field(1; "Code"; Text[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[20])
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
