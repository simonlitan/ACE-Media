table 50218 "Strategic Objective"
{
    Caption = 'Strategic Objective';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }

        field(3; "Strategic Objective"; Text[1000])
        {
            Caption = 'Strategic Objective';
            DataClassification = ToBeClassified;
            //     TableRelation = "Strategic Objective Setup".Code;
            //    / trigger OnValidate()
            // var
            //     StrategicObjectiveSetup: Record "Strategic Objective Setup";
            // begin
            //     if StrategicObjectiveSetup.Get("Strategic Objective") then
            //         "Strategic Objective" := StrategicObjectiveSetup."Strategic Objective";
            // end;
            //test
            trigger OnLookup()
            var
                StrategicObjectiveSetup: Record "Strategic Objective Setup";
            begin
                StrategicObjectiveSetup.Reset();
                if Page.RunModal(Page::"Strategic Obj Setup List", StrategicObjectiveSetup) = Action::LookupOK then
                    "Strategic Objective" := StrategicObjectiveSetup."Strategic Objective";
            end;

        }
        field(16; "Strategies"; Text[500])
        {
            DataClassification = ToBeClassified;
            TableRelation = Strategies;
        }
        field(15; "Strategic Obj Description"; Text[500])
        {
            // Editable = false;
            Caption = 'Strategy Obj';
            DataClassification = ToBeClassified;

            trigger OnLookup()
            var
                StrategicObjectiveSetup: Record "Strategic Objective Setup";
            begin
                StrategicObjectiveSetup.Reset();
                if Page.RunModal(Page::"Strategic Obj Setup List", StrategicObjectiveSetup) = Action::LookupOK then
                    "Strategic Obj Description" := StrategicObjectiveSetup.Strategy;
            end;
        }
        field(4; Activities; Text[500])
        {
            Caption = 'Activities';
            DataClassification = ToBeClassified;
        }
        field(5; "Means of Verification"; Text[500])
        {
            Caption = 'Means of Verification';
            DataClassification = ToBeClassified;
        }
        field(6; "Self Rating"; Decimal)
        {
            Caption = 'Self Rating';
            DataClassification = ToBeClassified;
        }
        field(7; "Supervisor  Rating"; Decimal)
        {
            Caption = 'Supervisor  Rating';
            DataClassification = ToBeClassified;
        }
        field(8; "Agreed final Score"; Decimal)
        {
            Caption = 'Agreed final Score';
            DataClassification = ToBeClassified;
        }
        field(9; variance; Decimal)
        {
            Caption = 'variance';
            DataClassification = ToBeClassified;
        }
        field(10; "Reasons for variance"; Text[500])
        {
            Caption = 'Reasons for variance';
            DataClassification = ToBeClassified;
        }
        field(11; KRA; Code[20])
        {
            TableRelation = KRA;
        }
        field(12; "Expected Output"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "KPI(s) e.g Timeframes"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "", "January","February","March","April","May","June","July","August","September","October","November","December";
        }
        field(14; "Weight"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "1","2","3","4","5";
        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
