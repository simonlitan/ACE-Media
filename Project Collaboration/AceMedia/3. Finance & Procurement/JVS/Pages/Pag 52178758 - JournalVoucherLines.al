page 52178758 "Journal Voucher Lines"
{
    Caption = 'Journal Voucher Line';
    PageType = ListPart;
    SourceTable = "Journals Voucher Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = all;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field("Account No"; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.', Comment = '%';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.', Comment = '%';
                }
                // field(Amount; Rec.Amount)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                // }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = all;
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = all;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    Caption = 'Balance Acc Type';
                    ApplicationArea = all;
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    Caption = 'Balancing Account';
                    ApplicationArea = all;
                }

                field(processed; Rec.processed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the processed field.', Comment = '%';
                }

            }

        }
    }
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        JournalLine: Record "Journals Voucher Lines";
        PvLine: Record "Journals Voucher Lines";
        DefaultBatch: Record 232;
        CashierLinks: Record "FIN-Cash Office User Template";
        LastItem: Integer;
        Cashoffice: record "Cash Office Setup";
        GenLine: Record "Gen. Journal Line";
        lineno: Integer;
        approvalmgt: Codeunit "Init Code";
        JVHeader: Record "Journal Voucher Header";

    procedure commitbudget()
    begin
        BCSetup.GET;
        //IF NOT ((BCSetup.Mandatory) AND (BCSetup."PV Budget Mandatory")) THEN EXIT;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        JournalLine.TestField("Shortcut Dimension 1 Code");
        JournalLine.TestField("Shortcut Dimension 2 Code");

        //Get Current Lines to loop through
        JournalLine.RESET;
        JournalLine.SETRANGE("No.", Rec."No.");
        JournalLine.SETRANGE("Account Type", JournalLine."Account Type"::"G/L Account");
        JournalLine.SetFilter("Debit Amount", '>%1', 0);
        //JournalLine.SetRange("Account No.", JournalLine."Account No.");
        //JournalLine.SetRange("Line No", JournalLine."Line No");
        JournalLine.SETRANGE("Processed", FALSE);
        IF JournalLine.FIND('-') THEN BEGIN

            REPEAT

            BEGIN
                // Check if budget exists
                JournalLine.TESTFIELD("Account No.");
                JournalLine.TestField(JournalLine."Shortcut Dimension 1 Code");
                JournalLine.TESTFIELD(JournalLine."Shortcut Dimension 2 Code");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", JournalLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                // DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                // DimensionValue.SETRANGE("Global Dimension No.", 2);
                DimensionValue.SetRange(Code, JournalLine."shortcut Dimension 1 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", JournalLine."Account No.");
                FINBudgetEntries.SETRANGE("Global Dimension 1 Code", JournalLine."Shortcut Dimension 1 Code");
                FINBudgetEntries.SETRANGE("Global Dimension 2 Code", JournalLine."Shortcut Dimension 2 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense,
                 FINBudgetEntries."Transaction Type"::Commitment, FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::"Commited/Posted",
               FINBudgetEntries."Commitment Status"::Commitment);
                // FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::Cancelled,
                // FINBudgetEntries."Commitment Status"::"Commited/Posted", FINBudgetEntries."Commitment Status"::Commitment);
                //  FINBudgetEntries.setrange(Date, PostBudgetEnties.GetBudgetStartDate(Rec."Document Date"), PostBudgetEnties.GetBudgetEndDate(Rec."Document Date"));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (JournalLine."Debit Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                            PostBudgetEnties.CheckBudgetAvailability(JournalLine."Account No.", JournalLine."Creation Date", JournalLine."Shortcut Dimension 1 Code", JournalLine."Shortcut Dimension 2 Code",
                            JournalLine."Debit Amount", JournalLine.Description, 'Jv', Rec."No." + JournalLine."Account No.", Rec.Description);
                        END ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                    END;
                END ELSE
                    IF PostBudgetEnties.checkBudgetControl(JournalLine."Account No.") THEN
                        ERROR('Missing Budget for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
            END;
            UNTIL JournalLine.NEXT = 0;




        end;
    end;


    procedure cancelcommitbudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT (BCSetup.Mandatory) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");

        JournalLine.Reset();
        JournalLine.SETRANGE("No.", Rec."No.");
        JournalLine.SETRANGE("Account Type", JournalLine."Account Type"::"G/L Account");
        JournalLine.SetFilter("Credit Amount", '>%1', 0);
        IF JournalLine.FIND('-') THEN BEGIN
            REPEAT
                // Expense Budget Here
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", JournalLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, JournalLine."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                PostBudgetEnties.CheckBudgetAvailability(JournalLine."Account No.", JournalLine."Creation Date", JournalLine."Shortcut Dimension 1 Code", JournalLine."Shortcut Dimension 2 Code",
                     JournalLine."Credit Amount" * -1, JournalLine.Description, 'Jv', Rec."No." + JournalLine."Account No.", Rec.Description);

            UNTIL JournalLine.NEXT = 0;
        END;

    end;

    local procedure posttojournal()
    begin
        if JVHeader.Posted THEN EXIT;
        GenLine.RESET;
        GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
        GenLine.SETRANGE(GenLine."Journal Batch Name", 'JOURNAL');
        //GenLine.SetRange(GenLine."Debit Amount", JournalLine."Debit Amount");
        // GenLine.SetRange(GenLine."Credit Amount", JournalLine."Credit Amount");
        IF GenLine.FIND('+') THEN BEGIN
            // IF GenLine.FIND('Debit') THEN BEGIN

            GenLine.DELETEALL;
        end;

        JournalLine.RESET;
        JournalLine.SETRANGE("No.", Rec."No.");
        JournalLine.SETRANGE("Processed", FALSE);
        IF JournalLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                if JournalLine."Debit Amount" > 0 then begin
                    lineno += 10000;
                    GenLine.INIT;
                    GenLine."Journal Template Name" := 'GENERAL';
                    GenLine."Journal Batch Name" := 'JOURNAL';
                    GenLine."Journal Batch Name" := UserId;

                    GenLine."Line No." := lineno;
                    GenLine."Document No." := Rec."No.";
                    GenLine."Posting Date" := JournalLine."Creation Date";

                    GenLine."Account Type" := JournalLine."Account Type";
                    GenLine."Account No." := JournalLine."Account No.";
                    GenLine."Bal. Account Type" := JournalLine."Bal. Account Type";
                    GenLine."Bal. Account No." := JournalLine."Bal. Account No.";
                    GenLine."Shortcut Dimension 1 Code" := JournalLine."Shortcut Dimension 1 Code";
                    GenLine."Shortcut Dimension 2 Code" := JournalLine."Shortcut Dimension 2 Code";
                    GenLine.Description := JournalLine.Description;
                    GenLine.Amount := JournalLine."Debit Amount";
                    GenLine.INSERT;
                end else
                    if JournalLine."Credit Amount" > 0 then begin

                        lineno += 11000;
                        GenLine.INIT;
                        GenLine."Journal Template Name" := 'GENERAL';
                        GenLine."Journal Batch Name" := 'JOURNAL';

                        GenLine."Line No." := lineno;
                        GenLine."Document No." := Rec."No.";
                        GenLine."Posting Date" := JournalLine."Creation Date";
                        GenLine."Account Type" := JournalLine."Account Type";
                        GenLine."Account No." := JournalLine."Account No.";
                        GenLine."Shortcut Dimension 1 Code" := JournalLine."Shortcut Dimension 1 Code";
                        GenLine."Shortcut Dimension 2 Code" := JournalLine."Shortcut Dimension 2 Code";
                        GenLine."Bal. Account Type" := JournalLine."Bal. Account Type";
                        GenLine."Bal. Account No." := JournalLine."Bal. Account No.";
                        GenLine.Description := JournalLine.Description;
                        GenLine.Amount := JournalLine."Credit Amount" * -1;
                        GenLine.INSERT;

                    END;
            end;
            UNTIL JournalLine.NEXT = 0;
        END;
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenLine);
        JVHeader.Posted := TRUE;
        Rec.MODIFY;
        JournalLine.processed := TRUE;
        JournalLine.Modify();
        // Rec.Posted := true;
        JVHeader.Status := JVHeader.Status::Posted;
        rec.Modify();
    end;



}


