table 52178720 "FIN-Staff Claims Header"
{
    DrillDownPageID = "FIN-Staff Claims";
    LookupPageID = "FIN-Staff Claims";

    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the reference of the payment voucher in the database';


        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the payment voucher was inserted into the system';

            trigger OnValidate()
            begin

                IF ImpLinesExist THEN BEGIN
                    ERROR('You first need to delete the existing imprest lines before changing the Currency Code'
                    );
                END;

                IF "Currency Code" = xRec."Currency Code" THEN
                    UpdateCurrencyFactor;

                IF "Currency Code" <> xRec."Currency Code" THEN BEGIN
                    UpdateCurrencyFactor;
                    //RecreatePurchLines(FIELDCAPTION("Currency Code"));
                END ELSE
                    IF "Currency Code" <> '' THEN
                        UpdateCurrencyFactor;

                UpdateHeaderToLine;
            end;
        }
        field(3; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(4; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            Enabled = true;
            TableRelation = Currency;

            trigger OnValidate()
            begin

                IF ImpLinesExist THEN BEGIN
                    ERROR('You first need to delete the existing imprest lines before changing the Currency Code'
                    );
                END;

                IF "Currency Code" = xRec."Currency Code" THEN
                    UpdateCurrencyFactor;

                IF "Currency Code" <> xRec."Currency Code" THEN BEGIN
                    UpdateCurrencyFactor;
                    //RecreatePurchLines(FIELDCAPTION("Currency Code"));
                END ELSE
                    IF "Currency Code" <> '' THEN
                        UpdateCurrencyFactor;

                UpdateHeaderToLine;
            end;
        }
        field(5; Payee; Text[100])
        {
            Description = 'Stores the name of the person who received the money';
        }
        field(6; "On Behalf Of"; Text[100])
        {
            Description = 'Stores the name of the person on whose behalf the payment voucher was taken';
        }
        field(7; Cashier; Code[20])
        {
            Description = 'Stores the identifier of the cashier in the database';
        }
        field(8; Posted; Boolean)
        {
            Description = 'Stores whether the payment voucher is posted or not';
        }
        field(9; "Date Posted"; Date)
        {
            Description = 'Stores the date when the payment voucher was posted';
        }
        field(10; "Time Posted"; Time)
        {
            Description = 'Stores the time when the payment voucher was posted';
        }
        field(11; "Posted By"; Code[20])
        {
            Description = 'Stores the name of the person who posted the payment voucher';
        }
        field(12; "Total Payment Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line".Amount WHERE(No = FIELD("No.")));
            Description = 'Stores the amount of the payment voucher';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Paying Bank Account"; Code[20])
        {
            Description = 'Stores the name of the paying bank account in the database';
            TableRelation = "Bank Account"."No." WHERE("Currency Code" = FIELD("Currency Code"));

            trigger OnValidate()
            begin
                BankAcc.RESET;
                "Bank Name" := '';
                IF BankAcc.GET("Paying Bank Account") THEN BEGIN
                    "Bank Name" := BankAcc.Name;
                    // "Currency Code":=BankAcc."Currency Code";   //Currency Being determined first before document is released for approval
                    // VALIDATE("Currency Code");
                END;
            end;
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                DimVal.SETRANGE(DimVal.Code, "Global Dimension 1 Code");
                IF DimVal.FIND('-') THEN
                    "Function Name" := DimVal.Name;

                UpdateHeaderToLine;
            end;
        }
        field(15; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Checking,VoteBook,"Pending Approval",Approved;
        }
        field(16; "Payment Type"; Option)
        {
            OptionMembers = Imprest;
        }
        field(17; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));


            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 2 Code");
                IF DimVal.FIND('-') THEN
                    "Budget Center Name" := DimVal.Name;

                UpdateHeaderToLine;
            end;
        }
        field(18; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(19; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(20; "Bank Name"; Text[100])
        {
            Description = 'Stores the description of the paying bank account in the database';
        }
        field(21; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(22; Select; Boolean)
        {
            Description = 'Enables the user to select a particular record';
        }
        field(23; "Total VAT Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line"."VAT Amount" WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line"."Withholding Tax Amount" WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(25; "Total Net Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Staff Claim Lines".Amount WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Current Status"; Code[20])
        {
            Description = 'Stores the current status of the payment voucher in the database';
        }
        field(27; "Cheque No."; Code[20])
        {
        }
        field(28; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Letter of Credit","Custom 3","Custom 4","Custom 5";
        }
        field(29; "Payment Release Date"; Date)
        {

            trigger OnValidate()
            begin


                //Changed to ensure Release date is not less than the Date entered
                IF "Payment Release Date" < Date THEN
                    ERROR('The Payment Release Date cannot be lesser than the Document Date');
            end;
        }
        field(30; "No. Printed"; Integer)
        {
        }
        field(31; "VAT Base Amount"; Decimal)
        {
        }
        field(32; "Exchange Rate"; Decimal)
        {
        }
        field(33; "Currency Reciprical"; Decimal)
        {
        }
        field(34; "Current Source A/C Bal."; Decimal)
        {
        }
        field(35; "Cancellation Remarks"; Text[250])
        {
        }
        field(36; "Register Number"; Integer)
        {
        }
        field(37; "From Entry No."; Integer)
        {
        }
        field(38; "To Entry No."; Integer)
        {
        }
        field(39; "Invoice Currency Code"; Code[10])
        {
            Caption = 'Invoice Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(40; "Total Net Amount LCY"; Decimal)
        {
            CalcFormula = Sum("FIN-Staff Claim Lines"."Amount LCY" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash";
        }
        field(42; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 3 Code");
                IF DimVal.FIND('-') THEN
                    Dim3 := DimVal.Name;

                UpdateHeaderToLine;
            end;
        }
        field(43; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 4 Code");
                IF DimVal.FIND('-') THEN
                    Dim4 := DimVal.Name;

                UpdateHeaderToLine;
            end;
        }
        field(44; Dim3; Text[250])
        {
        }
        field(45; Dim4; Text[250])
        {
        }
        field(46; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".Code where(Grouping = filter('Claim'));

            trigger OnValidate()
            begin

                TESTFIELD(Status, Status::Pending);
                IF NOT UserMgt.CheckRespCenter(1, "Shortcut Dimension 3 Code") THEN
                    ERROR(
                      Text001,
                      RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter);
                /*
               "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
               IF "Location Code" = '' THEN BEGIN
                 IF InvtSetup.GET THEN
                   "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
               END ELSE BEGIN
                 IF Location.GET("Location Code") THEN;
                 "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
               END;

               UpdateShipToAddress;
                  */
                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(47; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            Editable = true;

            //OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            //OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(48; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            Editable = true;
            // TableRelation = IF ("Account Type" = CONST(Vendor)) Vendor;
            // TableRelation = IF ("Account Type" = CONST(Customer)) Customer where("Customer Posting Group"=filter('Imprest'));
            TableRelation = Customer."No." where("Customer Posting Group" = filter('Imprest'));

            trigger OnValidate()
            begin

                Cust.RESET;
                IF Cust.GET("Account No.") THEN BEGIN
                    Cust.TESTFIELD("Gen. Bus. Posting Group");
                    Cust.TESTFIELD(Blocked, Cust.Blocked::" ");
                    Payee := Cust.Name;
                    // "On Behalf Of" := Cust.Name;
                end;
            end;

            // trigger OnValidate()
            // begin
            //     Vend.RESET;
            //     Vend.SetRange("No.","Account No.");
            //     IF Cust.find('-') THEN BEGIN
            //         Cust.TESTFIELD("Gen. Bus. Posting Group");
            //         Cust.TESTFIELD(Blocked, Cust.Blocked::" ");
            //         Payee := Cust.Name;
            //         "On Behalf Of" := Cust.Name;

            //Check CreditLimit Here In cases where you have a credit limit set for employees
            /*Cust.CALCFIELDS(Cust."Balance (LCY)");
             IF Cust."Balance (LCY)">Cust."Credit Limit (LCY)" THEN
                ERROR('The allowable unaccounted balance of %1 has been exceeded',Cust."Credit Limit (LCY)");*/

            // END;

            //  end;
        }
        field(49; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
        }
        field(50; Purpose; Text[500])
        {
        }
        field(51; "Allow Over Expenditure"; Boolean)
        {
        }
        field(52; "Requested Amount"; Decimal)
        {
        }
        field(53; "Cheque Printed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", "Account No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        IF (Status = Status::Approved) OR (Status = Status::Posted) OR (Status = Status::"Pending Approval") THEN
            ERROR('You Cannot Delete an Approved Record');
    end;

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET;
            IF "Payment Type" = "Payment Type"::Imprest THEN BEGIN
                GenLedgerSetup.TESTFIELD(GenLedgerSetup."Staff Claim No");
                NoSeriesMgt.InitSeries(GenLedgerSetup."Staff Claim No", xRec."No. Series", 0D, "No.", "No. Series");
                "Responsibility Center" := 'FIN:CLM';

            END

        END;
        /*
        UserTemplate.RESET;
        UserTemplate.SETRANGE(UserTemplate.UserID,USERID);
        IF UserTemplate.FINDFIRST THEN
          BEGIN
            "Paying Bank Account":=UserTemplate."Default Payment Bank";
            VALIDATE("Paying Bank Account");
          END;
           */
        "Account Type" := rec."Account Type"::Customer;

        Date := TODAY;
        Cashier := USERID;
        VALIDATE(Cashier);
    end;

    var
        CurBudget: Record "FIN-Budgetary Control Setup";

        emp: record "Customer";
        CStatus: Code[20];
        Claimlines: Record "FIN-Staff Claim Lines";
        //PVUsers: Record "FIN-CshMgt PV Steps Users";
        UserTemplate: Record "FIN-Cash Office User Template";
        GLAcc: Record "G/L Account";
        Cust: Record "Customer";
        Vend: Record "Vendor";
        FA: Record "Fixed Asset";
        Paymenttypes: Record "FIN-Receipts and Payment Types";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        RecPayTypes: Record "FIN-Receipts and Payment Types";
        CashierLinks: Record "FIN-Cash Office User Template";
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
        GenLedSetup: Record "FIN-Cash Office Setup";
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
        //PVSteps: Record "61710";
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Pline: Record "FIN-Imprest Lines";
        CurrExchRate: Record "Currency Exchange Rate";
        ImpLines: Record "FIN-Imprest Lines";
        UserSetup: Record "User Setup";
        Setup: Record "FIN-Cash Office Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        //FINImprestLines: Record "FIN-Imprest Lines";
        BCSetup: Record "FIN-Budgetary Control Setup";
          FINStaffClaimLines: Record "FIN-Staff Claim Lines";

    //[Scope('Internal')]
    procedure UpdateHeaderToLine()
    var
        PayLine: Record "FIN-Imprest Lines";
    begin
        PayLine.RESET;
        PayLine.SETRANGE(PayLine.No, "No.");
        IF PayLine.FIND('-') THEN BEGIN
            REPEAT
                PayLine."Imprest Holder" := "Account No.";
                PayLine."Global Dimension 1 Code" := "Global Dimension 1 Code";
                PayLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                PayLine."Shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
                PayLine."Shortcut Dimension 4 Code" := "Shortcut Dimension 4 Code";
                PayLine."Currency Code" := "Currency Code";
                PayLine."Currency Factor" := "Currency Factor";
                PayLine.VALIDATE("Currency Factor");
                PayLine.MODIFY;
            UNTIL PayLine.NEXT = 0;
        END;
    end;

    local procedure UpdateCurrencyFactor()
    var
        CurrencyDate: Date;
    begin
        IF "Currency Code" <> '' THEN BEGIN
            CurrencyDate := Date;
            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        END ELSE
            "Currency Factor" := 0;
    end;

    procedure ImpLinesExist(): Boolean
    begin
        ImpLines.RESET;
        ImpLines.SETRANGE(No, "No.");
        EXIT(ImpLines.FINDFIRST);
    end;

    // procedure CommitBudget()
    // var
    //     GLAccount: Record "G/L Account";
    //     DimensionValue: Record "Dimension Value";
    //     PostBudgetEnties: Codeunit "Post Budget Enties";
    //     BCSetup: Record "FIN-Budgetary Control Setup";
    //     FINBudgetEntries: Record "FIN-Budget Entries";
    //     FINStaffClaimLines: Record "FIN-Staff Claim Lines";
    //     CommDocNo: Code[100];
    // begin
    //     BCSetup.GET;
    //     IF NOT ((BCSetup.Mandatory)) THEN EXIT;
    //     BCSetup.TESTFIELD("Current Budget Code");
    //      Rec.TESTFIELD("Shortcut Dimension 2 Code");
    //     Rec.TestField("Global Dimension 1 Code");
    //     //Get Current Lines to loop through
    //     FINStaffClaimLines.RESET;
    //     FINStaffClaimLines.SETRANGE("Document No.", Rec."No.");
    //     IF FINStaffClaimLines.FIND('-') THEN BEGIN
    //         REPEAT
    //         BEGIN

    //             Clear(CommDocNo);
    //             CommDocNo := FINStaffClaimLines."Document No." + '-' + FINStaffClaimLines."Shortcut Dimension 2 Code" + '-'
    //             + FINStaffClaimLines."Account No.";
    //             // Check if budget exists
    //             FINStaffClaimLines.TESTFIELD("Account No.");
    //             GLAccount.RESET;
    //             GLAccount.SETRANGE("No.", FINStaffClaimLines."Account No.");
    //             IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
    //             DimensionValue.RESET;
    //             DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
    //             DimensionValue.SETRANGE("Global Dimension No.", 2);
    //             IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
    //             FINBudgetEntries.RESET;
    //             FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
    //             FINBudgetEntries.SETRANGE("G/L Account No.", FINStaffClaimLines."Account No.");
    //             FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
    //             FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
    //             FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
    //             , FINBudgetEntries."Transaction Type"::Allocation);
    //              FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::"Commited/Posted",
    //             FINBudgetEntries."Commitment Status"::Commitment);
    //             FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Rec.Date));
    //             IF FINBudgetEntries.FIND('-') THEN BEGIN
    //                 IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
    //                     IF FINBudgetEntries.Amount > 0 THEN BEGIN
    //                         IF (FINStaffClaimLines.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
    //                         // Commit Budget Here
    //                         PostBudgetEnties.CheckBudgetAvailability(FINStaffClaimLines."Account No.", Rec.Date, rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code",
    //                         FINStaffClaimLines.Amount, FINStaffClaimLines."Account Name",
    //                          'CLAIM', CommDocNo, Rec.Purpose);
    //                     END ELSE
    //                         ERROR('No allocation for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
    //                 END;
    //             END ELSE
    //                 ERROR('Missing Budget for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
    //         END;
    //         UNTIL FINStaffClaimLines.NEXT = 0;
    //     END;
    // end;
    procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.Get;
        if not ((BCSetup.Mandatory) and (BCSetup."Claims Budget mandatory")) then exit;
        // BCSetup.TestField("Current Budget Code");
        // Rec.TestField("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINStaffClaimLines.Reset;
        FINStaffClaimLines.SetRange("Document No.", Rec."No.");
        if FINStaffClaimLines.Find('-') then begin
            repeat
            begin
                // Check if budget exists
                FINStaffClaimLines.TestField("Account No.");
                GLAccount.Reset;
                GLAccount.SetRange("No.", FINStaffClaimLines."Account No.");
                if GLAccount.Find('-') then GLAccount.TestField(Name);
                DimensionValue.Reset;
                DimensionValue.SetRange(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SetRange("Global Dimension No.", 2);
                if DimensionValue.Find('-') then DimensionValue.TestField(Name);
                FINBudgetEntries.Reset;
                FINBudgetEntries.SetRange("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SetRange("G/L Account No.", FINStaffClaimLines."Account No.");
                FINBudgetEntries.SetRange("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                FINBudgetEntries.SetFilter("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
                , FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SetFilter("Commitment Status", '%1|%2',
                FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SetFilter(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Rec.Date));
                if FINBudgetEntries.Find('-') then begin
                    if FINBudgetEntries.CalcSums(Amount) then begin
                        if FINBudgetEntries.Amount > 0 then begin
                            if (FINStaffClaimLines.Amount > FINBudgetEntries.Amount) then Error('Less Funds, Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailability(FINStaffClaimLines."Account No.", Rec.Date, '', Rec."Shortcut Dimension 2 Code",
                            FINStaffClaimLines.Amount, FINStaffClaimLines."Account Name", 'CLAIM', Rec."No." + FINStaffClaimLines."Account No.", Rec.Purpose);
                        end else
                            Error('No allocation for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
                    end;
                end else
                    Error('Missing Budget for  Account:' + GLAccount.Name + ', Department:' + DimensionValue.Name);
            end;
            until FINStaffClaimLines.Next = 0;
        end;
    end;
    procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINStaffClaimLines: Record "FIN-Staff Claim Lines";
        CommDocNo: Code[100];
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Claims Budget mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        // Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //  Rec.TestField("Global Dimension 1 Code");
        //Get Current Lines to loop through
        FINStaffClaimLines.RESET;
        FINStaffClaimLines.SETRANGE("Document No.", Rec."No.");
        IF FINStaffClaimLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                Clear(CommDocNo);
                CommDocNo := FINStaffClaimLines."Document No." + '-' + FINStaffClaimLines."Shortcut Dimension 2 Code" + '-'
                + FINStaffClaimLines."Account No." + '-' + Format(FINStaffClaimLines."Line No.");
                // Expense Budget Here
                FINStaffClaimLines.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINStaffClaimLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (FINStaffClaimLines.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(FINStaffClaimLines."Account No.", Rec.Date, Rec."Global Dimension 1 Code",
                    Rec."Shortcut Dimension 2 Code", FINStaffClaimLines.Amount,
                    FINStaffClaimLines."Account Name", USERID, TODAY, 'CLAIM',
                    CommDocNo, Rec.Purpose);
                END;
            END;
            UNTIL FINStaffClaimLines.NEXT = 0;
        END;
    end;



    procedure ReverseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        GenSetup: Record "General Ledger Setup";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINStaffClaimLines: Record "FIN-Staff Claim Lines";
        CommDocNo: Code[50];
        RevCommNo: Code[50];
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        // Rec.TESTFIELD("Global Dimension 1 Code");
        // Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINStaffClaimLines.RESET;
        FINStaffClaimLines.SETRANGE("Document No.", Rec."No.");
        //FINImprestLines.SetRange("Destination Cluster", FINImprestLines."Destination Cluster");
        IF FINStaffClaimLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                FINStaffClaimLines.TESTFIELD("Account No.");
                FINStaffClaimLines.SetFilter("Line No.", '<>%1', 0);
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINStaffClaimLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);

                Clear(CommDocNo);
                CommDocNo := FINStaffClaimLines."Document No." + '-' + FINStaffClaimLines."Shortcut Dimension 2 Code" + '-'
                + FINStaffClaimLines."Account No." + '-' + Format(FINStaffClaimLines."Line No.");

                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", FINStaffClaimLines."Account No.");
                FINBudgetEntries.SetRange("Document No", CommDocNo);
                FINBudgetEntries.DeleteAll();
            END
            UNTIL FINStaffClaimLines.NEXT = 0;
        END;
    end;

}
