table 52178894 "ISO-CarFormTable"
{
    Caption = 'ISO-CarFormTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Organization"; Code[10])
        {

        }
        field(2; "Car No"; Code[20])
        {

        }

        field(3; "Area under review"; Text[100])
        {

        }
        field(4; "ISO 9001 CLAUSE"; Text[100])
        {

        }
        field(14; "Category"; Boolean)
        {

        }
        field(15; "Minor"; Boolean)
        {

        }
        field(5; "Major"; Boolean)
        {

        }
        field(6; "Requirement"; Text[100])
        {

        }
        field(7; "Non conformity evidence"; Text[100])
        {

        }
        field(8; "Auditor1"; Text[100])
        {

        }
        field(9; "Auditee1"; Text[100])
        {

        }
        field(10; "Form No"; Code[30])
        {

        }
        field(11; "No Series"; Code[30])
        {

        }
        field(12; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "AUDIT DATE"; Date)
        {

        }
        field(17; "AUDIT NO."; Code[20])
        {

        }
        field(18; "Root cause"; Text[100])
        {

        }
        field(19; "Correction"; Text[100])
        {

        }
        field(20; "Corrective action"; Text[100])
        {

        }
        field(21; "Date of completion"; Date)
        {

        }
        field(22; "Fully completed"; Boolean)
        {

        }
        field(23; "Partially completed"; Boolean)
        {

        }
        field(24; "No action taken"; Boolean)
        {

        }
        field(25; "Details1"; Text[100])
        {

        }
        field(26; "Effectiveness"; Boolean)
        {

        }
        field(27; "Auditor2"; Text[100])
        {

        }
        field(28; "Auditee2"; Text[100])
        {

        }
        field(29; "Details2"; Text[100])
        {

        }
        field(30; "Auditor4"; Text[100])
        {

        }
        field(31; "Auditee3"; Text[100])
        {

        }
        field(34; "Auditor3"; Text[100])
        {

        }
        field(32; "Name"; Text[100])
        {

        }
        field(33; "Date3"; Date)
        {

        }


    }
    keys
    {
        key(PK; "Form No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "Form No" = '' THEN BEGIN
            NoSeriesMgt.InitSeries('ISOFORM', xRec."No Series", 0D, "Form No", "No Series");
        END;
        "User Id" := USERID;
        "Date Created" := CurrentDateTime;
    end;
}
