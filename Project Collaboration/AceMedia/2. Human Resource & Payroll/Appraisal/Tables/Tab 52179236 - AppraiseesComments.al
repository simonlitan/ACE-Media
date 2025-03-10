table 52179236 "Appraisees Comments"
{
    Caption = 'Appraisees Comments';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "S No."; Code[20])
        {
            Caption = 'S No.';
            DataClassification = ToBeClassified;
            TableRelation = "Employee Self-Appraisal"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Date := Today;
                "Appraisee's ID" := UserId;
            end;
        }
        field(2; Comments; Text[300])
        {
            Caption = 'Comments';
            DataClassification = ToBeClassified;
        }
        field(3; "Appraisal No."; Code[20])
        {
            Caption = 'Appraisal No.';
            DataClassification = ToBeClassified;

        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Appraisee's ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Additional Assignment"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "S No.")
        {
            Clustered = true;
        }
    }
}
