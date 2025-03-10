table 52179359 "Appraisal Category Level"
{
    Caption = 'Appraisal Category Level';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Category; Enum "Appraisal Parameters")
        {
            Caption = 'Category';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(4; Score; Decimal)
        {
            Caption = 'Score';
            DataClassification = ToBeClassified;
        }
        field(5; Grade; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Both,"123","456";
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
