table 52178897 "Legal-Cases"
{


    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "File Case Number"; Code[30])
        {
        }
        field(20; "File Number"; Code[30])
        {
        }
        field(3; "Case Title"; Text[250])
        {

        }
        field(4; "Case Description"; Text[250])
        {

        }
        field(17; "Advocate Name Internal"; Text[250])
        {

        }
        field(5; "Advocate Name"; Text[250])
        {

        }
        field(6; "Filing Registration(FR) No."; Code[100])
        {

        }
        field(7; "Trial Court No."; Code[100])
        {

        }
        field(8; "Objections Notification"; Text[250])
        {

        }
        field(9; "Objections Status"; Text[250])
        {

        }
        field(10; "Index Sheet"; Text[100])
        {

        }
        field(11; "Judgement"; Text[500])
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
        field(15; "Status"; Option)
        {
            OptionMembers = Open,Ongoing,Suspended,Closed;
        }
        field(16; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Judgement Date"; Date)
        {

        }
        field(22; "Case Type"; Option)
        {
            OptionMembers = Other,Conveyancing,Contractual,Labour,Commercial;
        }
    }

    keys
    {
        key(Key1; "No.", "Filing Registration(FR) No.", "File Case Number")
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
        IF "Filing Registration(FR) No." = '' THEN BEGIN
            NoSeriesMgt.InitSeries('LEGALCASES', xRec."No Series", 0D, "Filing Registration(FR) No.", "No Series");
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