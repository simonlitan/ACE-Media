table 52179073 "Alternative DR Line"
{
    Caption = 'Alternative DR Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Case No"; Code[50])
        {
            editable = false;
            Caption = 'Case No';
        }
        field(2; "Entry No"; Integer)
        {
            Caption = 'Entry No';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; Recommendations; Text[2048])
        {
            Caption = 'Recommendations';
        }
        field(5; "User Id"; code[50])
        {
            editable = false;

        }
    }
    keys
    {
        key(PK; "Case No", "Date")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        date := today;
        "User Id" := userid;
    end;
}
