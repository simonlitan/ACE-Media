table 52178539 "Loyalty Sales Lines"
{
    DrillDownPageId = "Loyalty Sales Lines";
    LookupPageId = "Loyalty Sales Lines";
    fields
    {
        field(1; "No."; Code[30])
        {
        }
        field(2; "Account No."; Code[30])
        {
            TableRelation = "Loyalty Subscriptions"."No.";
            trigger OnValidate()
            var
                lsubs: Record "Loyalty Subscriptions";
            begin
                lsubs.Reset();
                lsubs.SetRange("No.", Rec."Account No.");
                if lsubs.Find('-') then begin
                    Description := lsubs.Name;
                end;

            end;
        }
        field(3; "Transaction Date"; date)
        {
        }
        field(4; "Description"; Text[200])
        {

        }
        field(5; "Amount"; Decimal)
        {

        }
        field(6; "Posted"; Boolean)
        {
        }
        field(7; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(8; "Points Earned"; Decimal)
        {
            trigger OnValidate()
            begin

                "Points Earned" := Round("Points Earned", 1, '<');
            end;
        }
        field(9; "Transaction No."; Code[30])
        {

        }
        field(10; "Programme"; Code[30])
        {
            TableRelation = "Loyalty Programmes";

            trigger OnValidate()
            var
                lprog: Record "Loyalty Programmes";
                cprog: Record "Customer Loyalty Progs";
            begin
                cprog.Reset();
                cprog.SetRange(Programme, Programme);
                cprog.SetRange("No.", "Account No.");
                if cprog.Find('-') then begin
                    lprog.Reset();
                    lprog.SetRange("Code", cprog.Programme);
                    if lprog.Find('-') then begin
                        "Programme Name" := lprog.Name;
                    end else
                        Error('Programme not found');

                end else
                    Error('Programme not found');
            end;
        }
        field(11; "Programme Name"; Text[100])
        {

        }
        field(12; "Payment Method"; Option)
        {
            OptionMembers = Cash,Points;
        }
        field(13; "Total Points"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Loyalty Points Ledger"."Total Points" where("Account No." = field("Account No.")));
        }

    }

    keys
    {
        key(pk; "Line No.", "No.")
        {

        }
    }
}