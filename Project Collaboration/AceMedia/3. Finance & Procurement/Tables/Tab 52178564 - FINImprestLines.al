table 52178564 "FIN-Imprest Lines"
{
    //DrillDownPageID = 68049;
    //LookupPageID = 68049;

    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                // IF Pay.GET(No) THEN
                // "Imprest Holder":=Pay."Account No.";
            end;
        }
        field(2; "Account No."; Code[50])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                IF GLAcc.GET("Account No.") THEN GLAcc.VALIDATE(GLAcc."No.");
                "Account Name" := GLAcc.Name;
                GLAcc.TESTFIELD("Direct Posting", TRUE);
                "Budgetary Control A/C" := GLAcc."Budget Controlled";
                Pay.SETRANGE(Pay."No.", No);
                IF Pay.FINDFIRST THEN BEGIN
                    IF Pay."Account No." <> '' THEN
                        "Imprest Holder" := Pay."Account No."
                    ELSE
                        ERROR('Please Enter the Customer/Account Number');
                END;
            end;
        }
        field(3; "Account Name"; Text[80])
        {
            Editable = false;
        }
        field(4; Amount; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                IF "Currency Factor" <> 0 THEN
                    "Amount LCY" := Amount / "Currency Factor"
                ELSE
                    "Amount LCY" := Amount;
                // "Budget Balance" := 0;
                // "Budget Balance" := FinMgt.GetBudgetBalance("Account No.", "Global Dimension 1 Code", "Shortcut Dimension 2 Code", "Budget Name");
            end;
        }
        field(5; "Due Date"; Date)
        {
        }
        field(6; "Imprest Holder"; Code[50])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(7; "Actual Spent"; Decimal)
        {
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            Editable = false;
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; "Apply to"; Code[20])
        {
        }
        field(10; "Apply to ID"; Code[20])
        {
        }
        field(11; "Surrender Date"; Date)
        {
        }
        field(12; Surrendered; Boolean)
        {
        }
        field(13; "M.R. No"; Code[20])
        {
        }
        field(14; "Date Issued"; Date)
        {
        }
        field(15; "Type of Surrender"; Option)
        {
            OptionMembers = " ",Cash,Receipt;
        }
        field(16; "Dept. Vch. No."; Code[20])
        {
        }
        field(17; "Cash Surrender Amt"; Decimal)
        {
        }
        field(18; "Bank/Petty Cash"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(19; "Surrender Doc No."; Code[20])
        {
        }
        field(45; Status; Option)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("FIN-Imprest Header".Status where("No." = field(No)));
            OptionMembers = Pending,"Pending Approval",,Approved,Posted,Cancelled;
        }
        field(20; "Date Taken"; Date)
        {
        }
        field(21; Purpose; Text[250])
        {
            Editable = false;
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(23; "Budgetary Control A/C"; Boolean)
        {
            Editable = true;
        }
        field(24; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(25; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the fourth global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(26; Committed; Boolean)
        {
        }
        field(27; "Advance Type"; Code[20])
        {
            Editable = false;
            TableRelation = "FIN-Receipts and Payment Types".Code WHERE(Type = CONST(Imprest));

            trigger OnValidate()
            begin
                ImprestHeader.RESET;
                ImprestHeader.SETRANGE(ImprestHeader."No.", No);
                IF ImprestHeader.FIND('-') THEN BEGIN
                    IF (ImprestHeader.Status <> ImprestHeader.Status::Pending) THEN
                        ERROR('You Cannot Insert a new record when the status of the document is not Pending');

                END;

                RecPay.RESET;
                RecPay.SETRANGE(RecPay.Code, "Advance Type");
                RecPay.SETRANGE(RecPay.Type, RecPay.Type::Imprest);
                IF RecPay.FIND('-') THEN BEGIN
                    RecPay.TESTFIELD(RecPay."G/L Account");
                    "Account No." := RecPay."G/L Account";
                    VALIDATE("Account No.");
                END;

                //MODIFY;
            end;
        }
        field(28; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF "Currency Factor" <> 0 THEN
                    "Amount LCY" := Amount / "Currency Factor"
                ELSE
                    "Amount LCY" := Amount;
            end;
        }
        field(29; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(30; "Amount LCY"; Decimal)
        {
        }
        field(31; "EFT Bank Account No"; Code[20])
        {
        }
        field(32; "EFT Bank Code"; Code[20])
        {
        }
        field(33; "EFT Account Name"; Text[50])
        {
        }
        field(34; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;
            end;
        }
        field(36; "Budgeted Amount"; Decimal)
        {

            FieldClass = FlowField;
            CalcFormula = Sum("G/L Budget Entry".Amount WHERE("Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                               // CalcFormula = Sum("G/L Budget Entry".Amount WHERE("Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                               "Global Dimension 2 Code" = FIELD("Shortcut Dimension 2 Code"),
                                                               "Budget Name" = FIELD("Budget Name"),
                                                               "G/L Account No." = FIELD("Account No.")));
            // FieldClass = FlowField;
            // CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("Transaction Type" = FILTER(Allocation),
            // //CalcFormula = Sum("FIN-Budget Entries"."Debit Amount" WHERE("Transaction Type" = FILTER(Allocation),
            //  "Commitment Status" = FILTER(' '), "Budget Name" = FIELD("Budget Name"),
            //   "G/L Account No." = FIELD("Account No."), "Global Dimension 1 Code" = field("Global Dimension 1 Code"),
            //     "Global Dimension 2 Code" = field("Shortcut Dimension 2 Code")));
            // //"Budget Dimension 3 Code" = field("Global Dimension 3 Code")));

        }
        field(37; "Actual Expenditure"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("G/L Entry".Amount WHERE("G/L Account No." = FIELD("Account No."),
                                                        "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                        "Global Dimension 2 Code" = FIELD("Shortcut Dimension 2 Code")));

        }
        field(38; "Committed Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Committment".Amount WHERE(Budget = FIELD("Budget Name"),
                                                            "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                            "Shortcut Dimension 2 Code" = FIELD("Shortcut Dimension 2 Code"),
                                                            "G/L Account No." = FIELD("Account No.")));

        }
        field(39; "Budget Name"; Code[50])
        {
            TableRelation = "G/L Budget Name".Name;

            trigger OnValidate()
            begin
                CALCFIELDS("Budgeted Amount");
                CALCFIELDS("Actual Expenditure");
                CALCFIELDS("Committed Amount");
                ImprestHeader.RESET;
                ImprestHeader.SETRANGE(ImprestHeader."No.", No);
                IF ImprestHeader.FIND('-') THEN BEGIN
                    ImprestHeader."Budgeted Amount" := "Budgeted Amount";
                    ImprestHeader."Committed Amount" := "Committed Amount";
                    ImprestHeader."Actual Expenditure" := "Actual Expenditure";
                    ImprestHeader."Budget Balance" := "Budget Balance";
                    ImprestHeader.MODIFY
                END;
            end;
        }
        field(40; "Budget Balance"; Decimal)
        {

            Editable = false;
        }
        field(46; "Budget Allocation"; Decimal)
        {
            Editable = false;

        }
        field(35; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(41; "Region"; Code[30])
        {
            TableRelation = "Fin Memo Regions".Regions where(Grade = field("Salary Grade"));
            trigger OnValidate()
            var
                Regions: Record "Fin Memo Regions";
            begin
                Regions.Reset();
                Regions.SetRange(Regions, Region);
                Regions.SetRange(Grade, "Salary Grade");
                if Regions.Find('-') then begin
                    Rates := Regions.Amount;
                end;
                Validate("No of days");
            end;
        }

        field(42; Rates; Decimal)
        {
            Editable = false;
        }
        field(43; "No of days"; Decimal)
        {
            trigger OnValidate()
            begin
                if "No of days" < 0 then
                    Error('Days cannot be less than zero');
                if ((Region <> '') and (Rates <> 0) and ("No of days" <> 0)) then begin
                    Amount := Rates * "No of days";
                    Validate(amount);
                end;
            end;
        }
        field(44; "Salary Grade"; code[50])
        {

        }

    }

    keys
    {
        key(Key1; "Line No.", No, "Advance Type", "Shortcut Dimension 2 Code", "Account No.")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount LCY";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        ImprestHeader.RESET;
        ImprestHeader.SETRANGE(ImprestHeader."No.", No);
        IF ImprestHeader.FINDFIRST THEN BEGIN
            IF (ImprestHeader.Status = ImprestHeader.Status::Approved) OR
            (ImprestHeader.Status = ImprestHeader.Status::Posted) OR
            (ImprestHeader.Status = ImprestHeader.Status::"Pending Approval") THEN
                IF "Account No." <> '' THEN
                    ERROR('You Cannot Delete this record its status is not Pending');
        END;
        TESTFIELD(Committed, FALSE);
    end;

    trigger OnInsert()
    begin
        ImprestHeader.RESET;
        ImprestHeader.SETRANGE(ImprestHeader."No.", No);
        IF ImprestHeader.FINDFIRST THEN BEGIN
            "Date Taken" := ImprestHeader.Date;
            "Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
            "Due Date" := TODAY;
            "Date Issued" := TODAY;
            //  "Budget Name" := CurBudget."Current Budget Code";


            //ImprestHeader.TESTFIELD("Responsibility Center");
            ImprestHeader.TESTFIELD("Global Dimension 1 Code");
            //ImprestHeader.TESTFIELD("Shortcut Dimension 2 Code");
            //"Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
            //"Shortcut Dimension 2 Code":=ImprestHeader."Shortcut Dimension 2 Code";
            "Shortcut Dimension 3 Code" := ImprestHeader."Shortcut Dimension 3 Code";
            "Shortcut Dimension 4 Code" := ImprestHeader."Shortcut Dimension 4 Code";
            "Salary Grade" := ImprestHeader."Salary Grade";
            "Currency Factor" := ImprestHeader."Currency Factor";
            "Currency Code" := ImprestHeader."Currency Code";
        END;
        CurBudget.Reset();
        if CurBudget.Get("Budget Name") then
            "Budget Name" := CurBudget."Current Budget Code";
    end;

    trigger OnModify()
    begin
        ImprestHeader.RESET;
        ImprestHeader.SETRANGE(ImprestHeader."No.", No);
        IF ImprestHeader.FINDFIRST THEN BEGIN
            IF (ImprestHeader.Status = ImprestHeader.Status::Approved) OR
                (ImprestHeader.Status = ImprestHeader.Status::Posted) OR
                (ImprestHeader.Status = ImprestHeader.Status::"Pending Approval") THEN
                ERROR('You Cannot Modify this record its status is not Pending');

            "Date Taken" := ImprestHeader.Date;
            // "Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
            //"Shortcut Dimension 2 Code":=ImprestHeader."Shortcut Dimension 2 Code";
            "Shortcut Dimension 3 Code" := ImprestHeader."Shortcut Dimension 3 Code";
            "Shortcut Dimension 4 Code" := ImprestHeader."Shortcut Dimension 4 Code";
            "Currency Factor" := ImprestHeader."Currency Factor";
            "Currency Code" := ImprestHeader."Currency Code";
        END;

        TESTFIELD(Committed, FALSE);
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "FIN-Imprest Header";
        ImprestHeader: Record "FIN-Imprest Header";
        RecPay: Record "FIN-Receipts and Payment Types";
        CurBudget: Record "FIN-Budgetary Control Setup";
        FinMgt: Codeunit "Budget Balance";


    procedure ShowDimensions()
    begin
        //"Dimension Set ID" :=
        // DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2','Imprest',"Line No."));
        //VerifyItemLineDim;
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Global Dimension 1 Code","Shortcut Dimension 2 Code");
    end;
}