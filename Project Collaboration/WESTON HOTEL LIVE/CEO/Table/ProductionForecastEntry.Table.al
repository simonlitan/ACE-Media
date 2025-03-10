table 52178901 "CEO-Production Forecast Entry"
{
    Caption = 'Calendar Entry';
    DrillDownPageID = "CEO-Calendar Entries";
    LookupPageID = "CEO-Calendar Entries";

    fields
    {
        field(1; "Calendar Name"; Code[300])
        {
            Caption = 'Calendar Name';
            TableRelation = "CEO-Production Forecast Name";
        }
        field(5; "No."; Code[30])
        {
            //DataClassification = ToBeClassified;
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "Item No."; Code[20])
        {
            /* Caption = 'Item No.';
            TableRelation = Item; */
        }
        field(4; "Calendar Date"; Date)
        {
            Caption = 'Calendar Date';
        }
        /* field(5; "Forecast Quantity"; Decimal)
        {
            Caption = 'Forecast Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Forecast Quantity (Base)" := "Forecast Quantity" * "Qty. per Unit of Measure";
            end;
        }
        field(6; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE (Item No.=FIELD(Item No.));

            trigger OnValidate()
            begin
                ItemUnitofMeasure.GET("Item No.","Unit of Measure Code");
                "Qty. per Unit of Measure" := ItemUnitofMeasure."Qty. per Unit of Measure";
                "Forecast Quantity" := "Forecast Quantity (Base)" / "Qty. per Unit of Measure";
            end;
        }
        field(7;"Qty. per Unit of Measure";Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(8;"Forecast Quantity (Base)";Decimal)
        {
            Caption = 'Forecast Quantity (Base)';
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                IF "Unit of Measure Code" = '' THEN BEGIN
                  Item.GET("Item No.");
                  "Unit of Measure Code" := Item."Sales Unit of Measure";
                  ItemUnitofMeasure.GET("Item No.","Unit of Measure Code");
                  "Qty. per Unit of Measure" := ItemUnitofMeasure."Qty. per Unit of Measure";
                END;
                VALIDATE("Unit of Measure Code");
            end;
        } */
        field(10; "Location Code"; Code[250])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(12; "Calendar Component"; Boolean)
        {
            Caption = 'Calendar Component';
        }
        field(13; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(14; "Number of People"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Attendant Name"; Text[80])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Entry No.", "Item No.")
        {
            Clustered = true;
        }
        key(Key2; "Calendar Name", "Location Code", "Calendar Date", "Calendar Component", "Number of People")
        {
            SumIndexFields = "Number of People";
        }
        key(Key3; "Calendar Name", "Entry No.", "Calendar Component", "Calendar Date", "Location Code")
        {
            SumIndexFields = "Number of People";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        ForecastEntry: Record "CEO-Production Forecast Entry";
    begin
        TESTFIELD("Calendar Date");
        TESTFIELD("Calendar Name");
        LOCKTABLE;
        IF "Entry No." = 0 THEN
            IF ForecastEntry.FINDLAST THEN
                "Entry No." := ForecastEntry."Entry No." + 1;
        PlanningAssignment.AssignOne("Item No.", '', "Location Code", "Calendar Date");
    end;

    trigger OnModify()
    begin
        PlanningAssignment.AssignOne("No.", '', "Location Code", "Calendar Date");
    end;

    var
        //ItemUnitofMeasure: Record 5404;
        //Item: Record 27;
        PlanningAssignment: Record "CEO-Planning Assignment";
}

