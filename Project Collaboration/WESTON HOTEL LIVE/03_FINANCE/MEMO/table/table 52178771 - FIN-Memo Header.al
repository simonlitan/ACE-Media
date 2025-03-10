table 52178771 "FIN-Memo Header"
{
    LookupPageId = "FIN-Memo Header List All";
    DrillDownPageId = "FIN-Memo Header List All";

    fields
    {
        field(1; "No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Date/Time"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Salary Grade"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; From; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C"."No.";

            trigger OnValidate()
            var
                empl: Record "HRM-Employee C";
            begin
                Rec."Memo Requestor No" := Rec."from";

                empl.Reset();
                empl.SetRange("No.", From);
                if empl.Find('-') then begin
                    "From No." := from;
                    "Salary Grade" := empl."Salary Grade";
                    From := empl."First Name" + ' ' + empl."Middle Name" + ' ' + empl."Last Name";
                end;

            end;
        }
        field(4; Through; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C"."No." where(status = filter(Active));

            trigger OnValidate()
            var
                empl: Record "HRM-Employee C";
            begin
                empl.Reset();
                empl.SetRange("No.", Through);
                if empl.Find('-') then
                    Through := empl."First Name" + ' ' + empl."Middle Name" + ' ' + empl."Last Name";
            end;
        }
        field(5; "To"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C"."No." where(Status = filter(Active));

            trigger OnValidate()
            var
                empl: Record "HRM-Employee C";
            begin

                empl.Reset();
                empl.SetRange("No.", "To");
                if empl.Find('-') then
                    "To" := empl."First Name" + ' ' + empl."Middle Name" + ' ' + empl."Last Name";
            end;
        }
        field(6; "Created by"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Title/Ref."; Code[250])
        {
            DataClassification = ToBeClassified;

        }
        field(8; "Paragraph 1"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Paragraph 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Paragraph 3"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Compute P.A.Y.E."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "P.A.Y.E. Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Payroll Period"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Period Month"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Period Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "From No."; code[30])
        {

        }
        field(17; "Memo Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Pending,Pending Approval,Approved,Posted';
            OptionMembers = Pending,"Pending Approval",Approved,Cancelled,Posted;

            trigger OnValidate()
            begin

                IF Rec."Memo Status" = Rec."Memo Status"::Approved THEN BEGIN
                    IF NOT Rec.PRN THEN EXIT;
                    CLEAR(NextOderNo);
                    IF PurchSetup.GET() THEN PurchSetup.TESTFIELD(PurchSetup."Internal Requisition No.");
                    PurchSetup.TESTFIELD(PurchSetup."Requisition Default Vendor");
                    NextOderNo := NoSeriesMgt.GetNextNo(PurchSetup."Internal Requisition No.", TODAY, TRUE);
                    PurchHeader.INIT;
                    PurchHeader."Document Type" := PurchHeader."Document Type"::Quote;
                    PurchHeader."Document Type 2" := PurchHeader."Document Type 2"::Requisition;
                    PurchHeader.DocApprovalType := PurchHeader.DocApprovalType::Requisition;
                    PurchHeader."No." := NextOderNo;
                    PurchHeader."Buy-from Vendor No." := PurchSetup."Requisition Default Vendor";
                    PurchHeader.VALIDATE(PurchHeader."Buy-from Vendor No.");
                    PurchHeader."Document Date" := TODAY;
                    PurchHeader."Posting Date" := TODAY;
                    PurchHeader."Posting Description" := COPYSTR('PRN(' + NextOderNo + ')' + PurchHeader."Buy-from Vendor Name", 1, 50);
                    PurchHeader."Order Date" := TODAY;
                    PurchHeader."Due Date" := TODAY;
                    PurchHeader.INSERT(TRUE);
                    lineNo := 0;
                    MemoPRNDetails.RESET;
                    MemoPRNDetails.SETRANGE(MemoPRNDetails."Document No.", Rec."No.");
                    IF MemoPRNDetails.FIND('-') THEN BEGIN
                        REPEAT
                        BEGIN
                            lineNo := lineNo + 100;
                            IF MemoPRNDetails.Type = MemoPRNDetails.Type::Item THEN
                                IF Item.GET(MemoPRNDetails."No.") THEN;
                            IF MemoPRNDetails.Type = MemoPRNDetails.Type::"Fixed Asset" THEN
                                IF FixedAsset.GET(MemoPRNDetails."No.") THEN;
                            IF MemoPRNDetails.Type = MemoPRNDetails.Type::"G/L Account" THEN
                                IF GLAccount.GET(MemoPRNDetails."No.") THEN;
                            PurchLine.INIT;
                            PurchLine."Document Type" := PurchLine."Document Type"::Quote;
                            PurchLine."Document No." := NextOderNo;
                            PurchLine."Line No." := lineNo;
                            IF MemoPRNDetails.Type = MemoPRNDetails.Type::Item THEN
                                PurchLine.Type := PurchLine.Type::Item;
                            IF MemoPRNDetails.Type = MemoPRNDetails.Type::"Fixed Asset" THEN
                                PurchLine.Type := PurchLine.Type::"Fixed Asset";
                            IF MemoPRNDetails.Type = MemoPRNDetails.Type::"G/L Account" THEN
                                PurchLine.Type := PurchLine.Type::"G/L Account";

                            PurchLine.VALIDATE(PurchLine."No.", MemoPRNDetails."No.");
                            PurchLine."Unit of Measure" := MemoPRNDetails."Unit of Measure";
                            PurchLine."Location Code" := MemoPRNDetails."Location Code";
                            PurchLine.VALIDATE(PurchLine.Quantity, MemoPRNDetails.Quantity);
                            PurchLine."Qty. to Receive" := MemoPRNDetails.Quantity;
                            PurchLine."Qty. to Invoice" := MemoPRNDetails.Quantity;
                            PurchLine."Planned Receipt Date" := TODAY;
                            PurchLine.VALIDATE(PurchLine."Unit Cost", MemoPRNDetails."Unit Cost");
                            PurchLine.INSERT(TRUE);
                        END;
                        UNTIL MemoPRNDetails.NEXT = 0;
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type", PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE("No.", NextOderNo);
                        IF PurchHeader.FIND('-') THEN BEGIN
                            PurchHeader.Status := PurchHeader.Status::Released;
                            PurchHeader.MODIFY;
                            Rec."PRN No." := NextOderNo;
                            Rec.MODIFY;
                        END;
                    END;
                END;
                IF Rec."Memo Status" = Rec."Memo Status"::Approved THEN BEGIN
                END;
            end;
        }
        field(18; "Memo Used"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Associated Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Associated Document Type"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Memo Value"; Decimal)
        {
            CalcFormula = Sum("FIN-Memo Details".Amount WHERE("Memo No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(22; "PAYE Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Programme Code"; Code[20])
        {
            Caption = 'Region Center';
            DataClassification = ToBeClassified;
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(24; "Programme Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Region Name';
        }
        field(25; "Department Code"; Code[20])
        {
            Caption = 'Department Code';

            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            trigger OnValidate()
            var
                NewRefCode: Code[30];
                MemoRef: Record "FIN-Memo Refs";
            begin
                if Rec."Title/Ref." = '' then begin
                    MemoRef.Reset();
                    MemoRef.SetRange(Department, Rec."Department Code");
                    if MemoRef.FindFirst() then begin
                        NewRefCode := NoSeriesMgt.GetNextNo(MemoRef."No. Series", TODAY, TRUE);
                        Rec."Title/Ref." := MemoRef."Department  Prefix" + '/' + NewRefCode + '/' + MemoRef.Year;
                        Rec.MODIFY;
                    end;

                end;

            end;

        }
        field(26; "Department Name"; Text[150])
        {
            Caption = 'Department Name';
            DataClassification = ToBeClassified;
        }
        field(27; "Activity Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            Caption = 'Project Code';

            trigger OnValidate()
            var

            begin
                DimensionValue.Reset();
                DimensionValue.SETRANGE(DimensionValue."Global Dimension No.", 2);
                DimensionValue.SetRange("Code", "Activity Code");
                if DimensionValue.Find('-') then begin
                    DimensionValue.TESTFIELD(DimensionValue."G/L Account No.");
                    "Budget Account" := DimensionValue."G/L Account No.";
                    cashoff.Get();
                    "Budget Name" := cashoff."Current Budget";
                end;

            end;
        }
        field(28; "Activity Name"; Text[150])
        {
            Caption = 'Project Name';
            DataClassification = ToBeClassified;
        }
        field(29; "Budget Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "G/L Account"."No.";
        }
        field(30; "PRN No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(31; PRN; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "PRN Items Count"; Integer)
        {
            CalcFormula = Count("Memo PRN Details" WHERE("Document No." = FIELD("No."),
                                                          Quantity = FILTER(> 0)));
            FieldClass = FlowField;
        }
        field(33; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Responsibility Centre"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where(Grouping = filter('IMP-MEMO'));

            trigger OnValidate()
            begin

            end;
        }
        field(35; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37; Title; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Budget Name"; text[100])
        {

        }
        field(39; "Memo Requestor No"; code[30])
        {

        }
        field(40; "Budgeted Amount"; Decimal)
        {
            CalcFormula = Sum("G/L Budget Entry".Amount WHERE("G/L Account No." = FIELD("Budget Account"),
                                                               "Global Dimension 1 Code" = FIELD("Department Code"),
                                                               "Global Dimension 2 Code" = FIELD("Activity Code"),
                                                               "Budget Name" = FIELD("Budget Name")));
            FieldClass = FlowField;
        }
        field(50; "Budget Balance"; Decimal)
        {
            CalcFormula = Sum("FIN-Budget Entries Summary".Balance WHERE("G/L Account No." = FIELD("Budget Account"),
                                                               "Global Dimension 1 Code" = FIELD("Department Code"),
                                                               "Global Dimension 2 Code" = FIELD("Activity Code"),
                                                               "Budget Name" = FIELD("Budget Name")));
            FieldClass = FlowField;
        }
        field(41; "Committed Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("G/L Account No." = FIELD("Budget Account"),
                                                            "Global Dimension 1 Code" = FIELD("Department Code"),
                                                            "Global Dimension 2 Code" = FIELD("Activity Code"),
                                                            "Budget Name" = FIELD("Budget Name"), "Transaction Type" = filter(Commitment),
                                                            "Commitment Status" = filter(Commitment)));
        }
        field(42; "Expensed Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("FIN-Budget Entries".Amount WHERE("G/L Account No." = FIELD("Budget Account"),
                                                            "Global Dimension 1 Code" = FIELD("Department Code"),
                                                            "Global Dimension 2 Code" = FIELD("Activity Code"),
                                                            "Budget Name" = FIELD("Budget Name"), "Transaction Type" = filter(Expense)));
        }

        field(43; "Budgeted Amount2"; Decimal)
        {

        }
        field(44; "Committed Amount2"; Decimal)
        {

        }
        field(45; "Expensed Amount2"; Decimal)
        {

        }
        field(46; "Shortcut Dimension  3"; code[50])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            trigger OnValidate()
            begin
                dim.Reset();
                dim.SetRange(code, "Shortcut Dimension  3");
                if dim.FindFirst() then
                    "Project Name" := dim.Name;
            end;
        }

        field(47; "Shortcut dimension 4"; code[50])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(49; "Project Name"; Text[250])
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

    trigger OnInsert()
    begin

        FINCashOfficeSetup.GET();
        FINCashOfficeSetup.TESTFIELD(FINCashOfficeSetup."Memo Nos.");
        NoSeriesMgt.InitSeries(FINCashOfficeSetup."Memo Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        "Date/Time" := TODAY();
        "Created by" := USERID;

        FINMemoExpenseCodesSetup.RESET;
        IF FINMemoExpenseCodesSetup.FIND('-') THEN BEGIN
            REPEAT
            BEGIN
                FINMemoExpenseCodes.RESET;
                FINMemoExpenseCodes.SETRANGE(FINMemoExpenseCodes."Memo No.", "No.");
                FINMemoExpenseCodes.SETRANGE(FINMemoExpenseCodes."Expense Code", FINMemoExpenseCodesSetup.Code);
                IF NOT (FINMemoExpenseCodes.FIND('-')) THEN BEGIN
                    FINMemoExpenseCodes.INIT;
                    FINMemoExpenseCodes."Memo No." := "No.";
                    FINMemoExpenseCodes."Expense Code" := FINMemoExpenseCodesSetup.Code;
                    FINMemoExpenseCodes.INSERT;
                END;
            END;
            UNTIL FINMemoExpenseCodesSetup.NEXT = 0;
        END;

        usersetup.Reset();
        usersetup.SetRange("User ID", UserId);
        if usersetup.Find('-') then begin
            if usersetup."Employee No." = '' then
                Error('Check with the administrator  to update your profile');
            HRMempD.Reset();
            HRMempD.SetRange("No.", usersetup."Employee No.");
            if HRMempD.Find('-') then begin
                Rec."Memo Requestor No" := usersetup."Employee No.";
                "From No." := usersetup."Employee No.";
                "Salary Grade" := HRMempD."Salary Grade";
                From := HRMempD."First Name" + ' ' + HRMempD."Middle Name" + ' ' + HRMempD."Last Name";
            end;
        end;


    end;

    var
        dim: record "Dimension Value";
        cashoff: Record "Cash Office Setup";
        FINCashOfficeSetup: Record "Cash Office Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        // PRLPayrollPeriods: Record "PRL-Payroll Periods";
        FINMemoExpenseCodes: Record "FIN-Memo Expense Codes";
        FINMemoExpenseCodesSetup: Record "FIN-Memo Expense Codes Setup";
        DimensionValue: Record "Dimension Value";
        PurchHeader: Record "Purchase Header";
        PurchSetup: Record "Purchases & Payables Setup";
        NextOderNo: Code[20];
        Customer: Record customer;
        MemoPRNDetails: Record "Memo PRN Details";
        lineNo: Integer;
        PurchLine: Record "Purchase Line";
        Item: Record Item;
        GLAccount: Record "G/L Account";
        FixedAsset: Record "Fixed Asset";
        Memodetails: Record "FIN-Memo Details";

        FinImprestHeader: Record "FIN-Imprest Header";
        FinImprestLines: Record "FIN-Imprest Lines";
        FinMemoDetails: Record "FIN-Memo Details";
        FinMemoDetails2: Record "FIN-Memo Details";
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRMempD: Record "HRM-Employee C";
        cust: Record Customer;


    procedure GenerateImprests()
    var
        Nextno: code[20];
        prevAmount: decimal;
    begin
        If rec."Memo Used" = false then begin
            FinMemoDetails.Reset();
            FinMemoDetails.SetRange("Memo No.", Rec."No.");
            if FinMemoDetails.Find('-') then begin
                prevAmount := 0;
                repeat
                    FinImprestHeader.Reset();
                    FinImprestHeader.SetRange("Memo No.", Rec."No.");
                    FinImprestHeader.SetRange("Account Type", FinImprestHeader."Account Type"::Customer);
                    FinImprestHeader.SetRange("Account No.", FinMemoDetails."Staff no.");
                    if FinImprestHeader.Find('-') then begin
                        FinImprestLines.Reset();
                        FinImprestLines.SetRange(No, FinImprestHeader."No.");
                        FinImprestLines.SetRange("Imprest Holder", FinMemoDetails."Staff no.");
                        if FinImprestLines.Find('-') then begin
                            prevAmount := FinImprestLines.amount;
                            FinImprestLines.amount := prevAmount + FinMemoDetails.Amount;
                            FinImprestLines.Modify();
                        end;
                    end
                    else begin
                        GenLedgerSetup.GET;
                        GenLedgerSetup.TESTFIELD(GenLedgerSetup."Imprest Req No");
                        // NoSeriesMgt.InitSeries(GenLedgerSetup."Imprest Req No", xRec."No. Series", 0D, FinImprestHeader."No.", FinImprestHeader."No. Series");
                        Nextno := NoSeriesMgt.GetNextNo(GenLedgerSetup."Imprest Req No", today, true);
                        FinImprestHeader."No." := Nextno;
                        FinImprestHeader."Project Memo No" := rec."No.";
                        FinImprestHeader.Date := Rec."Date/Time";
                        FinImprestHeader."Salary Grade" := rec."Salary Grade";
                        usersetup.Reset();
                        usersetup.SetRange("Employee No.", FinMemoDetails."Staff no.");
                        if usersetup.Find('-') then
                            FinImprestHeader."Requested By" := usersetup."User ID";


                        FinImprestHeader."Global Dimension 1 Code" := Rec."Department Code";
                        FinImprestHeader."Shortcut Dimension 2 Code" := Rec."Activity Code";
                        FinImprestHeader."Account Type" := FinImprestHeader."Account Type"::Customer;
                        FinImprestHeader."Shortcut Dimension 5" := 'IMPREST';
                        FinImprestHeader."Account No." := FinMemoDetails."Staff no.";
                        FinImprestHeader.Payee := FinMemoDetails."Staff Name";
                        FinImprestHeader.Purpose := Rec.Title + ' ' + Rec."Title/Ref.";
                        // FinImprestHeader."Responsibility Center" := Rec."Responsibility Centre";
                        FinImprestHeader."Paying Bank Account" := 'BNK0001';
                        FinImprestHeader."Bank Name" := 'Reccurrent Account';
                        FinImprestHeader."Payment Voucher No" := Rec."No.";
                        FinImprestHeader."Memo No." := Rec."No.";
                        FinImprestHeader.Dim3 := rec."Project Name";
                        FinImprestHeader."Total Net Amount" := rec."Memo Value";


                        HRMempD.Reset();
                        HRMempD.SetRange("No.", FinMemoDetails."Staff no.");
                        if HRMempD.FindFirst() then begin
                            FinImprestHeader."Mobile No" := HRMempD."Work Phone Number";
                            FinImprestHeader."Job Title" := HRMempD."Job Title";
                        end;

                        cust.Reset();
                        cust.SetRange("No.", FinMemoDetails."Staff no.");
                        if cust.Find('-') then begin
                            FinImprestHeader."payees bank name" := Cust."Bank Name";
                            FinImprestHeader."payees bank code" := Cust."Bank Code";
                            FinImprestHeader."payees Branch code" := Cust."Branch Code";
                            FinImprestHeader."payees  branch name" := Cust."Branch Name";
                            FinImprestHeader."payees bank account" := Cust."Account No";
                        end;
                        FinImprestHeader.Insert();

                        FinImprestLines.init();
                        FinImprestLines.No := FinImprestHeader."No.";
                        FinImprestLines."Advance Type" := 'Other';
                        FinImprestLines."Account No:" := Rec."Budget Account";
                        GLAccount.Reset();
                        GLAccount.SetRange("No.", FinImprestLines."Account No:");
                        if GLAccount.Find('-') then
                            FinImprestLines."Account Name" := GLAccount.Name;
                        FinImprestLines."Budgeted Amount" := rec."Budgeted Amount";
                        FinImprestLines."Budget Balance" := rec."Budget Balance";
                        FinImprestLines."Date Issued" := Rec."Date/Time";
                        FinImprestLines."Due Date" := Rec."Date/Time";
                        //  FinImprestLines."Account Name" := Rec."Budget Name";
                        FinImprestLines."Budget Name" := Rec."Budget Name";
                        FinImprestLines.amount := FinMemoDetails.Amount;
                        FinImprestLines."Imprest Holder" := FinMemoDetails."Staff no.";
                        FinImprestLines."Global Dimension 1 Code" := Rec."Department Code";
                        FinImprestLines."Shortcut Dimension 2 Code" := Rec."Activity Code";
                        FinImprestLines."Budgetary Control A/C" := true;
                        FinImprestLines."Due Date" := Rec."Date/Time";
                        FinMemoDetails.Region := FinMemoDetails.Region;
                        FinImprestLines.Insert();
                    end;

                UNTIL FinMemoDetails.Next() = 0;
                MESSAGE('Imprests Generated Successfully');
            end;

        end;



    end;

    var
        usersetup: record "User Setup";

    /// <summary>
    /// CheckDetails.
    /// </summary>
    procedure CheckDetails()
    begin
        if (("Department Code" = '') or ("To" = '') or (Through = '') or ("Activity Code" = '') or ("Budget Account" = ''))
        then
            Error('Ensure all fields are filled before requesting approval');
    end;
}

