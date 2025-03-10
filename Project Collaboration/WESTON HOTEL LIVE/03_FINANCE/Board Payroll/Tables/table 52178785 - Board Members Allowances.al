table 52178785 "Board Members Allowances"
{
    DrillDownPageId = "Board Members Allowances";
    LookupPageId = "Board Members Allowances";
    fields
    {
        field(1; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Sitting Allowance"; Decimal)
        {

        }
        field(3; "Mileage Claim"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Accomodation Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Chair's Honoraria"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Board Tax"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Tax setup"."Tax Code";

            trigger OnValidate()
            var
                Btax: Record "Board Tax setup";
            begin
                Btax.Reset();
                Btax.SetRange("Tax Code", Rec."Board Tax");
                if Btax.Find('-') then begin
                    Rec."Sitting Allowance tax" := Rec."Sitting Allowance" * (Btax."Tax Rate" / 100);
                    Rec."Lunch Allowance Tax" := Rec."Lunch Allowance" * (Btax."Tax Rate" / 100);

                    Rec."Sitting Allowance Net" := Rec."Sitting Allowance" - Rec."Sitting Allowance" * (Btax."Tax Rate" / 100);
                    Rec."Lunch Allowance Net" := Rec."Lunch Allowance" - Rec."Lunch Allowance" * (Btax."Tax Rate" / 100);
                end;
            end;
        }
        field(7; "Sitting Allowance tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Mileage  Allowance Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Lunch Allowance Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(10; "Sitting Allowance Net"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Mileage  Allowance Net"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Lunch Allowance Net"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Lunch Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }
}