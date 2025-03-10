page 52178760 "Journal Voucher Header"
{
    Caption = 'Journal Voucher Card';
    PageType = Card;
    SourceTable = "Journal Voucher Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        // UpdateLines();
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        //  UpdateLines();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field("Posted "; Rec.Posted)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.', Comment = '%';
                }

            }
            part(lines; "Journal Voucher Lines")
            {
                SubPageLink = "No." = field("No.");

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = all;
                Image = Post;
                trigger OnAction()
                begin
                    posttojournal();

                end;

            }
            // action("Post")
            // {
            //     ApplicationArea = All;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     trigger OnAction()
            //     var
            //         Opheader: Record "Journal Voucher Header";
            //     begin

            //         Opheader.Reset();
            //         Opheader.SetRange("No.", rec."No.");
            //         Opheader.SetRange(Posted, false);
            //         if Opheader.Find('-') then begin
            //             report.Run(report::"Process JVS", true, false, Opheader);
            //         end else
            //             Error('Already posted');
            //         CurrPage.Close();

            //     end;
            // }
            // action("Process JVS")
            // {
            //     ApplicationArea = all;
            //     RunObject = report "Process JVS";
            // }

            action("Send Approval")
            {
                ApplicationArea = All;
                image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    JVHeader: Record "Journal Voucher Header";

                begin
                    commitbudget();
                    Decommit();
                    approvalmgt.OnSendJvsforApproval(Rec);


                end;

            }
            action("Cancel Approval")
            {
                ApplicationArea = All;
                image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    approvalmgt.OnCancelJvsforApproval(Rec);
                    //cancelcommitbudget();
                end;

            }

        }
    }
    var
        GLAccount: Record "G/L Account";
        CountRec: Integer;
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
        Line2: Integer;
        approvalmgt: Codeunit "Init Code";
        JournalLine2: Record "Journals Voucher Lines";

    procedure commitbudget()
    begin
        BCSetup.GET;
        //IF NOT ((BCSetup.Mandatory) AND (BCSetup."PV Budget Mandatory")) THEN EXIT;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");


        //Get Current Lines to loop through
        JournalLine2.RESET;
        JournalLine2.SETRANGE("No.", Rec."No.");
        JournalLine2.SETRANGE("Account Type", JournalLine2."Account Type"::"G/L Account");

        //JournalLine.SetRange("Line No", JournalLine."Line No");
        //.SETRANGE("Processed", FALSE);
        IF JournalLine2.FIND('-') THEN BEGIN


            REPEAT

            BEGIN
                JournalLine.reset;
                JournalLine.SetFilter("Debit Amount", '>%1', 0);
                //JournalLine.SetRange("Account No.", JournalLine2."Account No.");
                JournalLine.SetRange("Line No.", JournalLine2."Line No.");
                if JournalLine.Findset then begin
                    // Check if budget exists
                    // CountRec := JournalLine.Count;
                    // Message(Format(CountRec));



                    JournalLine.TESTFIELD("Account No.");
                    JournalLine.TestField(JournalLine."Shortcut Dimension 1 Code");
                    JournalLine.TESTFIELD(JournalLine."Shortcut Dimension 2 Code");
                    GLAccount.RESET;
                    GLAccount.SETRANGE("No.", JournalLine."Account No.");
                    IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                    DimensionValue.RESET;
                    //  DimensionValue.SETRANGE(Code, JournalLine."Shortcut Dimension 2 Code");
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






            end;
            UNTIL JournalLine2.NEXT = 0;
        end;
    end;

    procedure Decommit()

    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        DocumentNo: code[20];
    begin

        BCSetup.GET;
        //IF NOT ((BCSetup.Mandatory) AND (BCSetup."PV Budget Mandatory")) THEN EXIT;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");


        //Get Current Lines to loop through
        JournalLine2.RESET;
        JournalLine2.SETRANGE("No.", Rec."No.");
        JournalLine2.SETRANGE("Account Type", JournalLine2."Account Type"::"G/L Account");

        //JournalLine.SetRange("Line No", JournalLine."Line No");
        //.SETRANGE("Processed", FALSE);
        IF JournalLine2.FIND('-') THEN BEGIN


            REPEAT

            BEGIN
                JournalLine.reset;
                JournalLine.SetFilter("Credit Amount", '>%1', 0);
                JournalLine.SetRange("Account No.", JournalLine2."Account No.");
                JournalLine.SetRange("Line No.", JournalLine2."Line No.");
                if JournalLine.Findset then begin
                    JournalLine.TESTFIELD("Account No.");
                    JournalLine.TestField(JournalLine."Shortcut Dimension 1 Code");
                    JournalLine.TESTFIELD(JournalLine."Shortcut Dimension 2 Code");
                    GLAccount.RESET;
                    GLAccount.SETRANGE("No.", JournalLine."Account No.");
                    IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                    DimensionValue.RESET;
                    //  DimensionValue.SETRANGE(Code, JournalLine."Shortcut Dimension 2 Code");
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
                                IF (JournalLine."Credit Amount" > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                            END;
                        END;
                    end ELSE
                        DocumentNo := Rec."No." + JournalLine."Account No.";
                    Message(Format(DocumentNo));

                    FINBudgetEntries.RESET;
                    FINBudgetEntries.SETRANGE("Budget Name", GetCurrentBudget);
                    FINBudgetEntries.SETRANGE("Document No", DocumentNo);
                    FINBudgetEntries.SETFILTER(FINBudgetEntries."Commitment Status", '<>%1', FINBudgetEntries."Commitment Status"::Cancelled);
                    IF FINBudgetEntries.FIND('-') THEN EXIT;//ERROR('Budget already checked!');

                    CLEAR(LastItem);
                    FINBudgetEntries.RESET;
                    IF FINBudgetEntries.FIND('+') THEN LastItem := FINBudgetEntries."Entry No.";
                    BEGIN
                        LastItem := LastItem + 1;
                        FINBudgetEntries.INIT;
                        FINBudgetEntries."Entry No." := LastItem;
                        FINBudgetEntries."Budget Name" := GetCurrentBudget;
                        FINBudgetEntries."G/L Account No." := JournalLine."Account No.";
                        FINBudgetEntries.Date := JournalLine."Creation Date";
                        FINBudgetEntries."Global Dimension 1 Code" := JournalLine."Shortcut Dimension 1 Code";
                        FINBudgetEntries."Global Dimension 2 Code" := JournalLine."Shortcut Dimension 2 Code";
                        FINBudgetEntries."Budget Dimension 3 Code" := '';
                        FINBudgetEntries.Amount := JournalLine."Credit Amount";
                        FINBudgetEntries.Description := Rec.Description;
                        FINBudgetEntries."Business Unit Code" := '';
                        FINBudgetEntries."User ID" := USERID;
                        FINBudgetEntries."Last Date Modified" := TODAY;
                        //FINBudgetEntries."Dimension Set ID":='';
                        FINBudgetEntries."Transaction Type" := FINBudgetEntries."Transaction Type"::Commitment;
                        FINBudgetEntries."Commitment Status" := FINBudgetEntries."Commitment Status"::Commitment;
                        FINBudgetEntries."Document Type" := 'JV';
                        FINBudgetEntries."Document No" := DocumentNo;
                        FINBudgetEntries."Document Description" := Rec.Description;
                        ;
                        FINBudgetEntries.INSERT;
                    END;
                    UpdatePercentages(JournalLine."Account No.", JournalLine."Shortcut Dimension 1 Code", JournalLine."Shortcut Dimension 2 Code");
                end;

            end;


            until JournalLine2.next() = 0;
        end;
    end;

    procedure GetCurrentBudget() CurrBudget: Code[20]
    var
        GLBudgetName: Record "G/L Budget Name";
        FINBudgetaryControlSetup: Record "FIN-Budgetary Control Setup";
    begin
        CLEAR(CurrBudget);
        FINBudgetaryControlSetup.RESET();
        IF FINBudgetaryControlSetup.FIND('-') THEN BEGIN
            FINBudgetaryControlSetup.TESTFIELD("Current Budget Code");

        END;
        CurrBudget := FINBudgetaryControlSetup."Current Budget Code";
    end;

    local procedure UpdatePercentages(glAccount: Code[20]; global1: Code[20]; Global2: Code[20])
    var
        FINBudgetEntriesSummary: Record "FIN-Budget Entries Summary";
    begin
        IF GetCurrentBudget <> '' THEN BEGIN
            FINBudgetEntriesSummary.RESET;
            FINBudgetEntriesSummary.SETRANGE("Budget Name", GetCurrentBudget);
            FINBudgetEntriesSummary.SETRANGE("G/L Account No.", glAccount);
            FINBudgetEntriesSummary.SETRANGE("Global Dimension 1 Code", global1);
            FINBudgetEntriesSummary.SETRANGE("Global Dimension 2 Code", Global2);

            IF FINBudgetEntriesSummary.FIND('-') THEN BEGIN
                FINBudgetEntriesSummary.CALCFIELDS(Allocation, Commitments, Expenses, Revision, Balance, "Net Balance");
                IF FINBudgetEntriesSummary.Allocation > 0 THEN BEGIN
                    FINBudgetEntriesSummary."% Balance" := (FINBudgetEntriesSummary.Balance / FINBudgetEntriesSummary.Allocation) * 100;
                    FINBudgetEntriesSummary."% Net Balance" := (FINBudgetEntriesSummary."Net Balance" / FINBudgetEntriesSummary.Allocation) * 100;
                    FINBudgetEntriesSummary.MODIFY;
                END;
            END;
        END;
    end;






    procedure cancelcommitbudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin

        BCSetup.GET;
        //IF NOT ((BCSetup.Mandatory) AND (BCSetup."PV Budget Mandatory")) THEN EXIT;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");


        //Get Current Lines to loop through
        JournalLine2.RESET;
        JournalLine2.SETRANGE("No.", Rec."No.");
        JournalLine2.SETRANGE("Account Type", JournalLine."Account Type"::"G/L Account");

        //JournalLine.SetRange("Line No", JournalLine."Line No");
        JournalLine2.SETRANGE("Processed", FALSE);
        IF JournalLine2.FIND('-') THEN BEGIN


            REPEAT

            BEGIN
                JournalLine.reset;
                JournalLine.SetFilter("Credit Amount", '>%1', 0);
                //JournalLine.SetRange("Account No.", JournalLine2."Account No.");
                JournalLine.SetRange("Line No.", JournalLine2."Line No.");
                if JournalLine.Findset then begin
                    // Check if budget exists
                    // CountRec := JournalLine.Count;
                    // Message(Format(CountRec));



                    JournalLine.TESTFIELD("Account No.");
                    JournalLine.TestField(JournalLine."Shortcut Dimension 1 Code");
                    JournalLine.TESTFIELD(JournalLine."Shortcut Dimension 2 Code");
                    GLAccount.RESET;
                    GLAccount.SETRANGE("No.", JournalLine."Account No.");
                    IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                    DimensionValue.RESET;
                    //  DimensionValue.SETRANGE(Code, JournalLine."Shortcut Dimension 2 Code");
                    // DimensionValue.SETRANGE("Global Dimension No.", 2);
                    DimensionValue.SetRange(Code, JournalLine."shortcut Dimension 1 Code");
                    DimensionValue.SETRANGE("Global Dimension No.", 2);
                    IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);

                    PostBudgetEnties.CheckBudgetAvailability(JournalLine."Account No.", JournalLine."Creation Date", JournalLine."Shortcut Dimension 1 Code", JournalLine."Shortcut Dimension 2 Code",
                    JournalLine."Credit Amount" * -1, JournalLine.Description, 'Jv', Rec."No." + JournalLine."Account No.", Rec.Description);
                    ;


                end;
            end;
            UNTIL JournalLine2.NEXT = 0;
        end;
    end;


    local procedure posttojournal()
    begin
        if Rec.Posted THEN EXIT;
        GenLine.RESET;
        GenLine.SETRANGE(GenLine."Journal Template Name", 'GENERAL');
        GenLine.SETRANGE(GenLine."Journal Batch Name", 'JOURNAL');
        //GenLine.SetRange(GenLine."Debit Amount", JournalLine."Debit Amount");
        // GenLine.SetRange(GenLine."Credit Amount", JournalLine."Credit Amount");
        IF GenLine.FIND('+') THEN BEGIN
            // IF GenLine.FIND('Debit') THEN BEGIN

            GenLine.DELETEALL;


            JournalLine.RESET;
            JournalLine.SETRANGE("No.", Rec."No.");
            JournalLine.SETRANGE("Processed", FALSE);
            IF JournalLine.FIND('-') THEN BEGIN
                REPEAT
                BEGIN
                    if JournalLine."Debit Amount" > 0 then begin
                        lineno := 10000;
                        GenLine.INIT;
                        GenLine."Journal Template Name" := 'GENERAL';
                        GenLine."Journal Batch Name" := 'JOURNAL';
                        //GenLine."Journal Batch Name" := UserId;

                        GenLine."Line No." := lineno + 1;
                        GenLine."Document No." := Rec."No.";
                        GenLine."Posting Date" := JournalLine."Creation Date";

                        GenLine."Account Type" := JournalLine."Account Type";
                        GenLine."Account No." := JournalLine."Account No.";
                        GenLine."Bal. Account Type" := JournalLine."Bal. Account Type";
                        GenLine."Bal. Account No." := JournalLine."Bal. Account No.";
                        GenLine.Validate("Bal. Account No.");
                        GenLine."Shortcut Dimension 1 Code" := JournalLine."Shortcut Dimension 1 Code";
                        GenLine.Validate("Shortcut Dimension 1 Code");
                        GenLine."Shortcut Dimension 2 Code" := JournalLine."Shortcut Dimension 2 Code";
                        GenLine.Validate("Shortcut Dimension 1 Code");
                        GenLine.Description := JournalLine.Description;
                        GenLine.Amount := JournalLine."Debit Amount";
                        if GenLine.Amount <> 0 then
                            GenLine.INSERT;
                    End;

                    if JournalLine."Credit Amount" > 0 then begin
                        Line2 := 11000;
                        GenLine.INIT;
                        GenLine."Journal Template Name" := 'GENERAL';
                        GenLine."Journal Batch Name" := 'JOURNAL';

                        GenLine."Line No." := Line2 + 1;
                        GenLine."Document No." := Rec."No.";
                        GenLine."Posting Date" := JournalLine."Creation Date";
                        GenLine."Account Type" := JournalLine."Account Type";
                        GenLine."Account No." := JournalLine."Account No.";
                        GenLine."Shortcut Dimension 1 Code" := JournalLine."Shortcut Dimension 1 Code";
                        GenLine.Validate("Shortcut Dimension 1 Code");
                        GenLine."Shortcut Dimension 2 Code" := JournalLine."Shortcut Dimension 2 Code";
                        GenLine.Validate("Shortcut Dimension 2 Code");
                        GenLine."Bal. Account Type" := JournalLine."Bal. Account Type";
                        GenLine."Bal. Account No." := JournalLine."Bal. Account No.";

                        GenLine.Validate("Bal. Account No.");
                        GenLine.Description := JournalLine.Description;
                        GenLine.Amount := JournalLine."Credit Amount" * -1;
                        if GenLine.Amount <> 0 then
                            GenLine.INSERT;
                    end;
                end;



                UNTIL JournalLine.NEXT = 0;
            END;

            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenLine);
            Rec.Posted := TRUE;
            Rec.MODIFY;
            JournalLine.processed := TRUE;
            JournalLine.Modify();
            // Rec.Posted := true;
            rec.Status := Rec.Status::Posted;
            rec.Modify();
        end;
    END;






}
