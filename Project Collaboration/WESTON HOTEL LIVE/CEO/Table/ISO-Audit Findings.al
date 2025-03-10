table 52178892 "Audit Findings"
{


    fields
    {

        field(17; "Timetable No."; Code[25])
        {
            Caption = 'Audit No.';

        }
        field(10; "Department"; Text[100])
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
        field(2; "Name of auditor"; Text[250])
        {

        }


        field(3; "Date audited"; Date)
        {

        }

        field(5; "No Series"; Code[30])
        {

        }
        field(6; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Date Created"; DateTime)
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
            NoSeriesMgt.InitSeries('AUDTFNGS', xRec."No Series", 0D, "Timetable No.", "No Series");
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