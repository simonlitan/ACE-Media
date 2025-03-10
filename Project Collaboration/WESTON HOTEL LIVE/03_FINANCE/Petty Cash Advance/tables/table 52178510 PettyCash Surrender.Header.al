table 52178510 "PettyCash Surrender Header"
{
    DrillDownPageId = "Petty Cash Surrender List";
    LookupPageId = "Petty Cash Surrender List";

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin

                IF "No." <> xRec."No." THEN BEGIN
                    GenLedgerSetup.GET;
                    NoSeriesMgt.TestManual(GenLedgerSetup."Surrender Petty Cash");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Surrender Date"; Date)
        {
        }
        field(3; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = Customer."No." WHERE("Customer Posting Group" = filter('Imprest'));

            trigger OnValidate()
            begin


            end;
        }
        field(5; "Account Name"; Text[150])
        {
        }
        field(6; "Advance No."; Code[20])
        {
            TableRelation = "Advance PettyCash Header"."No." WHERE("Account No." = FIELD("Account No."));

            trigger OnValidate()
            begin

                /*Copy the details from the payments header tableto the imprest surrender table to enable the user work on the same document*/
                /*Retrieve the header details using the get statement*/

                PayHeader.RESET;
                PayHeader.GET(Rec."Advance No.");

                /*Copy the details to the user interface*/
                "Paying Bank Account" := PayHeader."Paying Bank Account";
                Payee := PayHeader.Payee;
                PayHeader.CALCFIELDS(PayHeader."Payment Amount");
                Amount := PayHeader."Payment Amount";
                PayHeader."On behalf of" := rec."On Behalf Of";

                "Date Posted" := PayHeader."Date Posted";
                "Global Dimension 1 Code" := PayHeader."Global Dimension 1 Code";
                VALIDATE("Global Dimension 1 Code");
                "Global Dimension 2 Code" := PayHeader."Global Dimension 2 Code";
                VALIDATE("Global Dimension 2 Code");
                "Posting Date" := PayHeader.Date;

                /*Copy the detail lines from the imprest details table in the database*/
                PayLine.RESET;
                PayLine.SETRANGE(PayLine."Document No.", "Advance No.");
                IF PayLine.FIND('-') THEN /*Copy the lines to the line table in the database*/
                  BEGIN
                    REPEAT
                        AdvanceLine.INIT;
                        AdvanceLine."Line No." := AdvanceLine."Line No." + 1000;
                        AdvanceLine."Surrender No." := Rec."No.";
                        AdvanceLine."Account No." := PayLine."Account No.";
                        AdvanceLine.VALIDATE(AdvanceLine."Account No.");
                        AdvanceLine."Account Name" := PayLine."Account Name";
                        AdvanceLine.Amount := PayLine.Amount;
                        AdvanceLine."Advance Holder" := PayLine."Petty Cash Holder";
                        PayLine.Amount := PayHeader."Payment Amount";
                        AdvanceLine.INSERT;
                    UNTIL PayLine.NEXT = 0;
                END;
            end;
        }
        field(8; Cashier; Code[20])
        {
        }

        field(10; Amount; Decimal)
        {
        }
        field(21; "Posting Description"; Text[250])
        {
        }
        field(28; "Paying Bank Account"; Code[20])
        {
        }
        field(29; Payee; Text[100])
        {
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(31; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }

        field(35; Status; Option)
        {
            caption = 'Status';
            OptionMembers = Pending,"Pending Approval",Approved,Posted;
        }
        field(36; "Bank Name"; Text[100])
        {

        }

        field(44; "Posting Date"; Date)
        {
        }
        field(87; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center"."Code" WHERE(Grouping = FILTER('PCASHSURR'));
        }

        field(50006; "Cash Receipt No"; Code[20])
        {
            CalcFormula = Lookup("FIN-Imprest Surrender Details"."Cash Receipt No" WHERE("Surrender Doc No." = FIELD("No.")));
            FieldClass = FlowField;
            TableRelation = "FIN-Receipts Header"."No." WHERE(Posted = FILTER('Yes'));
        }

        field(16; Posted; Boolean)
        {
        }
        field(17; "Date Posted"; Date)
        {
        }
        field(18; "Time Posted"; Time)
        {
        }
        field(19; "Posted By"; Code[20])
        {
        }
        field(45; Surrendered; Boolean)
        {
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(20; "On Behalf Of"; Text[100])
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
        IF Status = Status::Posted THEN
            ERROR('Cannot Delete Document is already Posted');
    end;

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET;
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Surrender Petty Cash");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Surrender Petty Cash", xRec."No. Series", 0D, "No.", "No. Series");
        END;

        "Account Type" := "Account Type"::Customer;
        "Surrender Date" := TODAY;
        "Shortcut Dimension 5" := 'P-CASH';
        Cashier := USERID;
        VALIDATE(Cashier);
    end;

    trigger OnModify()
    begin
        IF Status = Status::Posted THEN
            ERROR('Cannot Modify Document is already Posted');
    end;

    var
        AdvanceLine: Record "PettyCash Surrender Details";
        PayHeader: Record "Advance PettyCash Header";
        PayLine: Record "Advance PettyCash Lines";
        "Withholding Tax Code": Code[200];
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        RecPayTypes: Record "FIN-Receipts and Payment Types";
        //CashierLinks: Record "FIN-Cash Office User Template";
        GLAccount: Record "G/L Account";
        EntryNo: Integer;
        SingleMonth: Boolean;
        DateFrom: Date;
        DateTo: Date;
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        BudgetDate: Date;
        YrBudget: Decimal;
        BudgetDateTo: Date;
        BudgetAvailable: Decimal;
        //GenLedSetup: Record "FIN-Cash Office Setup";
        "Total Budget": Decimal;
        CommittedAmount: Decimal;
        MonthBudget: Decimal;
        Expenses: Decimal;
        Header: Text[250];
        "Date From": Text[30];
        "Date To": Text[30];
        LastDay: Date;
        TotAmt: Decimal;
        DimVal: Record "Dimension Value";
        "VAT Code": Code[20];
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        PaymentsH: Record "FIN-Payments Header";

    var
        CStatus: Code[20];
        //PVUsers: Record "FIN-CshMgt PV Steps Users";
        UserTemplate: Record "FIN-Cash Office User Template";

        CurrExchRate: Record "Currency Exchange Rate";
        ImpLines: Record "FIN-Imprest Lines";

    var
        Approvalmgt: Codeunit "Init Code";
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
        Payments: Record "PettyCash Surrender Header";
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

        JournlPosted: Codeunit "Journal Post Successful";
        GenSetup: Record "General Ledger Setup";
        checkAmount: Decimal;
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        PettyCashsurrLine: Record "PettyCash Surrender Details";
        EFTHeader: Record "EFT Batch Header";
        EFTline: Record "EFT batch Lines";

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
        PettyCashsurrLine.SETRANGE("Surrender No.", Rec."No.");
        PettyCashsurrLine.SETRANGE("Account Type", PettyCashsurrLine."Account Type"::"G/L Account");
        IF PettyCashsurrLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                PettyCashsurrLine.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", PettyCashsurrLine."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Global Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (PettyCashsurrLine.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(PettyCashsurrLine."Account No.", Rec."Surrender Date", '', Rec."Global Dimension 2 Code",
                    PettyCashsurrLine."Actual Spent", PettyCashsurrLine."Account Name", USERID, TODAY, 'ADVPETTY', Rec."Advance No." + PettyCashsurrLine."Account No.", Rec.Payee);
                END;
            END;
            UNTIL PettyCashsurrLine.NEXT = 0;
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

    procedure PostAdvanceSurrender()
    var
        PaymentLines: Record "PettyCash Surrender Details";
    begin
        payments.Reset();
        payments.SetRange("No.", "No.");
        if payments.Find('-') then begin
            PaymentLines.Reset();
            PaymentLines.SetRange("Surrender No.", "No.");
            if PaymentLines.Find('-') then begin

                ExpenseBudget();
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
                GenJnlLine."Posting Date" := payments."Posting Date";

                GenJnlLine."Document No." := Payments."No.";

                GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
                GenJnlLine."Account No." := Payments."Account No.";
                GenJnlLine.VALIDATE(GenJnlLine."Account No.");

                GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := Payments."Global Dimension 1 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");

                GenJnlLine.Description := COPYSTR('Surrender By:' + Payments.Payee, 1, 50);
                GenJnlLine.VALIDATE(GenJnlLine.Description);
                //Payments.CALCFIELDS(Payments.Amount);
                GenJnlLine.Amount := -Payments."Amount";
                GenJnlLine.VALIDATE(GenJnlLine.Amount);

                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No." := PaymentLines."Account No.";
                IF GenJnlLine.Amount <> 0 THEN
                    GenJnlLine.INSERT;

                CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);
                Post := JournlPosted.PostedSuccessfully();
                Rec."Date Posted" := TODAY;
                Rec."Time Posted" := TIME;
                Rec."Posted By" := USERID;
                Rec.Status := Rec.Status::Posted;
                Rec.MODIFY;

            end;


        end;

    end;
}