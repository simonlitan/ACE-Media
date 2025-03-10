table 52179360 "Detailed Appraisal Comments"
{
    Caption = 'Detailed Appraisal Comments';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

        field(2; Comment; Text[250])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
