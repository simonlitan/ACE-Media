table 52178533 "Loyalty Periods"
{
    DrillDownPageId = "Loyalty Periods";
    LookupPageId = "Loyalty Periods";
    fields
    {
        field(1; "Period"; Code[30])
        {
            TableRelation = "G/L Budget Name".Name;
            trigger OnValidate()
            begin
                Description := "Period" + ' Loyalty Period';
            end;
        }
        field(2; "Description"; Text[100])
        {
        }
        field(3; "Active"; Boolean)
        {

            trigger OnValidate()
            var
                lperiod: Record "Loyalty Periods";
            begin
                lperiod.Reset();
                lperiod.SetRange(Active, true);
                if lperiod.Find('-') then Error('%1%2', 'Unmark period from active ', lperiod.Period);

            end;
        }
        field(4; "Closed"; Boolean)
        {

        }
        field(5; "Closed By"; Code[30])
        {

        }
        field(6; "Date Closed"; Boolean)
        {

        }
        field(7; "Start Date"; date)
        {

        }
        field(8; "Closure Date"; date)
        {

        }
    }


    procedure ClosePeriod(var lperiod: Record "Loyalty Periods")
    var
        lpoints: Record "Loyalty Points Ledger";
        lsubs: Record "Loyalty Subscription Ledger";
        subs: Record "Loyalty Subscriptions";
        sno: Integer;
        cloyalty: Record "Loyality Subs Per Period";
    begin
        if Today < lperiod."Closure Date" then Error('Can not close before the period is over');

        subs.Reset();
        subs.SetFilter("No.", '<>%1', '');
        if subs.Find('-') then begin
            sno := 0;
            repeat
                sno := sno + 1;

                subs.CalcFields("Earned Points", "Subscription Balance");
                if subs."Earned Points" > 0 then begin
                    lpoints.Init();
                    lpoints."Entry No." := GetLastPointsEntryNo() + sno;
                    lpoints."Account No." := subs."No.";
                    lperiod.TestField("Closure Date");
                    lpoints."Batch No." := lperiod.Period;
                    lpoints."Date Posted" := lperiod."Closure Date";
                    lpoints."Document No." := lperiod.Period;
                    lpoints."Total Points" := -subs."Earned Points";
                    lpoints."Equivalence to Cash" := -subs."Earned Points";
                    lpoints."Loyalty Period" := lperiod.Period;
                    lpoints."Loyalty Programme" := lpoints."Loyalty Programme"::Points;
                    lpoints."Posted By" := UserId;
                    lpoints."Posting Date" := lperiod."Closure Date";
                    lpoints."Sales Amount" := 0;
                    lpoints.Insert();
                end;
                if subs."Subscription Balance" > 0 then begin
                    cloyalty.Reset();
                    cloyalty.SetRange("No.", subs."No.");
                    cloyalty.SetRange(Period, lperiod.Period);
                    if cloyalty.Find('-') then begin
                        repeat
                            cloyalty.CalcFields(Balance);
                            lsubs.Init();
                            lsubs."Entry No." := GetLastsubEntryNo() + sno;
                            lsubs."Account No." := subs."No.";
                            lsubs."Batch No." := lperiod.Period;
                            lsubs."Date Posted" := Today;
                            lsubs."Document No." := lperiod.Period;

                            lsubs.Amount := -cloyalty.Balance;
                            lsubs."Loyalty Period" := lperiod.Period;
                            lsubs."Programme Type" := lsubs."Programme Type"::Subscriptions;
                            lsubs."Posted By" := UserId;
                            lsubs."Posting Date" := lperiod."Closure Date";
                            lsubs.Programme := cloyalty.Programme;
                            lsubs.Insert();
                        until cloyalty.Next() = 0;
                    end;
                end;

            until subs.Next() = 0;
        end;
        Message('Complete');

    end;

    procedure GetLastPointsEntryNo(): Integer;
    var
        mrktLedger: Record "Loyalty Points Ledger";
    begin
        mrktLedger.Reset();
        if mrktLedger.FindLast() then
            exit(mrktLedger."Entry No.")
        else
            exit(0);
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