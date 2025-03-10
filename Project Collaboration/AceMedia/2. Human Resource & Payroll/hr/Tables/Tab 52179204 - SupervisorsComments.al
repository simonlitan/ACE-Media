table 52179204 "Supervisors Comments"
{
    Caption = 'Supervisors Comments';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "S No."; Code[20])
        {
            Caption = 'S No.';
            DataClassification = ToBeClassified;
            TableRelation = "Employee Self-Appraisal"."No.";

            trigger OnValidate()
            begin
                Date := Today;
                "Supervisor ID" := UserId;
            end;
        }
        field(2; Comment; Text[500])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Supervisor ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Appraisal No."; Code[20])
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
