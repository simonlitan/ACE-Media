table 52178542 "Loyality Subs Per Period"
{
    DrillDownPageId = "Loyality Subs Per Period";
    LookupPageId = "Loyality Subs Per Period";

    fields
    {
        field(1; "No."; Code[30])
        {
        }
        field(2; "ID/Passport No."; Code[30])
        {
        }
        field(3; "Telephone No."; Code[30])
        {
        }
        field(4; "Programme"; code[30])
        {
            TableRelation = "Loyalty Programmes"."Code";
            Editable = false;

            trigger OnValidate()
            var
                lsubs: Record "Loyalty Subscriptions";
                lprogs: Record "Loyalty Programmes";
            begin
                lsubs.Reset();
                lsubs.SetRange("No.", "No.");
                if lsubs.Find('-') then begin

                    lsubs.TestField("ID/Passport No.");
                    lsubs.TestField("Telephone No.");
                    "ID/Passport No." := lsubs."ID/Passport No.";
                    "Telephone No." := lsubs."Telephone No.";
                end;

            end;
        }
        field(5; "Period"; Code[30])
        {
            TableRelation = "Loyalty Periods".Period where(Active = filter(true));

        }
        field(6; "Date Registered"; date)
        {

        }
        field(7; "Registered By"; Code[30])
        {
            Editable = false;
        }
        field(8; "Subscription Posted"; Boolean)
        {
            //Editable = false;

        }
        field(9; "Balance"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Loyalty Subscription Ledger".Amount where("Account No." = field("No."), "Loyalty Period" = field(Period)));
        }

    }

    keys
    {
        key(pk; "No.", Programme, Period)
        {

        }
    }
    trigger OnInsert()
    begin
        Validate(Programme);
        "Registered By" := UserId;
        "Date Registered" := Today;
    end;

    trigger OnDelete()
    begin
        //  if "Subscription Posted" = true then Error('Subscription is already Posted');
    end;

    trigger OnModify()
    begin
        //    if "Subscription Posted" = true then Error('Subscription is already Posted');
    end;


}