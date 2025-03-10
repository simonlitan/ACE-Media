table 52178893 "Audit Timetable"
{


    fields
    {

        field(17; "Timetable No."; Code[25])
        {

        }




        field(12; "No Series"; Code[30])
        {

        }
        field(13; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(Key1; "Timetable No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "Timetable No." = '' THEN BEGIN
            NoSeriesMgt.InitSeries('ADITTIMETABLE', xRec."No Series", 0D, "Timetable No.", "No Series");
        END;
        "User Id" := USERID;
        "Date Created" := CURRENTDATETIME;
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