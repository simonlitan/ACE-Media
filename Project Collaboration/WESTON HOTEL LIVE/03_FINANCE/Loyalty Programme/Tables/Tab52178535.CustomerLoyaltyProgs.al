table 52178535 "Customer Loyalty Progs"
{
    LookupPageId = "Customer Loyalty Progs";
    DrillDownPageId = "Customer Loyalty Progs";
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
                lprogs.Reset();
                lprogs.SetRange("Code", Programme);
                if lprogs.Find('-') then begin
                    "LifeTime Registration" := lprogs."LifeTime Registration";
                    "Renewal Registration" := lprogs."Renewal Registration";
                end;

            end;
        }
        field(8; "LifeTime Registration"; Boolean)
        {
        }
        field(9; "Renewal Registration"; Boolean)
        {

        }
        field(10; "Date Posted"; date)
        {

        }
        field(11; "Posted By"; Code[30])
        {

        }
    }

    keys
    {
        key(pk; "No.", Programme)
        {

        }
    }

    procedure PostSubscription(var psub: Record "Customer Loyalty Progs")
    var
        ledger: Record "Loyalty Points Ledger";
        sline: Record "Loyality Subs Per Period";
        lprog: Record "Loyalty Programmes";
        info: Record "Company Information";
        GenJnLine: Record "Gen. Journal Line";
        Batch: Record "Gen. Journal Batch";
        LineNo: Integer;
        sno: Integer;
        CKP: Codeunit "Posting Check FP";

        sledger: Record "Loyalty Subscription Ledger";

    begin
        if Confirm('Post Subscription ?', true) = false then Error('Cancelled');
        sline.Reset();
        sline.SetRange("No.", psub."No.");
        sline.SetRange("Subscription Posted", false);
        if sline.Find('-') then begin
            sno := 0;
            repeat
                sno := sno + 1;
                lprog.Reset();
                lprog.SetRange("Code", sline.Programme);
                lprog.SetRange("Programme Type", lprog."Programme Type"::Subscriptions);
                if lprog.Find('-') then begin
                    sledger.Init();
                    sledger."Entry No." := GetLastsubEntryNo() + sno;
                    sledger."Account No." := sline."No.";
                    sledger."Batch No." := sline."Telephone No.";
                    sledger."Date Posted" := Today;
                    sledger."Document No." := sline."ID/Passport No.";
                    sledger.Amount := lprog."Subscription Fee";
                    sledger.TestField(Amount);
                    sledger."Subscription Amount" := lprog."Subscription Fee";
                    sledger."Loyalty Period" := sline.Period;
                    sledger."Programme Type" := sledger."Programme Type"::Subscriptions;
                    sledger."Posted By" := UserId;
                    sledger."Posting Date" := sline."Date Registered";
                    sledger.Programme := sline.Programme;
                    sledger.Insert();
                end;
                sline."Subscription Posted" := true;
                sline.Modify();
            until sline.Next() = 0;
        end;
        Message('Complete');
    end;

    procedure GetLastsubEntryNo(): Integer;
    var
        mrktLedger: Record "Loyalty Points Ledger";
    begin
        mrktLedger.Reset();
        if mrktLedger.FindLast() then
            exit(mrktLedger."Entry No.")
        else
            exit(0);
    end;

}