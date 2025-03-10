table 52178896 "Internal quality audit"
{


    fields
    {
        field(1; "Audit No"; Code[30])
        {

        }
        field(2; "Audit Date"; Date)
        {
        }
        field(3; "Scope of audit"; Text[250])
        {

        }
        field(4; "Audit criteria"; Text[250])
        {

        }
        field(5; "Audit purpose"; Text[250])
        {

        }
        field(6; "Auditor"; Text[250])
        {

        }
        field(7; "Persons contracted"; Text[250])
        {

        }
        field(8; "Introduction"; Text[250])
        {

        }
        field(9; "Summary of audit findings"; Text[250])
        {

        }
        field(27; "Observations"; Text[250])
        {

        }
        field(10; "Areas of improvement"; Text[250])
        {

        }
        field(11; "Recommendations"; Text[500])
        {

        }
        field(12; "Attachments"; Text[500])
        {

        }
        // field(15; "Name"; Text[500])
        // {

        // }
        // field(16; "Responsibility"; Text[500])
        // {

        // }
        // field(17; "Contact No."; Code[30])
        // {

        // }
        field(13; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "No Series"; Code[30])
        {

        }

    }

    keys
    {
        key(Key1; "Audit No")
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
        IF "Audit No" = '' THEN BEGIN
            NoSeriesMgt.InitSeries('AuditReport', xRec."No Series", 0D, "Audit No", "No Series");
        END;
        "User Id" := USERID;
        "Date Created" := CurrentDateTime;
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