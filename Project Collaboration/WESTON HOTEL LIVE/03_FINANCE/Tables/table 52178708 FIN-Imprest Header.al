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
        field(10; "On Behalf Of"; Text[100])
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
        field(30; "Global Dimension 1 Code"; Code[30])
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
            OptionMembers = Pending,"Pending Approval",,Approved,Posted,Cancelled;
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Imprest;
        }
        field(56; "Shortcut Dimension 2 Code"; Code[80])
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
            CalcFormula = Sum("FIN-Imprest Lines".Amount WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
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
                /*IF "Payment Release Date"<Date THEN
                   ERROR('The Payment Release Date cannot be lesser than the Document Date');
              */

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
            CalcFormula = Sum("FIN-Payment Line".Amount WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(80; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash";
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
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 3 Code");
                IF DimVal.FIND('-') THEN
                    Dim3 := DimVal.Name;

                UpdateHeaderToLine;
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
        field(85; "Responsibility Center"; Code[50])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".code;// where(Grouping = filter('IMPREST'));

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
            TableRelation = IF ("Account Type" = CONST(Customer)) Customer WHERE("Customer Posting Group" = filter('Staff'));

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
        field(88; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
        }
        field(89; Purpose; Text[250])
        {
        }
        field(90; "Payment Voucher No"; Code[20])
        {
            Caption = 'Memo No';
        }
        field(50000; "Serial No."; Code[20])
        {
        }
        field(50001; "Budgeted Amount"; Decimal)
        {
            Editable = false;
        }
        field(50002; "Actual Expenditure"; Decimal)
        {
            Editable = false;
        }
        field(50003; "Committed Amount"; Decimal)
        {
            Editable = false;
        }
        field(50005; "Budget Balance"; Decimal)
        {
            Editable = false;
        }
        field(50006; "Requested By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(50007; "Cheque Printed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "Employee No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "payees bank name"; Text[100])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50010; "payees  branch name"; Text[100])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50011; "payees bank account"; code[50])
        {

        }
        field(50012; "payees bank code"; code[20])
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
        field(50013; "payees Branch code"; code[20])
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
        field(50014; "Mobile No"; code[20])
        {

        }
        field(50015; "Job Title"; Text[2048])
        {

        }
        field(50016; "Memo No."; code[30])
        {
            Editable = false;
        }
        field(5; "Shortcut Dimension  3"; code[80])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(6; "Shortcut dimension 4"; code[80])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        Field(91; "Shortcut Dimension 5"; code[80])
        {
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


    // trigger OnInsert()
    // begin

    //     Rec."Payment Type" := Rec."Payment Type"::Imprest;
    //     Rec."Account Type" := Rec."Account Type"::Customer;
    //     REC."Shortcut Dimension 5" := 'IMPREST';

    //     Rcpt.RESET;
    //     Rcpt.SETRANGE(Rcpt.Posted, FALSE);
    //     Rcpt.SETRANGE(Rcpt.Cashier, USERID);
    //     IF Rcpt.COUNT > 0 THEN BEGIN
    //         IF CONFIRM('There are still some unposted imprests. Continue?', FALSE) = FALSE THEN BEGIN
    //             ERROR('There are still some unposted imprests. Please utilise them first');
    //         END;
    //     END;
    // end;

    trigger OnInsert()
    begin


        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET;
            //IF "Payment Type" = "Payment Type"::Imprest THEN BEGIN
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Imprest Req No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Imprest Req No", xRec."No. Series", 0D, "No.", "No. Series");
            Date := TODAY;
            Cashier := USERID;
            "Global Dimension 1 Code" := 'Branch';
            //"Requested By" := USERID;
            VALIDATE(Cashier);
            //END
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

    end;

    trigger OnModify()
    begin
        IF Status = Status::Pending THEN
            UpdateHeaderToLine;

        //  IF (Status<>Status::Pending) OR (Status=Status::Posted)OR (Status=Status::"Pending Approval") THEN
        //   ERROR('You Cannot Modify this record its status is not Pending');
    end;

    var
        Rcpt: Record "FIN-Imprest Header";
        Bankstructure: record "PRL-Bank Structure";
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
}
