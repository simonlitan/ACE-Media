table 52178955 "File Movement Register"
{
    Caption = 'File Movement Register';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "File ID"; Code[20])
        {
            Caption = 'File ID';
            DataClassification = ToBeClassified;
        }
        field(2; "File Description"; Text[300])
        {
            Caption = 'File Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Movement Type"; Option)
        {
            Caption = 'Movement Type';
            DataClassification = ToBeClassified;
            OptionMembers = ,Received,Marked,BroughtUp,Collected;
            OptionCaption = ',Received,Marked,Brought Up,Collected';
        }
        field(4; "Movement Date"; DateTime)
        {
            Caption = 'Movement Date';
            DataClassification = ToBeClassified;
        }
        field(5; Officer; Code[20])
        {
            Caption = 'Officer';
            DataClassification = ToBeClassified;
        }
        field(6; "File Type"; Option)
        {
            Caption = 'File Type';
            DataClassification = ToBeClassified;
            OptionMembers = ,Official,Personal;
        }
        field(7; Department; Code[20])
        {
            Caption = 'Department/Pigeon Hole';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
    }
    keys
    {
        key(PK; "File ID", "Movement Date")
        {
            Clustered = true;
        }
    }
}
