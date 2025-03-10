table 52178508 "Advance PettyCash Header"
{
    LookupPageId = "Advance PettyCash List";
    DrillDownPageId = "Advance PettyCash List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the reference of the payment voucher in the database';
            NotBlank = false;
        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the payment voucher was inserted into the system';

        }
        field(10; payee; Text[100])
        {
            Description = 'Stores the name of the person on whose behalf the payment voucher was taken';
        }
        field(11; Cashier; Code[30])
        {
            Description = 'Stores the identifier of the cashier in the database';
        }
        field(16; Posted; Boolean)
        {
            Description = 'Stores whether the payment voucher is posted or not';
        }
        field(17; "Date Posted"; Date)
        {
            Description = 'Stores the date when the payment voucher was posted';
        }
        field(18; "Time Posted"; Time)
        {

        }
        field(3; "Budget Center Name"; Text[30])
        {

        }
        field(4; "Total VAT Amount"; code[20])
        {

        }

        field(19; "Posted By"; Code[20])
        {
            Description = 'Stores the name of the person who posted the payment voucher';
        }

        field(20; "Payment Amount"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = sum("Advance PettyCash Lines".Amount where("Document No." = field("No."), "Petty Cash Holder" = field("Account No.")));
            Description = 'Stores the amount of the payment voucher';
            Editable = false;

        }

        field(28; "Paying Bank Account"; Code[20])
        {
            Description = 'Stores the name of the paying bank account in the database';
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                BankAcc.RESET;
                "Bank Name" := '';
                IF BankAcc.GET("Paying Bank Account") THEN BEGIN
                    "Bank Name" := BankAcc.Name;
                END;
            end;
        }
        field(30; "Global Dimension 1 Code"; Code[30])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(56; "Global Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

        }
        field(35; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"Pending Approval",,Approved,Posted,Cancelled;
        }

        field(59; "Bank Name"; Text[100])
        {
            Description = 'Stores the description of the paying bank account in the database';
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }

        field(66; "Cheque No."; Code[20])
        {
        }
        field(67; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,Mpesa,PDQ;
        }
        field(68; "Payment Release Date"; Date)
        {

        }
        field(80; "Document Type"; Option)
        {
            OptionMembers = "Advance Petty Cash";
        }
        field(85; "Responsibility Center"; Code[50])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center"; //where(Grouping = filter('PETTYCASH'));
        }
        field(86; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            Editable = false;
        }
        field(87; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            Editable = true;
            TableRelation = Customer;
            // TableRelation = IF ("Account Type" = CONST(Customer)) Customer WHERE("Customer Posting Group" = filter('Staff'));

            trigger OnValidate()
            var
                HRMempD: Record "HRM-Employee C";
            begin
                Cust.RESET;
                IF Cust.GET("Account No.") THEN BEGIN
                    Cust.TESTFIELD("Gen. Bus. Posting Group");
                    Cust.TESTFIELD(Blocked, Cust.Blocked::" ");
                    payee := Cust.Name;
                END;

            end;
        }
        field(5; "Invoice No."; Code[20])
        {

        }
        field(88; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
        }
        field(89; Purpose; Text[250])
        {
        }
        field(90; "On behalf of"; text[100])
        {

        }
        Field(91; "Shortcut Dimension 5"; code[20])
        {
            TableRelation = "Dimension Value".code where("Global Dimension No." = filter(5));
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //  IF (Status=Status::Approved) OR (Status=Status::Posted) OR (Status=Status::"Pending Approval")THEN
        //   ERROR('You Cannot Delete this record its status is not Pending');
    end;

    trigger OnInsert()
    begin

        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET;
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Advance Petty Cash");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Advance Petty Cash", xRec."No. Series", 0D, "No.", "No. Series");
            "Account Type" := "Account Type"::Customer;
            "Shortcut Dimension 5" := 'P-CASH';
        END;

        Date := TODAY;
        Cashier := USERID;
        VALIDATE(Cashier);



    end;

    var
        CStatus: Code[20];
        //PVUsers: Record "FIN-CshMgt PV Steps Users";
        UserTemplate: Record "FIN-Cash Office User Template";
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";

        DimVal: Record "Dimension Value";
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        ImpLines: Record "FIN-Imprest Lines";

    var
        Approvalmgt: Codeunit "Init Code";
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';

        RecPayTypes: Record "FIN-Receipts and Payment Types";
        TarriffCodes: Record "FIN-Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Temp: Record "FIN-Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        //PCheck: Codeunit "50110";
        Post: Boolean;

        CheckBudgetAvail: Codeunit "Budgetary Control";
        Commitments: Record "FIN-Committment";
        UserMgt: Codeunit "User Setup Management";
        JournlPosted: Codeunit "Journal Post Successful";

        GenSetup: Record "General Ledger Setup";
        checkAmount: Decimal;
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        Payments: Record "Advance PettyCash Header";
        PettyCashLine: Record "Advance PettyCash Lines";
        EFTHeader: Record "EFT Batch Header";
        EFTline: Record "EFT batch Lines";
        SurrHeader: Record "PettyCash Surrender Header";
        SurrLines: Record "PettyCash Surrender Details";


    procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Advance Petty Cash Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        PettyCashLine.RESET;
        PettyCashLine.SETRANGE("Document No.", Rec."No.");
        PettyCashLine.SETRANGE("Account Type", PettyCashLine."Account Type"::"G/L Account");
        IF PettyCashLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                PettyCashLine.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", PettyCashLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                //DimensionValue.SETRANGE(Code, Rec."Global Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", PettyCashLine."Account No.");
                FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense,
                 FINBudgetEntries."Transaction Type"::Commitment, FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::"Commited/Posted",
               FINBudgetEntries."Commitment Status"::Commitment);

                FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Rec.Date));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (PettyCashLine.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailabilityGlobal(PettyCashLine."Account No.", Rec.Date,
                            PettyCashLine.Amount, PettyCashLine."Account Name", 'ADVPETTY', Rec."No." + PettyCashLine."Account No.", Rec.Payee);
                        END ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name);
                    END;
                END ELSE
                    IF PostBudgetEnties.checkBudgetControl(PettyCashLine."Account No.") THEN ERROR('Missing Budget for  Account:' + GLAccount.Name);
            END;
            UNTIL PettyCashLine.NEXT = 0;
        END;
    end;

    procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Advance Petty Cash Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Global Dimension 2 Code");
        //Get Current Lines to loop through
        PettyCashLine.SETRANGE("Document No.", Rec."No.");
        PettyCashLine.SETRANGE("Account Type", PettyCashLine."Account Type"::"G/L Account");
        IF PettyCashLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                PettyCashLine.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", PettyCashLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Global Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (PettyCashLine.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(PettyCashLine."Account No.", Rec.Date, '', Rec."Global Dimension 2 Code",
                    PettyCashLine.Amount, PettyCashLine."Account Name", USERID, TODAY, 'ADVPETTY', Rec."No." + PettyCashLine."Account No.", Rec.Payee);
                END;
            END;
            UNTIL PettyCashLine.NEXT = 0;
        END;
    end;

    procedure CancelCommitment()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Advance Petty Cash Mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Global Dimension 2 Code");
        //Get Current Lines to loop through
        PettyCashLine.SETRANGE("Document No.", Rec."No.");
        PettyCashLine.SETRANGE("Account Type", PettyCashLine."Account Type"::"G/L Account");
        IF PettyCashLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                PettyCashLine.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", PettyCashLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Global Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (PettyCashLine.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.CancelBudgetCommitment(PettyCashLine."Account No.", Rec.Date, '', Rec."Global Dimension 2 Code",
                    PettyCashLine.Amount, PettyCashLine."Account Name", USERID, 'ADVPETTY', Rec."No." + PettyCashLine."Account No.", Rec.Payee);
                END;
            END;
            UNTIL PettyCashLine.NEXT = 0;
        END;
    end;

    procedure checkBudgetControl(var glAcc: Code[20]) IsBudgetControlled: Boolean
    var
        GLAccount: Record "G/L Account";
    begin
        CLEAR(IsBudgetControlled);
        GLAccount.RESET;
        GLAccount.SETRANGE("No.", glAcc);
        IF GLAccount.FIND('-') THEN;
        IF GLAccount."Budget Controlled" THEN;
        IsBudgetControlled := GLAccount."Budget Controlled";
        //ELSE ERROR('Missing account');
    end;

    procedure PostAdvance()
    begin

        Payments.Reset();
        Payments.SetRange("No.", "No.");
        if Payments.Find('-') then begin
            Payments.CalcFields("Payment Amount");
            PettyCashLine.Reset();
            PettyCashLine.SetRange("Document No.", "No.");
            if PettyCashLine.Find('-') then begin
                Temp.GET(USERID);
                JTemplate := Temp."Petty Cash Template";
                JBatch := Temp."Petty Cash Batch";

                IF JTemplate = '' THEN BEGIN
                    ERROR('Ensure the Petty cash Template is set up in Cash Office Setup');
                END;
                IF JBatch = '' THEN BEGIN
                    ERROR('Ensure the Petty Cash Batch is set up in the Cash Office Setup')
                END;

                // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                GenJnlLine.RESET;
                GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
                GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);
                IF GenJnlLine.FIND('+') THEN BEGIN
                    LineNo := GenJnlLine."Line No." + 1000;
                END
                ELSE BEGIN
                    LineNo := 1000;
                END;
                GenJnlLine.DELETEALL;
                GenJnlLine.RESET;

                GenJnlLine.RESET;
                GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", JTemplate);
                GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", JBatch);

                IF GenJnlLine.FIND('+') THEN BEGIN
                    LineNo := GenJnlLine."Line No." + 1000;
                END
                ELSE BEGIN
                    LineNo := 1000;
                END;


                LineNo := LineNo + 1000;
                GenJnlLine.INIT;
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.VALIDATE(GenJnlLine."Journal Batch Name");
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Posting Date" := payments."Payment Release Date";

                GenJnlLine."Document No." := Payments."No.";
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine."Shortcut Dimension 5" := Payments."Shortcut Dimension 5";
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
                GenJnlLine."Account No." := Payments."Paying Bank Account";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");

                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := Payments."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine.Description := COPYSTR('Pay To:' + Payments.Payee, 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine.Description);
                Payments.CALCFIELDS(Payments."Payment Amount");
                GenJnlLine.Amount := -Payments."Payment Amount";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::Customer;
                GenJnlLine."Bal. Account No." := Payments."Account No.";
                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;
                CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);
                Post := JournlPosted.PostedSuccessfully();
                Rec."Date Posted" := TODAY;
                Rec."Time Posted" := TIME;
                Rec."Posted By" := USERID;
                Post := true;
                Rec.Status := Rec.Status::Posted;
                Rec.MODIFY;
                GenerateSurrender();
            end;


        end;
        // ExpenseBudget();

    end;

    procedure GenerateSurrender()
    var
        Nextno: code[20];
    begin
        Payments.Reset();
        Payments.SetRange("No.", rec."No.");
        if Payments.Find('-') then begin
            PettyCashLine.Reset();
            PettyCashLine.SetRange("Document No.", rec."No.");
            if PettyCashLine.Find('-') then begin
                GenLedgerSetup.GET;
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."Surrender Petty Cash");
                Nextno := NoSeriesMgt.GetNextNo(GenLedgerSetup."Surrender Petty Cash", today, true);
                SurrHeader."No." := Nextno;
                SurrHeader."Surrender Date" := today();
                SurrHeader.Cashier := Rec.Cashier;
                SurrHeader."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                SurrHeader."Global Dimension 2 Code" := Rec."Global Dimension 2 Code";
                SurrHeader."Shortcut Dimension 5" := rec."Shortcut Dimension 5";
                SurrHeader."Account Type" := SurrHeader."Account Type"::Customer;
                SurrHeader."Account No." := Rec."Account No.";
                SurrHeader."Account Name" := Rec.payee;
                SurrHeader.Payee := Rec.payee;
                SurrHeader."Posting Description" := Rec.Purpose;
                SurrHeader."Responsibility Center" := Rec."Responsibility Center";
                SurrHeader."Paying Bank Account" := Rec."Paying Bank Account";
                SurrHeader."Bank Name" := Rec."Bank Name";
                SurrHeader."Advance No." := Rec."No.";
                SurrHeader.Amount := Rec."Payment Amount";
                SurrHeader."On Behalf Of" := rec."On behalf of";
                SurrHeader.Insert();

                SurrLines.init();
                SurrLines."Line No." := SurrLines."Line No." + 1000;
                SurrLines."Surrender No." := Nextno;
                SurrLines."Account Type" := SurrLines."Account Type"::"G/L Account";
                SurrLines."Account No." := PettyCashLine."Account No.";
                SurrLines."Surrender Date" := today();
                SurrLines."Account Name" := PettyCashLine."Account Name";
                SurrLines.amount := PettyCashLine.Amount;
                SurrLines."Advance Holder" := Rec."Account No.";
                SurrLines.Insert();
            end;
            MESSAGE('Advance Surrender No.' + Nextno + ' Generated Successifully');
        end;


    end;


}
