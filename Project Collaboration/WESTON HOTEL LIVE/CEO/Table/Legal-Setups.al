table 52178900 "Legal-Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;

        }
        field(2; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Category"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}