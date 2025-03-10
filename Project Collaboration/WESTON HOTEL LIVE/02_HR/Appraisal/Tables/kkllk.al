table 50210 "Trainings"
{
    Caption = 'Training Lines';
    DataClassification = ToBeClassified;
    LookupPageId = "Training List";
    DrillDownPageId = "Training List";
    fields
    {
        field(3; "Training Identification"; Text[250])
        {
            Caption = 'Training Identification';
            DataClassification = ToBeClassified;
        }
        field(4; "Name of Training"; Text[250])
        {
            Caption = 'Name of Training';
            DataClassification = ToBeClassified;
        }
        field(5; Trainer; Code[20])
        {
            Caption = 'Trainer';
            DataClassification = ToBeClassified;
        }
        field(6; "Implematation Date"; Date)
        {
            Caption = 'Implematation Date';
            DataClassification = ToBeClassified;
        }
        field(7; Venue; Text[20])
        {
            Caption = 'Venue';
            DataClassification = ToBeClassified;
        }
        field(8; Cost; Decimal)
        {
            Caption = 'Cost';
            DataClassification = ToBeClassified;
        }
        field(9; "Supervisor Comment"; Text[250])
        {
            Caption = 'Supervisor Comment';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Training Identification")
        {
            Clustered = true;
        }
    }
}
