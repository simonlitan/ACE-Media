table 52178787 "NW-Board Payroll"
{
    DrillDownPageId = "NW-Board Payroll";
    LookupPageId = "NW-Board Payroll";
    fields
    {
        field(1; "No."; Code[50])
        {

        }

        field(2; "Almanac Ref."; Code[50])
        {
            TableRelation = "Board Almanac"."No." where(Approved = filter(true), Closed = filter(false));
            trigger OnValidate()
            var
                BoardAlmanac: Record "Board Almanac";
            begin
                BoardAlmanac.Reset();
                BoardAlmanac.SetRange("No.", Rec."Almanac Ref.");
                if BoardAlmanac.Find('-') then begin
                    Rec.Quater := BoardAlmanac.Quater;
                    Rec."Period Month" := BoardAlmanac."Period Month";
                    Rec."Period Week" := BoardAlmanac."Period Week";
                    Rec."Meeting Date" := BoardAlmanac."Meeting Date";
                    Rec."Committee Code" := BoardAlmanac."Committee Code";
                    Rec."Committee Name" := BoardAlmanac."Committee Name";
                    Rec."Meeting Details 1" := BoardAlmanac."Meeting Details 1";
                    Rec."Meeting Details 2" := BoardAlmanac."Meeting Details 2";
                    Rec."Estimated Budget" := BoardAlmanac."Estimated Budget";
                end;
            end;
        }
        field(3; "Quater"; Option)
        {
            OptionMembers = "First Quater","Second Quater","Third Quater","Fourth Quater";
        }

        field(4; "Period Month"; Text[50])
        {

        }
        field(5; "Period Week"; Text[100])
        {

        }
        field(6; "Meeting Date"; Date)
        {

        }
        field(7; "Committee Code"; Code[50])
        {
            TableRelation = "Board Committes Listing"."Commitee Code";
        }
        field(8; "Committee Name"; Text[100])
        {

        }
        field(9; "Meeting Details 1"; Text[250])
        {

        }
        field(10; "Meeting Details 2"; Text[250])
        {

        }
        field(11; "Estimated Budget"; Decimal)
        {

        }
        field(12; "Payroll Period"; Date)
        {
            TableRelation = "NW-Board Payroll Periods"."Date Opened" where(Closed = filter(false));
        }
        field(13; "No. Series"; Code[50])
        {

        }
        field(14; "Sitting Allowance Acc"; code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("NW-Board GL Accounts"."Sitting Allowance Acc");
        }
        field(15; "Mileage Claim Acc"; code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("NW-Board GL Accounts"."Mileage Claim Acc");
        }
        field(16; "Accomodation Allowance Acc"; code[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("NW-Board GL Accounts"."Accomodation Allowance Acc");
        }
        field(17; "Lunch Allowance Acc"; code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("NW-Board GL Accounts"."Lunch Allowance Acc");
        }
        field(18; "Honoraria Acc"; code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("NW-Board GL Accounts"."Honoraria Acc");
        }
        field(19; "Tax Acc"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("NW-Board GL Accounts"."Tax Acc");
        }
        field(20; "Net Acc"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("NW-Board GL Accounts"."Net Acc");
        }
        field(21; "Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Cancelled,Posted;
        }
        field(22; "Posted"; Boolean)
        {

        }
        field(23; "Cheque No."; code[30])
        {

        }
        field(24; "User ID"; Code[50])
        {

        }

    }
    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            NoSeriesMgt.InitSeries('BRD Payroll', xRec."No. Series", 0D, "No.", "No. Series");
        end;
        "User ID" := UserId;
    end;
}