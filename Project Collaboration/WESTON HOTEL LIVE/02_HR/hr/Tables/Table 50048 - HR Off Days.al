table 50053 "HR Off Days"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; DayNo; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Day; text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; DayNo, Day)
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