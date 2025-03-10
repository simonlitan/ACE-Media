table 52178708 "FIN-Imprest Header"
{
    DrillDownPageID = "FIN-Travel Advance Requisition";
    LookupPageID = "FIN-Travel Advance Requisition";

    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the reference of the payment voucher in the database';
            NotBlank = false;
        }
        field(8; "Project Memo No"; code[30])
        {

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
        field(10;   "On Behalf Of"; Text[100])
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
            Description = 'Stores the time when the payment voucher was posted';
        }
        field(19; "Posted By"; Code[20])
        {
            Description = 'Stores the name of the person who posted the payment voucher';
        }
        field(20; "Total Payment Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Imprest Lines".Amount WHERE(No = FIELD("No.")));
            Description = 'Stores the amount of the payment voucher';
            Editable = false;

        }
        field(21; "Paying Bank Account"; Code[20])
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
        field(22; "Global Dimension 1 Code"; Code[30])
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
        field(23; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"Pending Approval",,Approved,Posted,Archive;
        }
        field(24; "Payment Type"; Option)
        {
            OptionMembers = Imprest;
        }
        field(26; "Shortcut Dimension 2 Code"; Code[80])
        {
            CaptionClass = '1,1,2';
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
        field(27; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(28; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(29; "Bank Name"; Text[100])
        {
            Description = 'Stores the description of the paying bank account in the database';
        }
        field(30; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(31; Select; Boolean)
        {
            Description = 'Enables the user to select a particular record';
        }
        field(32; "Total VAT Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line"."VAT Amount" WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line"."Withholding Tax Amount" WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(34; "Total Net Amount"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Lines".Amount WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(35; "Current Status"; Code[20])
        {
            Description = 'Stores the current status of the payment voucher in the database';
        }
        field(36; "Cheque No."; Code[20])
        {
        }
        field(37; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Letter of Credit","Custom 3","Custom 4","Custom 5";
        }
        field(38; "Payment Release Date"; Date)
        {

            trigger OnValidate()
            begin

                //Changed to ensure Release date is not less than the Date entered
                IF "Payment Release Date" <> 0D THEN
                    "Surrender By" := calcdate('7D', "Payment Release Date")


            end;
        }
        field(39; "No. Printed"; Integer)
        {
        }
        field(40; "VAT Base Amount"; Decimal)
        {
        }
        field(41; "Exchange Rate"; Decimal)
        {
        }
        field(42; "Currency Reciprical"; Decimal)
        {
        }
        field(43; "Current Source A/C Bal."; Decimal)
        {
        }
        field(44; "Cancellation Remarks"; Text[250])
        {
        }
        field(45; "Register Number"; Integer)
        {
        }
        field(46; "From Entry No."; Integer)
        {
        }
        field(47; "To Entry No."; Integer)
        {
        }
        field(48; "Invoice Currency Code"; Code[10])
        {
            Caption = 'Invoice Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(49; "Total Net Amount LCY"; Decimal)
        {
            CalcFormula = Sum("FIN-Payment Line".Amount WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash";
        }
        field(51; "Shortcut Dimension 3 Code"; Code[80])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';

            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 3 Code");
                IF DimVal.FIND('-') THEN begin
                    Dim3 := DimVal.Name;
                    if rec."Shortcut Dimension 3" = '' then
                        rec."Shortcut Dimension 3" := "Shortcut Dimension 3 Code";
                end;


                UpdateHeaderToLine;
            end;
        }
        field(52; "Shortcut Dimension 4 Code"; Code[80])
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
        field(53; Dim3; Text[250])
        {
        }
        field(54; Dim4; Text[250])
        {
        }
        field(55; "Responsibility Center"; Code[50])
        {
            Editable = false;
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".code where(Grouping = filter('IMPREST'));

            trigger OnValidate()
            begin

                TESTFIELD(Status, Status::Pending);
                IF NOT UserMgt.CheckRespCenter(1, "Responsibility Center") THEN
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
        field(56; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            Editable = false;


            //OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            //OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(57; "Account No."; Code[50])
        {
            Caption = 'Account No.';
            Editable = true;
            TableRelation = IF ("Account Type" = filter(Customer)) Customer."No." WHERE("Customer Posting Group" = filter('IMPREST'));


            trigger OnValidate()
            var
                HRMempD: Record "HRM-Employee C";
            begin
                Cust.RESET;
                IF Cust.GET("Account No.") THEN BEGIN
                    Cust.TESTFIELD("Gen. Bus. Posting Group");
                    Cust.TESTFIELD(Blocked, Cust.Blocked::" ");
                    Payee := Cust.Name;
                    "On Behalf Of" := Cust.Name;
                    HRMempD.Reset();
                    HRMempD.SetRange("No.", "Account No.");
                    if HRMempD.FindFirst() then begin
                        Rec."payees bank name" := HRMempD."Main Bank Name";
                        Rec."payees bank code" := HRMempD."Main Bank";
                        Rec."payees Branch code" := HRMempD."Branch Bank";
                        Rec."payees  branch name" := HRMempD."Branch Bank Name";
                        Rec."payees bank account" := HRMempD."Bank Account Number";
                        Rec."Mobile No" := HRMempD."Work Phone Number";
                        rec."Mobile No" := HRMempD."Home Phone Number";
                        Rec."Job Title" := HRMempD."Job Title";
                        rec."Salary Grade" := HRMempD."Salary Grade";
                    end;
                END;





            end;
        }
        field(7; "Salary Grade"; code[50])
        {

        }
        field(58; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
        }
        field(59; Purpose; Text[80])
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "No." <> '' then
                    TestField(Purpose)
                else
                    Message('Purpose must not be Empty');

            end;
        }
        field(60; "Payment Voucher No"; Code[20])
        {
            Caption = 'Memo No';
        }
        field(61; "Serial No."; Code[20])
        {
        }
        field(77; "G/L Account"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("FIN-Imprest Lines"."Account No." where(No = field("No.")));
        }
        field(62; "Budgeted Amount"; Decimal)
        {
            Editable = false;
        }
        field(63; "Actual Expenditure"; Decimal)
        {
            Editable = false;
        }
        field(64; "Committed Amount"; Decimal)
        {
            Editable = false;
        }
        field(65; "Budget Balance"; Decimal)
        {
            Editable = false;



        }
        field(66; "Requested By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(67; "Cheque Printed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Employee No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(69; "payees bank name"; Text[100])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(70; "payees  branch name"; Text[100])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(71; "payees bank account"; code[50])
        {

        }
        field(72; "payees bank code"; code[20])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";
            trigger OnValidate()
            begin
                Bankstructure.Reset();
                Bankstructure.SetRange("Bank Code", "payees bank code");
                if Bankstructure.FindFirst() then
                    "payees bank name" := Bankstructure."Bank Name";

            end;



        }
        field(73; "payees Branch code"; code[20])
        {
            TableRelation = "PRL-Bank Structure"."Branch Code";
            trigger OnValidate()

            begin
                Bankstructure.Reset();
                Bankstructure.SetRange("Bank Code", "payees bank code");
                Bankstructure.setrange("Branch Code", "payees Branch code");
                if Bankstructure.FindFirst() then
                    "payees  branch name" := Bankstructure."branch name";

            end;
        }
        field(74; "Mobile No"; code[20])
        {

        }
        field(75; "Job Title"; Text[2048])
        {

        }
        field(76; "Memo No."; code[30])
        {
            Editable = false;
        }
        field(5; "Shortcut Dimension 3"; code[80])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                Rec."Shortcut Dimension 3 Code" := Rec."Shortcut Dimension 3";
                Rec.Validate("Shortcut Dimension 3 Code");
            end;
        }
        field(6; "Shortcut dimension 4"; code[80])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        Field(91; "Shortcut Dimension 5"; code[80])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".code where("Global Dimension No." = filter(5));
        }
        field(12; Region; text[50])
        {

        }
        field(13; "Surrendered amount"; decimal)
        {

        }
        field(14; "Surrender No"; code[30])
        {

        }
        field(15; "Surrender date"; date)
        {

        }
        field(25; "Surrender By"; date)
        {

        }
        field(78; "Period Frequency"; Option)
        {

            OptionMembers = Days;
            trigger OnValidate()
            var
                Datefom: DateFormula;
                FreqPeriod: Integer;
            begin
                case "Period Frequency" of
                    "Period Frequency"::Days:
                        begin
                            Evaluate(Datefom, Format('1D'));
                            FreqPeriod := 1;
                        end;



                end;
                TestField("Start Date");
            end;
        }
        field(79; "Duration Period"; Integer)
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // TestField("Period Frequency");
                if "Period Frequency" = "Period Frequency"::Days then begin
                    //if "Duration Period" >= 12 then Error('Duration Period should not exceed 30D');
                    "Ending Date" := CalcDate(Format("Duration Period") + 'D', "Start Date");
                end

            end;
        }
        field(80; "Ending Date"; Date)
        {
            Caption = 'End Date';
        }
        field(81; "Start Date"; Date)
        {

        }
        field(82; "Time Stamp"; DateTime) { }




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
    var
        HrmEmp: Record "HRM-Employee C";
    begin


        //  if ImpHeader."Surrender Status" = ImpHeader."Surrender Status"::Full then
        //  Error('Some pending unsurrender Imprest');
        //    ImpHeader.Reset();
        //     ImpHeader.Get("Surrender Status"::Partial);
        IF "No." = '' THEN BEGIN

            GenLedgerSetup.GET;
            //IF "Payment Type" = "Payment Type"::Imprest THEN BEGIN
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Imprest Req No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Imprest Req No", xRec."No. Series", 0D, "No.", "No. Series");
            Date := TODAY;
            "Period Frequency" := "Period Frequency"::Days;
            "Account Type" := rec."Account Type"::Customer;
            "Time Stamp" := System.CreateDateTime(Today, time);



            Cashier := USERID;
            "Requested By" := USERID;
            "Responsibility Center" := 'Imp';
            // "Global Dimension 1 Code" := 'NAKS';
            // "Shortcut Dimension 2 Code" := 'NAKS';


            VALIDATE(Cashier);
            Validate("Requested By");
            Validate("Global Dimension 1 Code");
            Validate("Shortcut Dimension 2 Code");


            //HrmEmp.Reset();
            //  HrmEmp.Get(HrmEmp.Grade);
            //  "Salary Grade" := HrmEmp.Grade;



        END;





        // if "Surrender Status" = "Surrender Status"::Partial then begin


    end;


    /*
    UserTemplate.RESET;
    UserTemplate.SETRANGE(UserTemplate.UserID,USERID);
    IF UserTemplate.FINDFIRST THEN
      BEGIN
        "Paying Bank Account":=UserTemplate."Default Payment Bank";
        VALIDATE("Paying Bank Account");
      END;
       */



    //{
    /*IF UserSetup.GET(USERID)THEN BEGIN
    "Account Type":="Account Type"::Customer;
    "Account No.":=UserSetup."Staff No";
    "Shortcut Dimension 2 Code":=UserSetup.Department;
    "Global Dimension 1 Code" :=UserSetup."Campus Code";
    //"Responsibility Center"

    VALIDATE("Account No.");
    END ELSE
    ERROR('You have not been created as an imprest user...\Consult the Finance department for guidance.');*/
    //"Responsibility Center":='KARU';

    //"Budget Name":=GenLedgerSetup."Current Budget";
    //MODIFY;



    trigger OnModify()
    begin
        IF Status = Status::Pending THEN
            UpdateHeaderToLine;

        //  IF (Status<>Status::Pending) OR (Status=Status::Posted)OR (Status=Status::"Pending Approval") THEN
        //   ERROR('You Cannot Modify this record its status is not Pending');
    end;

    var
        Bankstructure: record "PRL-Bank Structure";
        CStatus: Code[20];
        ImpHeader: Record "FIN-Imprest Header";
        //PVUsers: Record "FIN-CshMgt PV Steps Users";
        UserTemplate: Record "FIN-Cash Office User Template";
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        //RecPayTypes: Record "FIN-Receipts and Payment Types";
        //CashierLinks: Record "FIN-Cashier Link";
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
        //GenLedSetup: Record "98";
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
        //PVSteps: Record "FIN-CshMgt PV Process Road";
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        //Pline: Record "FIN-Payment Line";
        CurrExchRate: Record "Currency Exchange Rate";
        ImpLines: Record "FIN-Imprest Lines";

        Setup: Record "FIN-Cash Office Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINImprestLines: Record "FIN-Imprest Lines";
        BCSetup: Record "FIN-Budgetary Control Setup";
    //UserSetup: Record "User Setup";


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
                //PayLine."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
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
        ImpLines.SETRANGE(ImpLines.No, "No.");
        EXIT(ImpLines.FINDFIRST);
    end;

    procedure CommitBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TestField("Global Dimension 1 Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINImprestLines.RESET;
        FINImprestLines.SETRANGE(No, Rec."No.");
        IF FINImprestLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists

                FINImprestLines.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINImprestLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);

                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", FINImprestLines."Account No.");
                FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
                , FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::"Commited/Posted",
                FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SetFilter("Date", PostBudgetEnties.GetBudgetStartAndEndDates(Rec."Date"));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    //Message(Format(Rec."Shortcut Dimension 2 Code"));
                    IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                        IF FINBudgetEntries.Amount > 0 THEN BEGIN
                            IF (FINImprestLines.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name);
                            // Commit Budget Here
                            PostBudgetEnties.CheckBudgetAvailability(FINImprestLines."Account No.", Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code",
                            FINImprestLines.Amount, FINImprestLines."Account Name",
                            'IMPREST', Rec."No." + FINImprestLines."Account No.", Rec.Purpose);//+ FINImprestLines."Account No." + '-' + format(FINImprestLines."Line No.")
                        END ELSE
                            ERROR('No allocation for  Account:' + GLAccount.Name);
                    END;
                END ELSE
                    IF PostBudgetEnties.checkBudgetControl(FINImprestLines."Account No.") THEN
                        ERROR('Missing Budget for  Account:' + GLAccount.Name);
            END;
            UNTIL FINImprestLines.NEXT = 0;
        END;
    end;

    procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Imprest Budget mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        Rec.TestField("Shortcut Dimension 3");
        //Get Current Lines to loop through
        FINImprestLines.RESET;
        FINImprestLines.SETRANGE(No, Rec."No.");
        IF FINImprestLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Expense Budget Here
                FINImprestLines.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINImprestLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (FINImprestLines.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudgetGlobal(FINImprestLines."Account No.", Rec.Date,
                    FINImprestLines.Amount, FINImprestLines."Account Name", USERID, TODAY, 'IMPREST', Rec."No." + FINImprestLines."Account No.", Rec.Purpose);
                END;
            END;
            UNTIL FINImprestLines.NEXT = 0;
        END;
    end;

    procedure CancelCommitment()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) AND (BCSetup."Imprest Budget mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINImprestLines.RESET;
        FINImprestLines.SETRANGE(No, Rec."No.");
        IF FINImprestLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN

                FINImprestLines.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINImprestLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Shortcut Dimension 2 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 1);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (FINImprestLines.Amount > 0) THEN BEGIN
                    // deCommit Budget Here //
                    PostBudgetEnties.CancelBudgetCommitment(FINImprestLines."Account No.", Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code", '',
                             FINImprestLines.Amount, FINImprestLines."Account Name",
                            USERID, 'IMPREST', Rec."No.", Rec.Purpose);
                END;
            END;
            UNTIL FINImprestLines.NEXT = 0;
        END;
    end;

    procedure Decommit()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TestField("Global Dimension 1 Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINImprestLines.RESET;
        FINImprestLines.SETRANGE(No, Rec."No.");
        IF FINImprestLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists

                FINImprestLines.TESTFIELD("Account No.");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINImprestLines."Account No.");
                IF GLAccount.FIND('-') THEN
                    GLAccount.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", FINImprestLines."Account No.");
                FINBudgetEntries.SETRANGE("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                FINBudgetEntries.SETRANGE("Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                FINBudgetEntries.SETFILTER("Transaction Type", '%1|%2|%3', FINBudgetEntries."Transaction Type"::Expense, FINBudgetEntries."Transaction Type"::Commitment
                , FINBudgetEntries."Transaction Type"::Allocation);
                FINBudgetEntries.SETFILTER("Commitment Status", '%1|%2|%3', FINBudgetEntries."Commitment Status"::" ", FINBudgetEntries."Commitment Status"::"Commited/Posted",
                FINBudgetEntries."Commitment Status"::Commitment);
                FINBudgetEntries.SetFilter("Date", PostBudgetEnties.GetBudgetStartAndEndDates(Rec."Date"));
                IF FINBudgetEntries.FIND('-') THEN BEGIN
                    //Message(Format(Rec."Shortcut Dimension 2 Code"));
                    // IF FINBudgetEntries.CALCSUMS(Amount) THEN BEGIN
                    // IF FINBudgetEntries.Amount > 0 THEN BEGIN
                    // IF (FINImprestLines.Amount > FINBudgetEntries.Amount) THEN ERROR('Less Funds, Account:' + GLAccount.Name);
                    // Commit Budget Here
                    PostBudgetEnties.Decommit(FINImprestLines."Account No.", Rec.Date, Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code",
                    FINImprestLines.Amount, FINImprestLines."Account Name", 'CANCEL IMPREST', Rec."No.", Rec.Purpose);//+ FINImprestLines."Account No." + '-' + format(FINImprestLines."Line No.")
                                                                                                                      // END ELSE
                                                                                                                      //     ERROR('No allocation for  Account:' + GLAccount.Name);
                                                                                                                      // END;
                END ELSE
                    IF PostBudgetEnties.checkBudgetControl(FINImprestLines."Account No.") THEN
                        ERROR('Missing Budget for  Account:' + GLAccount.Name);
            END;
            UNTIL FINImprestLines.NEXT = 0;
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
        FINImprestLines: Record "FIN-Imprest Lines";
        CommDocNo: Code[50];
        RevCommNo: Code[50];
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory)) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        Rec.TESTFIELD("Global Dimension 1 Code");
        Rec.TESTFIELD("Shortcut Dimension 2 Code");
        //Get Current Lines to loop through
        FINImprestLines.RESET;
        FINImprestLines.SETRANGE(No, Rec."No.");
        //FINImprestLines.SetRange("Destination Cluster", FINImprestLines."Destination Cluster");
        IF FINImprestLines.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                // Check if budget exists
                FINImprestLines.TESTFIELD("Account No.");
                FINImprestLines.SetFilter("Line No.", '<>%1', 0);
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", FINImprestLines."Account No.");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                // Clear(CommDocNo);
                // CommDocNo := FINImprestLines.No + '-'
                // + FINImprestLines."Account No.";


                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                FINBudgetEntries.RESET;
                FINBudgetEntries.SETRANGE("Budget Name", BCSetup."Current Budget Code");
                FINBudgetEntries.SETRANGE("G/L Account No.", FINImprestLines."Account No.");
                FINBudgetEntries.SetRange("Document No", Rec."No." + FINImprestLines."Account No.");
                FINBudgetEntries.DeleteAll();
            END
            UNTIL FINImprestLines.NEXT = 0;
        END;
    end;



}
