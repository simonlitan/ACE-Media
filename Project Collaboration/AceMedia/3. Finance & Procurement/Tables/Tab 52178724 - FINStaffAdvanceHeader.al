table 52178724 "FIN-Staff Advance Header"
{
    DrillDownPageID = "Staff Advance List";
    LookupPageID = "Staff Advance List";

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
        field(9; Payee; Text[100])
        {
            Description = 'Stores the name of the person who received the money';
        }
        field(10; "On Behalf Of"; Text[100])
        {
            Description = 'Stores the name of the person on whose behalf the payment voucher was taken';
        }
        field(11; Cashier; Code[20])
        {
            Description = 'Stores the identifier of the cashier in the database';
        }
        field(16; Posted; Boolean)
        {
            Editable = false;
            Description = 'Stores whether the payment voucher is posted or not';
        }
        field(17; "Date Posted"; Date)
        {
            Editable = false;
            Description = 'Stores the date when the payment voucher was posted';
            trigger OnValidate()
            begin
                StrValue := 'M';

                if "Repayent Interval" = "Repayent Interval"::Days then begin
                    StrValue := 'D';
                end
                else
                    if "Repayent Interval" = "Repayent Interval"::Weeks then begin
                        StrValue := 'W';
                    end
                    else
                        if "Repayent Interval" = "Repayent Interval"::Months then begin
                            StrValue := 'M';
                        end;

                "Due Date" := CalcDate(Format("Repayent Interval Value") + StrValue, "Date Posted");
                UpdateHeaderToLine;
            end;
        }
        field(18; "Time Posted"; Time)
        {
            Description = 'Stores the time when the payment voucher was posted';
        }
        field(19; "Posted By"; Code[20])
        {
            Description = 'Stores the name of the person who posted the payment voucher';
        }
        field(20; "Total Payment Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line".Amount WHERE(No = FIELD("No.")));
            Description = 'Stores the amount of the payment voucher';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Paying Bank Account"; Code[20])
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
        field(30; "Global Dimension 1 Code"; Code[20])
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
        field(35; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved;

        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Imprest;
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
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
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(59; "Bank Name"; Text[100])
        {
            Description = 'Stores the description of the paying bank account in the database';
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(61; Select; Boolean)
        {
            Description = 'Enables the user to select a particular record';
        }
        field(62; "Total VAT Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line"."VAT Amount" WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(63; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line"."Withholding Tax Amount" WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(64; "Total Net Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Staff Advance Lines".Amount WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
            trigger OnValidate()
            begin
                "Amount Per month" := "Total Net Amount" / "Repayent Interval Value";
            end;
        }
        field(65; "Current Status"; Code[20])
        {
            Description = 'Stores the current status of the payment voucher in the database';
        }
        field(66; "Cheque No."; Code[20])
        {
        }
        field(67; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Letter of Credit","Custom 3","Custom 4","Custom 5";
        }
        field(68; "Payment Release Date"; Date)
        {

            trigger OnValidate()
            begin

                //Changed to ensure Release date is not less than the Date entered
                IF "Payment Release Date" < Date THEN
                    ERROR('The Payment Release Date cannot be lesser than the Document Date');
            end;
        }
        field(69; "No. Printed"; Integer)
        {
        }
        field(70; "VAT Base Amount"; Decimal)
        {
        }
        field(71; "Exchange Rate"; Decimal)
        {
        }
        field(72; "Currency Reciprical"; Decimal)
        {
        }
        field(73; "Current Source A/C Bal."; Decimal)
        {
        }
        field(74; "Cancellation Remarks"; Text[250])
        {
        }
        field(75; "Register Number"; Integer)
        {
        }
        field(76; "From Entry No."; Integer)
        {
        }
        field(77; "To Entry No."; Integer)
        {
        }
        field(78; "Invoice Currency Code"; Code[10])
        {
            Caption = 'Invoice Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(79; "Total Net Amount LCY"; Decimal)
        {
            CalcFormula = Sum("FIN-Staff Advance Lines"."Amount LCY" WHERE("Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(80; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash";
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
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
        field(82; "Shortcut Dimension 4 Code"; Code[20])
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
        field(83; Dim3; Text[250])
        {
        }
        field(84; Dim4; Text[250])
        {
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".CODE WHERE(Grouping = FILTER('ADVANCE'));

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
        field(86; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            Editable = false;
            //OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            //OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(87; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            Editable = true;
            // TableRelation = IF ("Account Type" = CONST(Customer)) Customer;
            TableRelation = customer."No." where("Customer Posting Group" = const('SALARY ADVANCE'));

              trigger OnValidate()
            begin
                Cust.RESET;
                IF Cust.GET("Account No.") THEN BEGIN
                    Cust.TESTFIELD("Gen. Bus. Posting Group");
                    Cust.TESTFIELD(Blocked, Cust.Blocked::" ");
                    Payee := Cust.Name;
                    "On Behalf Of" := Cust.Name;
                    empPeriod.Reset();
                    empPeriod.SetRange(Closed, false);
                    if empPeriod.Find('-') then begin
                        Salary.Reset();
                        Salary.SetRange("Employee Code", "Account No.");
                       // Salary.SetRange("Payroll Period", "Payroll Period");
                        if Salary.FindFirst() then begin
                            rec.Basic := Salary."Basic Pay";
                            rec.Gross := Salary."Gross Pay";
                            rec.NetPay := Salary."Net Pay";
                            Salary.Insert()


                            //Check CreditLimit Here In cases where you have a credit limit set for employees
                            /* Cust.CALCFIELDS(Cust."Balance (LCY)");
                            IF Cust."Balance (LCY)" > Cust."Credit Limit (LCY)" THEN
                                ERROR('The allowable unaccounted balance of %1 has been exceeded', Cust."Credit Limit (LCY)");
         */
                        END;
                    end;
                end;
            end;
        }
        field(88; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
        }
        field(89; Purpose; Text[250])
        {
        }
        field(90; "Commitment Status"; Boolean)
        {
        }
        field(5; "Shortcut Dimension 5"; code[20])
        {
            TableRelation = "Dimension Value".code where("Global Dimension No." = filter(5));
        }
        field(6; "Due Date"; date)
        {
            Editable = false;
        }
        field(7; "Repayent Interval"; Option)
        {

            OptionMembers = Months,Days,Weeks,;

        }
        field(8; "Repayent Interval Value"; Integer)
        {


        }
        field(12; "Transferred to payroll"; boolean)
        {

        }
        field(13; "Amount Per month"; decimal)
        {
            Editable = false;
        }
         field(14; Basic; Integer)
        {

        }
        field(15; Gross; Decimal)
        {
             TableRelation = "PRL-Employee P9 Info"."Gross Pay" WHERE("Employee Code" = FIELD("Account No."));
            Editable = false;

        }
        field(21; NetPay; Decimal)
        {

        }
        field(22; Deductions; Decimal)
        {

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
        IF (Status = Status::Approved) OR (Status = Status::Posted) OR (Status = Status::"Pending Approval") THEN
            ERROR('You Cannot Delete this record its status is not Pending');
    end;

    trigger OnInsert()
    begin


        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET();
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Other Staff Advance No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Other Staff Advance No", xRec."No. Series", 0D, "No.", "No. Series");
            //"Shortcut Dimension 5" := 'S-Advance';

        END;



        Date := TODAY;
        Cashier := USERID;
        VALIDATE(Cashier);

        //
        IF UserSetup.GET(USERID) THEN BEGIN
            UserSetup.TESTFIELD(UserSetup."Imprest Account");
            "Account Type" := "Account Type"::Customer;
            "Account No." := UserSetup."Imprest Account";
            VALIDATE("Account No.");
        END ELSE
            ERROR('User must be setup under User Setup and their respective Account Entered');

    end;

    trigger OnModify()
    begin
        IF Status = Status::Pending THEN
            UpdateHeaderToLine;

        /* IF (Status=Status::Approved) OR (Status=Status::Posted)OR (Status=Status::"Pending Approval") THEN
            ERROR('You Cannot Modify this record its status is not Pending');*/

    end;

    var
        CStatus: Code[20];
        //PVUsers: Record "FIN-CshMgt PV Steps Users";
        UserTemplate: Record "FIN-Cash Office User Template";
        GLAcc: Record "G/L Account";
        Cust: Record "Customer";
        empPeriod: Record "PRL-Payroll Periods";
         Salary: Record "PRL-Employee P9 Info";
        StrValue: Text[1];
        Vend: Record "Vendor";
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        //RecPayTypes: Record "61129";
        //CashierLinks: Record "61055";
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
        GenLedSetup: Record "General Ledger Setup";
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
        //Pline: Record "61593";
        CurrExchRate: Record "Currency Exchange Rate";
        ImpLines: Record "FIN-Imprest Lines";
        UserSetup: Record "User Setup";





    /// <summary>
    /// UpdateHeaderToLine.
    /// </summary>
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
                PayLine."Due Date" := "Due Date";
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

    procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINStaffAdvanceLines: Record "FIN-Staff Advance Lines";
        CommDocNo: Code[100];
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Imprest Budget mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TestField("Global Dimension 1 Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINStaffAdvanceLines.RESET;
        FINStaffAdvanceLines.SETRANGE("Document No.", Rec."No.");
        IF FINStaffAdvanceLines.FIND('-') THEN BEGIN
            REPEAT BEGIN

                Clear(CommDocNo);
                CommDocNo := FINStaffAdvanceLines."Document No." + '-' + FINStaffAdvanceLines."Shortcut Dimension 2 Code" + '-'
                + FINStaffAdvanceLines."Account No." + '-' + Format(FINStaffAdvanceLines."Line No.");

                // Check if budget exists
                FINStaffAdvanceLines.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINStaffAdvanceLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", FINStaffAdvanceLines."Account No.");
                FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment, FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SETFILTER(Date, PostBudgetEnties.GetBudgetStartAndEndDates(Rec.Date));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (FINStaffAdvanceLines.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name + ', ' + DimensionValue.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailability(FINStaffAdvanceLines."Account No.", Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code", FINStaffAdvanceLines.Amount, FINStaffAdvanceLines."Account Name", 'ADVANCE', CommDocNo, Rec.Purpose);
                        END
                        ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name + ', ' + DimensionValue.Name);
                    END;
                END
                ELSE
                    ERROR('Missing Budget for  Account:' + GLAccount.Name + ', ' + DimensionValue.Name);
            END;
            UNTIL FINStaffAdvanceLines.NEXT = 0;
        END;
    end;

    procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINStaffAdvanceLines: Record "FIN-Staff Advance Lines";
        CommDocNo: Code[100];
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Imprest Budget mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINStaffAdvanceLines.RESET;
        FINStaffAdvanceLines.SETRANGE("Document No.", Rec."No.");
        IF FINStaffAdvanceLines.FIND('-') THEN BEGIN
            REPEAT BEGIN

                Clear(CommDocNo);
                CommDocNo := FINStaffAdvanceLines."Document No." + '-' + FINStaffAdvanceLines."Shortcut Dimension 2 Code" + '-'
                + FINStaffAdvanceLines."Account No." + '-' + Format(FINStaffAdvanceLines."Line No.");

                // Expense Budget Here
                FINStaffAdvanceLines.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINStaffAdvanceLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (FINStaffAdvanceLines.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(FINStaffAdvanceLines."Account No.", Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code", FINStaffAdvanceLines.Amount, FINStaffAdvanceLines."Account Name", USERID, TODAY, 'ADVANCE', CommDocNo, Rec.Purpose);
                END;
            END;
            UNTIL FINStaffAdvanceLines.NEXT = 0;
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
        FINStaffAdvanceLines: Record "FIN-Staff Advance Lines";
        CommDocNo: Code[50];
        RevCommNo: Code[50];
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Global Dimension 1 Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINStaffAdvanceLines.RESET;
        FINStaffAdvanceLines.SETRANGE("Document No.", Rec."No.");
        //FINImprestLines.SetRange("Destination Cluster", FINImprestLines."Destination Cluster");
        IF FINStaffAdvanceLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                FINStaffAdvanceLines.TESTFIELD("Account No.");
                FINStaffAdvanceLines.SetFilter("Line No.", '<>%1', 0);
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINStaffAdvanceLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);

                Clear(CommDocNo);
                CommDocNo := FINStaffAdvanceLines."Document No." + '-' + FINStaffAdvanceLines."Shortcut Dimension 2 Code" + '-'
                + FINStaffAdvanceLines."Account No." + '-' + Format(FINStaffAdvanceLines."Line No.");

                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", FINStaffAdvanceLines."Account No.");
                FINBudgetEntries.SetRange("Document No", CommDocNo);
                FINBudgetEntries.DeleteAll();
            END
            UNTIL FINStaffAdvanceLines.NEXT = 0;
        END;
    end;

}
