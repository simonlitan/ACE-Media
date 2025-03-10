table 50217 "Training Lines"
{
    Caption = 'Training Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Training Identification"; Text[250])
        {
            Caption = 'Training Identification';
            DataClassification = ToBeClassified;
            TableRelation = Trainings;
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
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
