table 52178909 "Task-Group Setup"
{
    //DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[30])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Team Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Region Code"; Code[100])
        {
            /* TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGIONS'));
            trigger OnValidate()
            var
                Dimval: Record "Dimension Value";
            begin
                if Dimval.Get("Region Code") then begin
                    "Region Name" := Dimval.Name;
                end;
            end; */
            // CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = filter('Region|Regions'));


            trigger OnValidate()
            var
                DimVal: Record "Dimension Value";
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal.Code, "Region Code");
                IF DimVal.FIND('-') THEN
                    "Region Name" := DimVal.Name
            end;
        }
        field(4; "Region Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Department"; Text[100])
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
        field(22; Division; Text[250])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FILTER('Division|Divisions'));
            DataClassification = ToBeClassified;
        }
        field(23; Project; Code[100])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('Projects'));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                DimVal: Record "Dimension Value";
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal.Code, "Project");
                IF DimVal.FIND('-') THEN
                    "Project Name" := DimVal.Name
            end;
        }
        field(24; "Project Name"; Text[150])
        {

        }
        field(13; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Priority; Option)
        {
            OptionMembers = High,Medium,Low;
            OptionCaption = 'High,Medium,Low';

        }
        field(14; "Created By"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "User Id"; Text[100])
        {
        }
        field(21; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Due Date"; Date)
        {
        }
        field(7; "Due Time"; Time)
        {
        }
        field(8; "Status"; Option)
        {
            OptionCaption = 'Open,Closed,Pending,Cancelled,Unresolved,Resolved';
            OptionMembers = Open,Closed,Pending,Cancelled,Unresolved,Resolved;
        }
        field(11; "Feedback"; Text[250])
        {
        }
        field(16; "Task Name"; Text[100])
        {
        }
        field(17; "Task Details"; Text[250])
        {
        }
        field(18; "No Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Modified By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Modified On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Code)
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
            /* ACAGeneralSetUp.GET;
            ACAGeneralSetUp.TESTFIELD("Further Info Nos"); //rsk */
            NoSeriesMgt.InitSeries('TSKGROUP', xRec."No Series", 0D, "Code", "No Series");
        END;
        "User Id" := USERID;
        "Date Created" := CURRENTDATETIME;
        //Date := TODAY;
    end;

    trigger OnModify()
    begin
        "Modified By" := USERID;
        "Modified On" := CURRENTDATETIME;
    end;


    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}