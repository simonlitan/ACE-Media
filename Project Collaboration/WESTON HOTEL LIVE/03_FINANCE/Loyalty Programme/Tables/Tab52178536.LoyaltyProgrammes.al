table 52178536 "Loyalty Programmes"
{
    DrillDownPageId = "Loyalty Programmes";
    LookupPageId = "Loyalty Programmes";
    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Name"; Text[100])
        {
        }
        field(3; "Programme Type"; Enum "Loyalty Programmes")
        {
        }
        field(4; "Amount per Point"; Decimal)
        {
        }
        field(5; "Charge Per Session"; Decimal)
        {
        }
        field(6; "Accrued Expense"; Code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(7; "Accrued Liability"; Code[30])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(8; "LifeTime Registration"; Boolean)
        {
            trigger OnValidate()
            begin
                if Rec."LifeTime Registration" = true then
                    ValidateLife(Rec);
            end;
        }
        field(9; "Renewal Registration"; Boolean)
        {
            trigger OnValidate()
            begin
                if Rec."Renewal Registration" = true then
                    ValidateRenewal(Rec);
            end;
        }
        field(10; "Subscription Fee"; Decimal)
        {

        }

    }


    procedure ValidateLife(var lprog: Record "Loyalty Programmes")
    begin
        if lprog."LifeTime Registration" = true then
            lprog."Renewal Registration" := false;
    end;

    procedure ValidateRenewal(var lprog: Record "Loyalty Programmes")
    begin
        if lprog."Renewal Registration" = true then
            lprog."LifeTime Registration" := false;
    end;
}