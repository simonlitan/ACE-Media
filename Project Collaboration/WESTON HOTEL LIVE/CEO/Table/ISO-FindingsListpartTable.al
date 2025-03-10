table 52178895 "ISO-Findings Listpart Table"
{
    Caption = 'ISO-Findings Listpart Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[25])
        {

        }
        field(2; "Findings"; Text[250])
        {
        }
        field(3; "Name/signature of auditee"; Text[250])
        {

        }
        field(4; "Relevant clause"; Text[250])
        {

        }



    }

    keys
    {
        key(Key1; "No.", "Findings", "Name/signature of auditee")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    // trigger OnInsert()
    // var
    //     NoSeriesMgt: Codeunit 396;
    // begin
    //     IF "No." = '' THEN BEGIN
    //         NoSeriesMgt.InitSeries('ADITTIMETABLE', xRec."No Series", 0D, "No.", "No Series");
    //     END;
    //     "User Id" := USERID;
    //     "Date Created" := CURRENTDATETIME;
    // end;

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