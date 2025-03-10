table 52178538 "Loyalty Sales Capture"
{
    LookupPageId = "Loyalty Sales Capture";
    DrillDownPageId = "Loyalty Sales Capture";
    fields
    {
        field(1; "No."; Code[30])
        {
            Editable = false;
        }
        field(2; "description"; Text[250])
        {
        }
        field(3; "Document Date"; date)
        {
        }
        field(4; "Programme Type"; Enum "Loyalty Programmes")
        {
            Editable = false;
        }
        field(5; "Active Period"; Code[30])
        {
            TableRelation = "Loyalty Periods".Period;
        }
        field(7; "Posted"; Boolean)
        {

        }
        field(8; "Dimension 1"; Code[30])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

        }
        field(9; "Dimension 2"; Code[30])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
    }

    trigger OnInsert()
    var
        setup: Record "Loyalty Setups";
        noseries: Codeunit NoSeriesManagement;
        lperiod: Record "Loyalty Periods";
    begin
        if "No." = '' then begin
            setup.Get();
            "No." := noseries.GetNextNo(setup."Sales Capture", 0D, True);
            "Document Date" := Today;

            lperiod.Reset();
            lperiod.SetRange(Active, true);
            if lperiod.Find('+') then begin
                lperiod.TestField(Period);
                "Active Period" := lperiod."Period";
            end;

        end;

    end;

    //points payment
    procedure generatePoints(var scap: Record "Loyalty Sales Capture")
    var
        ledger: Record "Loyalty Points Ledger";
        sline: Record "Loyalty Sales Lines";
        lprog: Record "Loyalty Programmes";
        info: Record "Company Information";
        //OpHeader: Record "Journal Voucher Header";
        //sline: Record "Journals Voucher Lines";
        GenJnLine: Record "Gen. Journal Line";
        Batch: Record "Gen. Journal Batch";
        LineNo: Integer;
        sno: Integer;
        CKP: Codeunit "Posting Check FP";
        pledger: Record "Loyalty Points Ledger";

    begin
        if Confirm('Generate Points ', true) = false then Error('Cancelled');
        sline.Reset();
        sline.SetRange("No.", scap."No.");
        if sline.Find('-') then begin
            sno := 0;
            LineNo := 1000;
            repeat
                sno := sno + 1;
                if sline."Payment Method" = sline."Payment Method"::Cash then begin
                    lprog.Reset();
                    lprog.SetRange("Programme Type", lprog."Programme Type"::Points);
                    if lprog.Find('-') then begin
                        if lprog."Amount per Point" > 0 then begin
                            sline."Points Earned" := sline.Amount / lprog."Amount per Point";
                            sline.Validate(sline."Points Earned");
                            sline.Modify();
                            //Ledger Lodging 
                            // Delete Lines Present on the General Journal Line
                            GenJnLine.RESET;
                            GenJnLine.SETRANGE(GenJnLine."Journal Template Name", 'GENERAL');
                            GenJnLine.SETRANGE(GenJnLine."Journal Batch Name", 'Default');
                            GenJnLine.DELETEALL;

                            Batch.INIT;
                            Batch."Journal Template Name" := 'GENERAL';
                            Batch.Name := 'Default';
                            IF NOT Batch.GET(Batch."Journal Template Name", Batch.Name) THEN
                                Batch.INSERT;



                            LineNo := LineNo + sno;
                            GenJnLine.INIT;
                            GenJnLine."Journal Template Name" := 'GENERAL';
                            GenJnLine."Journal Batch Name" := 'Default';
                            GenJnLine."Line No." := LineNo;
                            GenJnLine."Account Type" := GenJnLine."Account Type"::"G/L Account";
                            GenJnLine."Account No." := lprog."Accrued Expense";
                            GenJnLine."Posting Date" := sline."Transaction Date";
                            //Check Posting Date
                            CKP.ValidatePostingDate(GenJnLine."Posting Date");
                            if sline."Transaction No." = '' then
                                GenJnLine."Document No." := scap."No."
                            else
                                GenJnLine."Document No." := sline."Transaction No.";
                            GenJnLine.Description := sline.Description;

                            GenJnLine."External Document No." := scap."No.";
                            GenJnLine.Amount := sline."Points Earned";
                            GenJnLine.VALIDATE(GenJnLine.Amount);
                            GenJnLine."Amount (LCY)" := sline."Points Earned";
                            GenJnLine."Shortcut Dimension 1 Code" := scap."Dimension 1";
                            GenJnLine."Shortcut Dimension 2 Code" := scap."Dimension 2";
                            GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"G/L Account";
                            GenJnLine."Bal. Account No." := lprog."Accrued Liability";

                            IF GenJnLine.Amount <> 0 THEN
                                GenJnLine.INSERT;
                            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnLine);
                        end;


                        pledger.Init();
                        pledger."Entry No." := GetLastPointsEntryNo() + sno;
                        pledger."Account No." := sline."Account No.";
                        pledger."Batch No." := scap."No.";
                        pledger."Date Posted" := sline."Transaction Date";
                        if sline."Transaction No." = '' then
                            pledger."Document No." := scap."No."
                        else
                            pledger."Document No." := sline."Transaction No.";

                        pledger."Total Points" := sline."Points Earned";
                        pledger."Equivalence to Cash" := sline."Points Earned";
                        pledger."Loyalty Period" := scap."Active Period";
                        pledger."Loyalty Programme" := scap."Programme Type";
                        pledger."Posted By" := UserId;
                        pledger."Posting Date" := sline."Transaction Date";
                        pledger."Sales Amount" := sline.Amount;
                        pledger.Insert();
                    end;


                end else begin
                    sline.CalcFields("Total Points");
                    if sline.Amount <= sline."Total Points" then begin
                        pledger.Init();
                        pledger."Entry No." := GetLastPointsEntryNo() + sno;
                        pledger."Account No." := sline."Account No.";
                        pledger."Batch No." := scap."No.";
                        pledger."Date Posted" := sline."Transaction Date";
                        if sline."Transaction No." = '' then
                            pledger."Document No." := scap."No."
                        else
                            pledger."Document No." := sline."Transaction No.";

                        pledger."Total Points" := -sline.Amount;
                        pledger."Equivalence to Cash" := -sline.Amount;
                        pledger."Loyalty Period" := scap."Active Period";
                        pledger."Loyalty Programme" := scap."Programme Type";
                        pledger."Posted By" := UserId;
                        pledger."Posting Date" := sline."Transaction Date";
                        pledger."Sales Amount" := sline.Amount;
                        pledger.Insert();
                    end else
                        Error('Sale amount should not be more than total Points');

                end;

                if sline."Transaction No." = '' then
                    sline."Transaction No." := scap."No.";
                sline.Posted := true;
                sline.Modify();

                scap.Posted := true;
                scap.Modify();



            until sline.Next() = 0;

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



    procedure generateSubs(var scap: Record "Loyalty Sales Capture")
    var
        ledger: Record "Loyalty Points Ledger";
        sline: Record "Loyalty Sales Lines";
        lprog: Record "Loyalty Programmes";
        info: Record "Company Information";
        GenJnLine: Record "Gen. Journal Line";
        Batch: Record "Gen. Journal Batch";
        LineNo: Integer;
        sno: Integer;
        CKP: Codeunit "Posting Check FP";
        pledger: Record "Loyalty Points Ledger";
        sledger: Record "Loyalty Subscription Ledger";

    begin
        if Confirm('Post Subscription ?', true) = false then Error('Cancelled');
        sline.Reset();
        sline.SetRange("No.", scap."No.");
        if sline.Find('-') then begin
            sno := 0;
            LineNo := 1000;
            repeat
                lprog.Reset();
                lprog.SetRange("Programme Type", lprog."Programme Type"::Subscriptions);
                if lprog.Find('-') then begin
                    sline.Amount := lprog."Charge Per Session";
                    sline."Points Earned" := sline.Amount / lprog."Amount per Point";
                    sline.Validate(sline."Points Earned");
                    sline.Modify();

                    // Ledger Lodging 
                    // Delete Lines Present on the General Journal Line
                    GenJnLine.RESET;
                    GenJnLine.SETRANGE(GenJnLine."Journal Template Name", 'GENERAL');
                    GenJnLine.SETRANGE(GenJnLine."Journal Batch Name", 'Default');
                    GenJnLine.DELETEALL;

                    Batch.INIT;
                    Batch."Journal Template Name" := 'GENERAL';
                    Batch.Name := 'Default';
                    IF NOT Batch.GET(Batch."Journal Template Name", Batch.Name) THEN
                        Batch.INSERT;
                    sno := sno + 1;

                    LineNo := LineNo + sno;
                    GenJnLine.INIT;
                    GenJnLine."Journal Template Name" := 'GENERAL';
                    GenJnLine."Journal Batch Name" := 'Default';
                    GenJnLine."Line No." := LineNo;
                    GenJnLine."Account Type" := GenJnLine."Account Type"::"G/L Account";
                    GenJnLine."Account No." := lprog."Accrued Expense";
                    GenJnLine."Posting Date" := sline."Transaction Date";
                    //Check Posting Date
                    CKP.ValidatePostingDate(GenJnLine."Posting Date");
                    if sline."Transaction No." = '' then
                        GenJnLine."Document No." := scap."No."
                    else
                        GenJnLine."Document No." := sline."Transaction No.";
                    GenJnLine.Description := sline.Description;

                    GenJnLine."External Document No." := scap."No.";
                    GenJnLine.Amount := sline."Points Earned";
                    GenJnLine.VALIDATE(GenJnLine.Amount);
                    GenJnLine."Amount (LCY)" := sline."Points Earned";
                    GenJnLine."Shortcut Dimension 1 Code" := scap."Dimension 1";
                    GenJnLine."Shortcut Dimension 2 Code" := scap."Dimension 2";
                    GenJnLine."Bal. Account Type" := GenJnLine."Bal. Account Type"::"G/L Account";
                    GenJnLine."Bal. Account No." := lprog."Accrued Liability";

                    IF GenJnLine.Amount <> 0 THEN
                        GenJnLine.INSERT;
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnLine);

                    pledger.Init();
                    pledger."Entry No." := GetLastPointsEntryNo() + sno;
                    pledger."Account No." := sline."Account No.";
                    pledger."Batch No." := scap."No.";
                    pledger."Date Posted" := sline."Transaction Date";
                    if sline."Transaction No." = '' then
                        pledger."Document No." := scap."No."
                    else
                        pledger."Document No." := sline."Transaction No.";
                    pledger."Total Points" := sline."Points Earned";
                    pledger."Equivalence to Cash" := sline."Points Earned";
                    pledger."Loyalty Period" := scap."Active Period";
                    pledger."Loyalty Programme" := scap."Programme Type";
                    pledger."Posted By" := UserId;
                    pledger."Posting Date" := sline."Transaction Date";
                    pledger."Sales Amount" := sline.Amount;
                    pledger.Insert();

                    sledger.Init();
                    sledger."Entry No." := GetLastsubEntryNo() + sno;
                    sledger."Account No." := sline."Account No.";
                    sledger."Batch No." := scap."No.";
                    sledger."Date Posted" := sline."Transaction Date";
                    if sline."Transaction No." = '' then
                        sledger."Document No." := scap."No."
                    else
                        sledger."Document No." := sline."Transaction No.";

                    sledger.Amount := -sline.Amount;
                    sledger."Loyalty Period" := scap."Active Period";
                    sledger."Programme Type" := scap."Programme Type";
                    sledger."Posted By" := UserId;
                    sledger."Posting Date" := sline."Transaction Date";
                    sledger.Programme := sline.Programme;
                    sledger.Insert();
                end;
                if sline."Transaction No." = '' then
                    sline."Transaction No." := scap."No.";
                sline.Posted := true;
                sline.Modify();

                scap.Posted := true;
                scap.Modify();

            until sline.Next() = 0;

        end;
        Message('Complete');

    end;


}