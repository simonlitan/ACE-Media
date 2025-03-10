table 52179240 "Employee Self Appraisal Line"
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
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(3; "Strategic Objective"; Text[1000])
        {
            Caption = 'Strategic Objective';
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Objective Setup".Code;
            // trigger OnValidate()
            // var
            //     StrategicObjectiveSetup: Record "Strategic Objective Setup";
            // begin
            //     if StrategicObjectiveSetup.Get("Strategic Objective") then
            //         "Strategic Objective" := StrategicObjectiveSetup."Strategic Objective";
            // end;
            //test
            trigger OnValidate()
            var
                StrategicObjectiveSetup: Record "Strategic Objective Setup";
            begin
                StrategicObjectiveSetup.Reset();
                if Page.RunModal(Page::"Strategic Obj Setup List", StrategicObjectiveSetup) = Action::LookupOK then
                    "Strategic Objective" := StrategicObjectiveSetup."Strategic Objective";
            end;

        }
        field(16; "Strategies"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Strategies.Code;
            trigger OnValidate()
            var
                Strategies: Record Strategies;
            begin
                if Strategies.Get(Strategies) then
                    "Strategies Desc" := Strategies.Description;

            end;
        }
        field(28; "Strategies Desc"; Text[200])
        {

        }
        field(15; "Strategic Obj Description"; Text[500])
        {
            // Editable = false;
            Caption = 'Strategy Obj';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                StrategicObjectiveSetup: Record "Strategic Objective Setup";
            begin
                StrategicObjectiveSetup.Reset();
                if Page.RunModal(Page::"Strategic Obj Setup List", StrategicObjectiveSetup) = Action::LookupOK then
                    "Strategic Obj Description" := StrategicObjectiveSetup.Strategy;
            end;
        }
        field(4; Activities; Code[10])
        {
            Caption = 'Activities';
            TableRelation = Activities.Code;
            trigger OnValidate()
            var
                Actvity: Record Activities;
            begin
                if Actvity.Get(Activities) then
                    "Activity Desc" := Actvity.Description;

            end;
        }
        field(27; "Activity Desc"; Text[500])
        {

        }
        field(5; "Means of Verification"; code[10])
        {
            Caption = 'Means of Verification';
            DataClassification = ToBeClassified;
            TableRelation = "Means Of Verification".Code;
            trigger OnValidate()
            var
                MOV: Record "Means Of Verification";
            begin
                if MOV.Get("Means of Verification") then
                    "Means of verification Desc" := MOV.Description;

            end;
        }
        field(23; "Means of verification Desc"; Text[100])
        {

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
        field(11; KRA; Code[10])
        {
            TableRelation = KRA.Code;
            trigger OnValidate()
            var
                Kra: Record KRA;
            begin
                if Kra.Get(KRA) then
                    "KRA Description" := Kra.Description;
            end;

        }
        field(17; "KRA Description"; Text[250])
        {

        }
        field(12; "Expected Output"; Text[500])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expected Output".Code;
            trigger OnValidate()
            var
                Output: Record "Expected Output";
            begin
                if Output.Get("Expected Output") then
                    "Expected Output Desc" := Output.Description;
            end;
        }
        field(22; "Expected Output Desc"; Text[100])
        {

        }
        field(13; "KPI(s) e.g Timeframes"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","January","February","March","April","May","June","July","August","September","October","November","December";
        }
        field(14; "Weight"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "1","2","3","4","5";
        }
        field(18; "Staff Activities"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Staff expected output"; Text[200])
        {

        }
        field(20; "Staff Means of Verification"; Text[100])
        {

        }
        field(21; Quater; Code[10])
        {
            Caption = 'Quater';
            TableRelation = "Financial Quater"."Quater Code";
            trigger OnValidate()
            var
                Quaters: Record "Financial Quater";
            begin
                Quaters.Reset();
                // Quaters.SetRange("Financial Year", "Financial Year");
                Quaters.SetRange("Quater Code", Quater);
                if Quaters.FindFirst() then begin
                    "Start Date" := Quaters."Start Date";
                    "End Date" := Quaters."End Date";
                end;

            end;
        }
        field(24; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "End Date" := CalcDate('3M', "Start Date")
            end;
        }
        field(25; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(26; "Total Self Score"; Integer)
        {

        }
        field(29; "Targets for Year"; Code[10])
        {

        }
        field(30; "Kra Rating"; code[10])
        {

        }
        field(31; "Period Under Review"; Code[50])
        {
            Caption = 'Period Under Review';
            DataClassification = ToBeClassified;
            TableRelation = "Appraisal Period";
        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;


        }
    }
    Trigger OnInsert()
    var
        Strat: Record "Self Appraisal";
        Lno: Integer;
    begin
        // If Rec.FindLast() then
        //     Lno := Rec."Line No.";

        Strat.SetRange("No.", Rec."Document No.");
        If Strat.Find('-') then begin
            // Strat.TestField("Period Under Review");
            Strat.TestField("Employee No");
            // Strat.TestField(Status, Strat.Status::Open);
            "Line No." := GetLastEntryNo() + 1;
            If Strat."Period Under Review" <> '' then begin
                // "Period Under Review" := Strat."Period Under Review";
            end
            else begin
                Error('Period Under Review should have a Value');
            end;

        end;

    end;

    procedure GetLastEntryNo(): Integer;
    var
        EntNo: Record "Strategic Objective";
    begin
        EntNo.Reset();
        if EntNo.FindLast() then
            exit(EntNo."Line No.")
        else
            exit(0);
    end;

}
