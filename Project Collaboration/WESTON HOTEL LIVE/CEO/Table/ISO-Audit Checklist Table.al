table 52178891 "ISO-Audit Checklist Table"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Form No"; Code[30])
        {

        }
        field(2; "No Series"; Code[30])
        {

        }
        field(3; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Date; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Department"; Text[100])
        {
            /* TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('DEPARTMENTS'),
                                                          "Global Dimension No." = FILTER(1)); */

            // CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('Departments'));

            trigger OnValidate()
            var
                DimVal: Record "Dimension Value";
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal.Code, "Department");
                IF DimVal.FIND('-') THEN
                    "Department Name" := DimVal.Name
            end;
        }
        field(12; "Department Name"; Text[150])
        {

        }
        field(7; AuditType; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(8; Location; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(14; "Name of auditor"; Text[200])
        {
            DataClassification = ToBeClassified;

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
            NoSeriesMgt.InitSeries('AuditFORM', xRec."No Series", 0D, "Form No", "No Series");
        END;
        "User Id" := USERID;
        "Date Created" := CurrentDateTime;
    end;
}
