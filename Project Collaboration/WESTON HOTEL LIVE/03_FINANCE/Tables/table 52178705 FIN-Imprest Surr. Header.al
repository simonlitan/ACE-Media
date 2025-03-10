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

            TableRelation = Customer."No." WHERE("Customer Posting Group" = filter('Staff'));
            Editable = false;

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
        field(27; "Net Amount"; Decimal)
        {
            FieldClass = Normal;
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

            trigger OnValidate()
            begin

                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                DimVal.SETRANGE(DimVal.Code, "Global Dimension 1 Code");
                IF DimVal.FIND('-') THEN
                    "Function Name" := DimVal.Name
            end;
        }
        field(31; "Global Dimension 2 Code"; Code[20])
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
        field(33; "Bank Account No"; Code[20])
        {
        }
        field(34; "Cashier Bank Account"; Code[20])
        {
        }
        field(35; Status; Option)
        {
            caption = 'Status';
            OptionCaption = 'Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved;
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(42; "Apply to ID"; Code[20])
        {
        }
        field(43; "No. Printed"; Integer)
        {
        }
        field(44; "Imprest Issue Date"; Date)
        {
        }
        field(45; Surrendered; Boolean)
        {
        }
        field(46; "Imprest Issue Doc. No"; Code[50])
        {
            TableRelation = "FIN-Imprest Header"."No." where(Status = filter(Posted), "Surrender Status" = filter(<> full));
            //"Requested By" = field("User ID")

        }
        Field(25; "Shortcut Dimension 5"; code[80])
        {
            TableRelation = "Dimension Value".code where("Global Dimension No." = filter(5));
        }
        field(47; "Vote Book"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(48; "Total Allocation"; Decimal)
        {
        }
        field(49; "Total Expenditure"; Decimal)
        {
        }
        field(50; "Total Commitments"; Decimal)
        {
        }
        field(51; Balance; Decimal)
        {
        }
        field(52; "Balance Less this Entry"; Decimal)
        {
        }
        field(54; "Petty Cash"; Boolean)
        {
        }
        field(56; "Shortcut Dimension 2 Code"; Code[80])
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
        field(59; "Function Name"; Text[30])
        {
        }
        field(60; "Budget Center Name"; Text[80])
        {
        }
        field(61; "User ID"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(62; "Issue Voucher Type"; Option)
        {
            OptionMembers = " ","Cash Voucher","Payment Voucher";
        }
        field(81; "Shortcut Dimension 3 Code"; Code[80])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
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
        field(82; "Shortcut Dimension 4 Code"; Code[80])
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
        field(83; Dim3; Text[250])
        {
        }
        field(84; Dim4; Text[250])
        {
        }
        field(85; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(86; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(87; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";//.Code where(Grouping = filter('SURRENDER'));

            trigger OnValidate()
            begin

                // TESTFIELD(Status, Status::Pending);
                IF NOT UserMgt.CheckRespCenter(1, "Shortcut Dimension 3 Code") THEN
                    ERROR(
                      Text001,
                      RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter);
            end;
        }
        field(88; "Amount Surrendered LCY"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Amount LCY" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(89; "PV No"; Code[20])
        {
        }
        field(90; "Print No."; Integer)
        {
        }
        field(91; "Cash Surrender Amt"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Cash Receipt Amount" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(92; "Financial Period"; Code[20])
        {
            TableRelation = "FIN-Financial Periods"."Period Code" WHERE("Current Period" = FILTER(true));
        }
        field(93; "Actual Spent"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Actual Spent" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(50000; "Difference Owed"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50005; "Over Expenditure"; Decimal)
        {
            CalcFormula = Sum("FIN-Imprest Surrender Details"."Over Expenditure" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(50006; "Cash Receipt No"; Code[20])
        {
            CalcFormula = Lookup("FIN-Imprest Surrender Details"."Cash Receipt No" WHERE("Surrender Doc No." = FIELD(No)));
            FieldClass = FlowField;
            TableRelation = "FIN-Receipts Header"."No." WHERE(Posted = FILTER('Yes'));
        }
        field(23; "Shortcut Dimension  3"; code[80])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(24; "Shortcut dimension 4"; code[80])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
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
        "Surrender Date" := TODAY;
        Cashier := USERID;
        VALIDATE(Cashier);
        IF No = '' THEN BEGIN
            GenLedgerSetup.Reset();
            GenLedgerSetup.GET;
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Imprest Surrender No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Imprest Surrender No", xRec."No. Series", 0D, No, "No. Series");
        END;
        usersetup.Reset();
        usersetup.SetRange("User ID", rec.Cashier);
        if usersetup.Find('-') then begin
            "Account No." := usersetup."Employee No.";
            Hremployeec.Reset();
            Hremployeec.SetRange("No.", rec."Account No.");
            if Hremployeec.Find('-') then begin
                "Account Name" := Hremployeec."First Name" + ' ' + Hremployeec."Middle Name" + ' ' + Hremployeec."Last Name";

            end;

        end;


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
}