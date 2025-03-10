table 52179080 "Project Types"
{
    Caption = 'Training Identification';
    DataClassification = ToBeClassified;
    LookupPageId = "Trainings";
    DrillDownPageId = "Trainings";
    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = True;

        }
        field(2; Code; Code[30])
        {

        }
        field(3; "Project Types"; Text[250])
        {
            Caption = 'Training Identification';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; Id, Code)
        {
            Clustered = true;
        }
    }
}
