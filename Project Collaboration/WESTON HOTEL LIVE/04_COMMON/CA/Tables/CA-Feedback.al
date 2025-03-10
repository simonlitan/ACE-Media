table 52178883 "CA-Feedback"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;

        }
        field(2; Code; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGIONS'));
            trigger OnValidate()
            var
                Dimval: Record "Dimension Value";
            begin
                if Dimval.Get(Region) then begin
                    "Region Name" := Dimval.Name;
                end;
            end;
        }
        field(15; "Region Name"; Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE(Code = FIELD(Region)));
            FieldClass = FlowField;
        }
        field(4; "Cost Center"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "User Id"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Department; Code[100])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

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
        field(13; "Department Name"; Text[250])
        {
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
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "Code" = '' THEN BEGIN
            NoSeriesMgt.InitSeries('CAFEEDBK', xRec."No Series", 0D, "Code", "No Series");
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