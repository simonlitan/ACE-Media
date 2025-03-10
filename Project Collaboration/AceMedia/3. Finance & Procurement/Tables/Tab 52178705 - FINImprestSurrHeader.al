table 52178705 "FIN-Imprest Surr. Header"
{
    LookupPageId = "Fin-Imprest Accounting List";
    DrillDownPageId = "Fin-Imprest Accounting List";

    fields
    {
        field(1; No; Code[80])
        {



        }
        field(2; "Surrender Date"; Date)
        {
        }
        field(3; Type; Code[20])
        {

            trigger OnValidate()
            begin

                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.RESET;
                RecPayTypes.SETRANGE(RecPayTypes.Code, Type);
                RecPayTypes.SETRANGE(RecPayTypes.Type, RecPayTypes.Type::Payment);

                IF RecPayTypes.FIND('-') THEN BEGIN
                    Grouping := RecPayTypes."Default Grouping";
                END;

                IF RecPayTypes.FIND('-') THEN BEGIN
                    "Account Type" := RecPayTypes."Account Type";
                    "Transaction Name" := RecPayTypes.Description;

                    IF RecPayTypes."Account Type" = RecPayTypes."Account Type"::"G/L Account" THEN BEGIN
                        RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."G/L Account";
                        VALIDATE("Account No.");
                    END;

                    //Banks
                    IF RecPayTypes."Account Type" = RecPayTypes."Account Type"::"Bank Account" THEN BEGIN
                        //RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."Bank Account";
                        VALIDATE("Account No.");
                    END;
                    if No = '' then
                        GenLedgerSetup.Reset();
                    GenLedgerSetup.GET;
                    "Global Dimension 1 Code" := 'NAKS';
                    "Shortcut Dimension 2 Code" := 'NAKS';
                    "Global Dimension 2 Code" := 'NAKS';
                    Validate("Global Dimension 1 Code");
                    Validate("Shortcut Dimension 2 Code");
                    Validate("Global Dimension 2 Code");


                END;

                //VALIDATE("Account No.");
            end;
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 1","Custom 2","Custom 3","Custom 4","Custom 5";
        }
        field(5; "Cheque No"; Code[20])
        {
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Cheque Type"; Code[20])
        {
            //TableRelation = "GEN-Test Table";
        }
        field(8; "Bank Code"; Code[20])
        {
            //TableRelation = "HRM-Shifts";
        }

        field(9; "Received From"; Text[100])
        {
            Editable = false;
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; Cashier; Code[80])
        {
        }
        field(12; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            //OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            //OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Account No."; Code[80])
        {
            Caption = 'Account No.';

            TableRelation = Customer."No." WHERE("Customer Posting Group" = filter('IMPREST'));


            trigger OnValidate()
            begin
                cust.Reset();
                cust.SetRange("No.", "Account No.");
                if cust.GET(REC."Account No.") then
                    "Account Name" := cust.Name;


            end;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Account Name"; Text[150])
        {
            Editable = false;
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
        field(20; Amount; Decimal)
        {
        }
        field(21; Remarks; Text[250])
        {
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(23; "Shortcut Dimension  3"; code[80])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(24; "Shortcut dimension 4"; code[80])
        {
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        Field(70; "Shortcut Dimension 5"; code[80])
        {
            TableRelation = "Dimension Value".code where("Global Dimension No." = filter(5));
        }
        field(25; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin

                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                DimVal.SETRANGE(DimVal.Code, "Global Dimension 1 Code");
                IF DimVal.FIND('-') THEN
                    "Function Name" := DimVal.Name
            end;
        }
        field(26; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin

                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 2);
                DimVal.SETRANGE(DimVal.Code, "Global Dimension 2 Code");
                IF DimVal.FIND('-') THEN
                    "Budget Center Name" := DimVal.Name
            end;
        }
        field(27; "Bank Account No"; Code[20])
        {
        }
        field(28; "Cashier Bank Account"; Code[20])
        {
        }
        field(29; Status; Option)
        {
            caption = 'Status';
            OptionCaption = 'Pending,1st Approval,2nd Approval,Cheque Printing,Posted,Cancelled,Checking,VoteBook,Pending Approval,Approved,Archive';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved,Archive,;
        }
        field(30; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(31; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(32; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(33; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(34; "Apply to ID"; Code[20])
        {
        }
        field(35; "No. Printed"; Integer)
        {
        }
        field(36; "Imprest Issue Date"; Date)
        {
        }
        field(37; Surrendered; Boolean)
        {
        }
        field(38; "Imprest Issue Doc. No"; Code[50])
        {


        }
        field(39; "Vote Book"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(40; "Total Allocation"; Decimal)
        {
        }
        field(41; "Total Expenditure"; Decimal)
        {
        }
        field(42; "Total Commitments"; Decimal)
        {
        }
        field(43; Balance; Decimal)
        {
        }
        field(72; "Budget Balance"; Decimal)
        {

        }
        field(44; "Balance Less this Entry"; Decimal)
        {
        }
        field(45; "Petty Cash"; Boolean)
        {
        }
        field(46; "Shortcut Dimension 2 Code"; Code[80])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 2 Code");
                IF DimVal.FIND('-') THEN
                    "Budget Center Name" := DimVal.Name
            end;
        }
        field(47; "Function Name"; Text[50])
        {
        }
        field(48; "Budget Center Name"; Text[80])
        {
        }
        field(49; "User ID"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(50; "Issue Voucher Type"; Option)
        {
            OptionMembers = " ","Cash Voucher","Payment Voucher";
        }
        field(51; "Shortcut Dimension 3 Code"; Code[80])
        {
            CaptionClass = '1,2,3';
            Caption = 'Activity Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 3);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 3 Code");
                IF DimVal.FIND('-') THEN
                    Dim3 := DimVal.Name
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
                DimVal.SETRANGE(DimVal."Global Dimension No.", 4);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 4 Code");
                IF DimVal.FIND('-') THEN
                    Dim4 := DimVal.Name
            end;
        }
        field(53; Dim3; Text[250])
        {
        }
        field(54; Dim4; Text[250])
        {
        }
        field(55; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(56; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(57; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            Editable = false;
            TableRelation = "Responsibility Center".Code where(Grouping = filter('SURRENDER'));

            trigger OnValidate()
            begin

                // TESTFIELD(Status, Status::Pending);
                // IF NOT UserMgt.CheckRespCenter(1, "Shortcut Dimension 3 Code") THEN
                //     ERROR(
                //       Text001,
                //       RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter);
            end;
        }
        field(58; "Amount Surrendered LCY"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Amount LCY" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(59; "PV No"; Code[20])
        {
        }
        field(60; "Print No."; Integer)
        {
        }
        field(61; "Cash Surrender Amt"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Cash Receipt Amount" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(62; "Financial Period"; Code[20])
        {
            TableRelation = "FIN-Financial Periods"."Period Code" WHERE("Current Period" = FILTER(true));
        }
        field(63; "Actual Spent"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Actual Spent" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(64; "Difference Owed"; Decimal)
        {
            FieldClass = Normal;
        }
        field(65; "Over Expenditure"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Over Expenditure" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(66; "Cash Receipt No"; Code[20])
        {
            CalcFormula = Lookup("FIN-Imprest Surrender Details"."Cash Receipt No" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
            TableRelation = "FIN-Receipts Header"."No." WHERE(Posted = FILTER('Yes'));
        }
        field(67; "Net Amount"; Decimal)
        {
            // FieldClass = Normal;
        }
        field(68; "Paying Bank Account"; Code[20])
        {
        }
        field(69; Payee; Text[100])
        {
        }
        field(71; Purpose; Text[100])
        {

        }

    }

    keys
    {
        key(Key1; No)
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
        "Account Type" := "Account Type"::Customer;

        Cashier := USERID;
        VALIDATE(Cashier);
        "Responsibility Center" := 'Surr';
        IF No = '' THEN BEGIN
            GenLedgerSetup.Reset();
            GenLedgerSetup.GET;
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Imprest Surrender No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Imprest Surrender No", xRec."No. Series", 0D, No, "No. Series");
            // "Global Dimension 1 Code" := 'NAKS';
            // "Shortcut Dimension 2 Code" := 'NAKS';
            // "Global Dimension 2 Code" := 'NAKS';
            // Validate("Global Dimension 1 Code");
            //Validate("Shortcut Dimension 2 Code");
            // Validate("Global Dimension 2 Code");

        END;
        // usersetup.Reset();
        // usersetup.SetRange("User ID", rec.Cashier);
        // if usersetup.Find('-') then begin
        //     "Account No." := usersetup."Employee No.";
        Hremployeec.Reset();
        Hremployeec.SetRange("No.", rec."Account No.");
        if Hremployeec.Find('-') then begin
            "Account Name" := Hremployeec."First Name" + ' ' + Hremployeec."Middle Name" + ' ' + Hremployeec."Last Name";

            // end;

        end;
        if Status <> Status::Pending then
            Fieldseidtable := false
        else
            Fieldseidtable := true;


    end;


    trigger OnModify()
    begin
        IF Status = Status::Posted THEN
            ERROR('Cannot Modify Document is already Posted');
    end;

    var
        ImpSurrLine: Record "FIN-Imprest Surrender Details";
        PayHeader: Record "FIN-Imprest Header";
        PayLine: Record "FIN-Imprest Lines";
        "Withholding Tax Code": Code[200];
        usersetup: record "User Setup";
        Fieldseidtable: Boolean;
        Hremployeec: record "HRM-Employee C";
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
        //ImprestReqDet: Record "FIN-Receipt Storage";
        //LoadImprestDetails: Record "FIN-Cash Payment Line q";
        TotAmt: Decimal;
        DimVal: Record "Dimension Value";
        "VAT Code": Code[20];
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        PaymentsH: Record "FIN-Payments Header";
        BCSetup: Record "FIN-Budgetary Control Setup";


    procedure ExpenseBudget()
    var
        GLAccount: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        PostBudgetEnties: Codeunit "Post Budget Enties";
    begin
        BCSetup.GET;
        IF NOT ((BCSetup.Mandatory) and (BCsetup."Imprest Budget mandatory")) THEN EXIT;
        BCSetup.TESTFIELD("Current Budget Code");
        //Get Current Lines to loop through
        ImpSurrLine.RESET;
        ImpSurrLine.SETRANGE("Surrender Doc No.", Rec.No);
        IF ImpSurrLine.FIND('-') THEN BEGIN
            REPEAT
            BEGIN

                // Expense Budget Here
                ImpSurrLine.TESTFIELD("Account No:");
                GLAccount.RESET;
                GLAccount.SETRANGE("No.", ImpSurrLine."Account No:");
                IF GLAccount.FIND('-') THEN GLAccount.TESTFIELD(Name);
                DimensionValue.RESET;
                DimensionValue.SETRANGE(Code, Rec."Global Dimension 1 Code");
                DimensionValue.SETRANGE("Global Dimension No.", 2);
                IF DimensionValue.FIND('-') THEN DimensionValue.TESTFIELD(Name);
                IF (ImpSurrLine.Amount > 0) THEN BEGIN
                    // Commit Budget Here
                    PostBudgetEnties.ExpenseBudget(ImpSurrLine."Account No:", Rec."Surrender Date", Rec."Global Dimension 1 Code", Rec."Shortcut Dimension 2 Code",
                    ImpSurrLine."Actual Spent", ImpSurrLine."Account Name", USERID, TODAY, 'IMPREST', Rec."Imprest Issue Doc. No" + ImpSurrLine."Account No:", Rec.Purpose);
                END;
            END;
            UNTIL ImpSurrLine.NEXT = 0;
        END;
    end;

}