table 52178896 "TR Vehicle Defects"
{
    Caption = 'TR Vehicle Defects';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Ticket No"; Code[50])
        {
            Editable = false;
            Caption = 'Ticket No';
            DataClassification = ToBeClassified;
        }
        field(2; "Registration No"; Code[20])
        {
            Editable = false;
            Caption = 'Registration No';
            DataClassification = ToBeClassified;
        }
        field(3; "Entry No"; Integer)
        {
            Editable = false;
            AutoIncrement = true;
            Caption = 'Entry No';
            DataClassification = ToBeClassified;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(5; Defects; Text[250])
        {
            Caption = 'Defects';
            DataClassification = ToBeClassified;
        }
        field(6; "Actions taken"; Text[250])
        {
            Caption = 'Actions taken';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Ticket No", "Registration No", "Entry No")
        {
            Clustered = true;
        }
    }
}
