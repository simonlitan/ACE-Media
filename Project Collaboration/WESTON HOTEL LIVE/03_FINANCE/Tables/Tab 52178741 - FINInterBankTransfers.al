table 52178741 "FIN-InterBank Transfers"
{
    DrillDownPageID = "FIN-Interbank Transfer";
    LookupPageID = "FIN-Interbank Transfer";

    fields
    {
        field(1; No; Code[20])
        {
            trigger OnValidate()
            begin
                IF No <> xRec.No THEN BEGIN
                    GenLedgerSetup.GET;
                    NoSeriesMgt.TestManual(GenLedgerSetup."InterBank Transfer No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 1","Custom 2","Custom 3","Custom 4","Custom 5";
        }
        field(5; "Receiving Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            var
                Currcy: Record "Currency Exchange Rate";
            begin
                "Amount 2" := 0;
                "Exch. Rate Destination" := 0;
                "Request Amt LCY" := 0;
                "Reciprical 2" := 0;
                Remarks := '';
                "Receiving Bank Account Name" := '';

                BankAcc.RESET;
                IF BankAcc.GET("Receiving Account") THEN BEGIN
                    "Receiving Bank Account Name" := BankAcc.Name;
                    "Currency Code Destination" := BankAcc."Currency Code";
                    if BankAcc."Currency Code" = '' then begin
                        "Exch. Rate destination" := 0;
                        "Reciprical 1" := 0;
                        "Pay Amt LCY" := 0;
                    end else begin
                        Currcy.Reset();
                        Currcy.SetRange("Currency Code", BankAcc."Currency Code");
                        if Currcy.FindLast() then begin
                            "Exch. Rate destination" := Currcy."Relational Exch. Rate Amount";
                        end;
                    end;
                END;
                Validate(Amount);

            end;


        }
        field(6; "Received From"; Text[100])
        {
        }
        field(8; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(9; "Receiving Bank Account Name"; Text[150])
        {
        }
        field(10; Posted; Boolean)
        {
        }
        field(11; "Date Posted"; Date)
        {
        }
        field(12; "Time Posted"; Time)
        {
        }
        field(13; "Posted By"; Code[20])
        {
        }
        field(14; Remarks; Text[50])
        {
        }
        field(15; "Transaction Name"; Text[100])
        {
        }
        field(16; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Currency Code Source" = '' THEN begin
                    "Pay Amt LCY" := Amount;
                    if "Currency Code Destination" <> '' then begin
                        if "Exch. Rate Destination" <> 0 then begin
                            VALIDATE("Exch. Rate destination");
                        end;
                    end else begin
                        "Amount 2" := Amount;
                        "Request Amt LCY" := Amount;
                    end;


                end;
                IF "Exch. Rate Source" <> 0 THEN
                    VALIDATE("Exch. Rate Source");
            end;
        }
        field(17; "Paying Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            var
                Currcy: Record "Currency Exchange Rate";
            begin
                rec.TestField("Receiving Account");
                if "Paying Account" = "Receiving Account" then Error('You can not transfer from the same account');
                "Paying  Bank Account Name" := '';

                BankAcc.RESET;
                IF BankAcc.GET("Paying Account") THEN BEGIN
                    "Paying  Bank Account Name" := BankAcc.Name;
                    "Currency Code Source" := BankAcc."Currency Code";
                    if BankAcc."Currency Code" = '' then begin
                        "Exch. Rate Source" := 0;
                        "Reciprical 1" := 0;
                        "Pay Amt LCY" := 0;
                    end else begin
                        Currcy.Reset();
                        Currcy.SetRange("Currency Code", BankAcc."Currency Code");
                        if Currcy.FindLast() then begin
                            "Exch. Rate Source" := Currcy."Relational Exch. Rate Amount";
                        end;
                    end;
                END;
                Validate(Amount);

            end;
        }
        field(19; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(20; "Source Depot Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Source Funtion Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin


                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                DimVal.SETRANGE(DimVal.Code, "Source Depot Code");
                IF DimVal.FIND('-') THEN
                    "Source Depot Name" := DimVal.Name
            end;
        }
        field(21; "Source Department Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Source Budget Center Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(22; "Source Depot Name"; Text[50])
        {
            Caption = 'Source Depot Name';
        }
        field(24; "Receiving Depot Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Receiving Depot Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin

                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                DimVal.SETRANGE(DimVal.Code, "Receiving Depot Code");
                IF DimVal.FIND('-') THEN
                    "Receiving Depot Name" := DimVal.Name
            end;
        }
        field(25; "Receiving Department Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Receiving Department Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(26; "Receiving Depot Name"; Text[50])
        {
        }
        field(27; "Receiving Department Name"; Text[50])
        {
        }
        field(28; "Source Department Name"; Text[50])
        {
            Caption = 'Source Department Name';
        }
        field(29; "Paying  Bank Account Name"; Text[50])
        {
        }
        field(30; "Inter Bank Template Name"; Code[10])
        {
            Caption = 'Inter Bank Template Name';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(31; "Inter Bank Journal Batch"; Code[10])
        {
            Caption = 'Inter Bank Journal Batch';
            NotBlank = true;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Inter Bank Template Name"));
        }
        field(32; "Receiving Transfer Type"; Option)
        {
            OptionMembers = "Intra-Company","Inter-Company";
        }
        field(33; "Source Transfer Type"; Option)
        {
            OptionMembers = "Intra-Company","Inter-Company";
        }
        field(34; "Currency Code Destination"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;
        }
        field(35; "Currency Code Source"; Code[20])
        {

            TableRelation = Currency;
        }
        field(36; "Amount 2"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Currency Code Destination" = '' THEN
                    "Request Amt LCY" := "Amount 2";

                IF "Exch. Rate Destination" <> 0 THEN
                    VALIDATE("Exch. Rate Destination");
            end;
        }
        field(37; "Exch. Rate Source"; Decimal)
        {
            BlankZero = false;
            DecimalPlaces = 0 : 15;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Reciprical 1" := 1 / "Exch. Rate Source";
                VALIDATE("Reciprical 1");
            end;
        }
        field(38; "Exch. Rate Destination"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Reciprical 2" := 1 / "Exch. Rate Destination";
                VALIDATE("Reciprical 2");
            end;
        }
        field(39; "Reciprical 1"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Pay Amt LCY" := ROUND(Amount / "Reciprical 1");
                if Rec."Receiving Account" <> '' then begin
                    if Rec."Currency Code Destination" = '' then begin
                        "Amount 2" := "Pay Amt LCY";
                        "Request Amt LCY" := "Pay Amt LCY";
                    end;
                    if rec."Currency Code Destination" = Rec."Currency Code Source" then begin
                        "Amount 2" := Amount;
                        "Request Amt LCY" := "Pay Amt LCY";
                    end;

                end else
                    Error('Receiving account must have a value');
            end;
        }
        field(40; "Reciprical 2"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Amount 2" := ROUND("Pay Amt LCY" * "Reciprical 2");
                "Request Amt LCY" := "Pay Amt LCY";
            end;
        }
        field(41; "Balance 1"; Decimal)
        {
        }
        field(42; "Balance 2"; Decimal)
        {
        }
        field(43; "Current Source A/C Bal."; Decimal)
        {
        }
        field(44; "Register Number"; Integer)
        {
        }
        field(45; "From No"; Integer)
        {
        }
        field(46; "To No"; Integer)
        {
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
                    Dim3 := DimVal.Name
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
                    Dim4 := DimVal.Name
            end;
        }
        field(83; Dim3; Text[250])
        {
        }
        field(84; Dim4; Text[250])
        {
        }
        field(85; "Shortcut Dimension 3 Code1"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 3 Code1");
                IF DimVal.FIND('-') THEN
                    Dim31 := DimVal.Name
            end;
        }
        field(86; "Shortcut Dimension 4 Code1"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
            trigger OnValidate()
            begin
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 4 Code1");
                IF DimVal.FIND('-') THEN
                    Dim41 := DimVal.Name
            end;
        }
        field(87; Dim31; Text[250])
        {
        }
        field(88; Dim41; Text[250])
        {
        }
        field(89; "Sending Responsibility Center"; Code[10])
        {
            Caption = 'Sending Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin

                TESTFIELD(Posted, FALSE);
                IF NOT UserMgt.CheckRespCenter(1, "Sending Responsibility Center") THEN
                    ERROR(
                      Text001,
                      RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter);

                Amount := 0;
                "Exch. Rate Source" := 0;
                "Reciprical 1" := 0;
                "Exch. Rate Source" := 0;
                "Pay Amt LCY" := 0;
                "Paying  Bank Account Name" := '';
                "Sending Resp Centre" := '';
                "Paying Account" := '';
                "Currency Code Source" := '';

                IF RespCenter.GET("Sending Responsibility Center") THEN
                    "Sending Resp Centre" := RespCenter.Code;
            end;
        }
        field(90; "Reciept Responsibility Center"; Code[10])
        {
            Caption = 'Reciept Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin

                TESTFIELD(Posted, FALSE);
                IF NOT UserMgt.CheckRespCenter(1, "Sending Responsibility Center") THEN
                    ERROR(
                      Text001,
                      RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter);

                "Amount 2" := 0;
                "Exch. Rate Destination" := 0;
                "Request Amt LCY" := 0;
                "Reciprical 2" := 0;
                Remarks := '';
                "Receiving Bank Account Name" := '';
                "Receipt Resp Centre" := '';
                "Receiving Account" := '';
                "Currency Code Destination" := '';


                IF RespCenter.GET("Reciept Responsibility Center") THEN
                    "Receipt Resp Centre" := RespCenter.Code;
            end;
        }
        field(91; "Sending Resp Centre"; Text[60])
        {
            Editable = false;
        }
        field(92; "Receipt Resp Centre"; Text[60])
        {
            Editable = false;
        }
        field(93; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,Posted,Cancelled,"Pending Approval",Approved;
        }
        field(94; "Created By"; Code[30])
        {
        }
        field(95; "Request Amt LCY"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(96; "Pay Amt LCY"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(97; "External Doc No."; Code[20])
        {
        }
        field(98; "Transfer Release Date"; Date)
        {
        }
        field(99; "Cancelled By"; Code[30])
        {
        }
        field(100; "Date Cancelled"; Date)
        {
        }
        field(101; "Time Cancelled"; Time)
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

    trigger OnInsert()
    begin
        IF No = '' THEN BEGIN
            GenLedgerSetup.GET;
            GenLedgerSetup.TESTFIELD(GenLedgerSetup."InterBank Transfer No.");
            NoSeriesMgt.InitSeries(GenLedgerSetup."InterBank Transfer No.", xRec."No. Series", 0D, No, "No. Series");
            "Sending Resp Centre" := 'FINANCE';
            "Receipt Resp Centre" := 'FINANCE';
            "Receiving Transfer Type" := rec."Receiving Transfer Type"::"Intra-Company";
            "Source Transfer Type" := rec."Source Transfer Type"::"Intra-Company";
        END;
    end;

    var
        GenLedgerSetup: Record "Cash Office Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TempBatch: Record "FIN-Cash Office User Template";
        BankAcc: Record "Bank Account";
        DimVal: Record "Dimension Value";
        ICPartner: Record "IC Partner";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemplate: Code[20];
        JBatch: Code[20];
        //PCheck: Codeunit "50110";
        Post: Boolean;

        RegNo: Integer;
        FromNo: Integer;
        ToNo: Integer;
        //RegMgt: Codeunit "50103";
        JournalPostedSuccessfully: Codeunit "Journal Post Successful";

        [InDataSet]
        "Exch. Rate DestinationVisible": Boolean;
        [InDataSet]
        "Exch. Rate SourceVisible": Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        ReceivingTransferTypeEditable: Boolean;
        [InDataSet]
        RecieptResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Receiving AccountEditable": Boolean;
        [InDataSet]
        "Amount 2Editable": Boolean;
        [InDataSet]
        RemarksEditable: Boolean;
        [InDataSet]
        "Exch. Rate DestinationEditable": Boolean;
        NameSendInterbankapprovalRequest: Integer;
        [InDataSet]
        "Source Transfer TypeEditable": Boolean;
        [InDataSet]
        SendingResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Paying AccountEditable": Boolean;
        [InDataSet]
        AmountEditable: Boolean;
        [InDataSet]
        "Exch. Rate SourceEditable": Boolean;
        [InDataSet]
        "External Doc No.Editable": Boolean;
        [InDataSet]
        "Transfer Release DateEditable": Boolean;
        Text19025618: Label 'Requesting Details';
        Text19044997: Label 'Source Details';



    procedure PostTransfer()
    begin
        if Confirm('Post Transfer', true) = false then Error('Cancelled');
        TempBatch.RESET;
        TempBatch.SETRANGE(TempBatch.UserID, USERID);
        IF TempBatch.FIND('-') THEN BEGIN
            Rec."Inter Bank Template Name" := TempBatch."Inter Bank Template Name";
            Rec."Inter Bank Journal Batch" := TempBatch."Inter Bank Batch Name";
        END;

        Rec.TESTFIELD(Status, Rec.Status::Approved);
        Rec.TESTFIELD("Transfer Release Date");

        //Check whether the two LCY amounts are same
        IF Rec."Request Amt LCY" <> Rec."Pay Amt LCY" THEN
            ERROR('The [Requested Amount in LCY: %1] should be same as the [Paid Amount in LCY: %2]', Rec."Request Amt LCY", Rec."Pay Amt LCY");

        //get the source account balance from the database table
        BankAcc.RESET;
        BankAcc.SETRANGE(BankAcc."No.", Rec."Paying Account");
        BankAcc.SETRANGE(BankAcc."Bank Type", BankAcc."Bank Type"::Cash);

        IF BankAcc.FINDFIRST THEN BEGIN
            BankAcc.CALCFIELDS(BankAcc.Balance);
            Rec."Current Source A/C Bal." := BankAcc.Balance;
            IF (Rec."Current Source A/C Bal." - Rec.Amount) < 0 THEN BEGIN
                ERROR('The transaction will result in a negative balance in a CASH ACCOUNT.');
            END;
        END;
        IF Rec.Amount = 0 THEN BEGIN
            ERROR('Please ensure Amount to Transfer is entered');
        END;
        /*Check if the user's batch has any records within it*/
        GenJnlLine.RESET;
        GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name", Rec."Inter Bank Template Name");
        GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name", Rec."Inter Bank Journal Batch");
        GenJnlLine.DELETEALL;

        LineNo := 1000;
        /*Insert the new lines to be updated*/
        GenJnlLine.INIT;
        /*Insert the lines*/
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Journal Template Name" := Rec."Inter Bank Template Name";
        GenJnlLine."Journal Batch Name" := Rec."Inter Bank Journal Batch";
        GenJnlLine."Posting Date" := Rec."Transfer Release Date";
        GenJnlLine."Document No." := Rec.No;
        IF Rec."Receiving Transfer Type" = Rec."Receiving Transfer Type"::"Intra-Company" THEN BEGIN
            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        END
        ELSE
            IF Rec."Receiving Transfer Type" = Rec."Receiving Transfer Type"::"Inter-Company" THEN BEGIN
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"IC Partner";
            END;
        GenJnlLine."Account No." := Rec."Receiving Account";
        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
        GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + FORMAT(Rec.No);
        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Receiving Depot Code";
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Receiving Department Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code1");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code1");
        GenJnlLine."External Document No." := Rec."External Doc No.";
        GenJnlLine.Description := Rec.Remarks;
        IF Rec.Remarks = '' THEN BEGIN GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + FORMAT(Rec.No); END;
        GenJnlLine."Currency Code" := Rec."Currency Code Destination";
        GenJnlLine.Amount := Rec."Amount 2";
        GenJnlLine.VALIDATE(GenJnlLine.Amount);
        GenJnlLine."Amount (LCY)" := Rec."Request Amt LCY";
        GenJnlLine.Validate("Amount (LCY)");
        if GenJnlLine.Amount <> 0 then
            GenJnlLine.INSERT;



        GenJnlLine.INIT;
        /*Insert the lines*/
        GenJnlLine."Line No." := LineNo + 1;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Journal Template Name" := Rec."Inter Bank Template Name";
        GenJnlLine."Journal Batch Name" := Rec."Inter Bank Journal Batch";
        GenJnlLine."Posting Date" := Rec."Transfer Release Date";
        GenJnlLine."Document No." := Rec.No;
        IF Rec."Source Transfer Type" = Rec."Source Transfer Type"::"Intra-Company" THEN BEGIN
            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        END
        ELSE
            IF Rec."Source Transfer Type" = Rec."Source Transfer Type"::"Inter-Company" THEN BEGIN
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"IC Partner";
            END;


        GenJnlLine."Account No." := Rec."Paying Account";
        GenJnlLine.VALIDATE(GenJnlLine."Account No.");
        GenJnlLine."Shortcut Dimension 1 Code" := Rec."Source Depot Code";
        GenJnlLine."Shortcut Dimension 2 Code" := Rec."Source Department Code";
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
        GenJnlLine."External Document No." := Rec."External Doc No.";
        GenJnlLine.Description := Rec.Remarks;
        IF Rec.Remarks = '' THEN BEGIN GenJnlLine.Description := 'Inter-Bank Transfer Ref No:' + FORMAT(Rec.No); END;
        GenJnlLine."Currency Code" := Rec."Currency Code Source";
        GenJnlLine."Currency Code" := Rec."Currency Code Source";
        GenJnlLine.Amount := -Rec.Amount;
        GenJnlLine.VALIDATE(GenJnlLine.Amount);
        GenJnlLine."Amount (LCY)" := -Rec."Pay Amt LCY";
        if GenJnlLine.Amount <> 0 then
            GenJnlLine.INSERT;
        Post := FALSE;
        CODEUNIT.RUN(CODEUNIT::"Modified Gen. Jnl.-Post", GenJnlLine);
        Post := JournalPostedSuccessfully.PostedSuccessfully();

        //IF Post THEN BEGIN
        Rec.Posted := TRUE;
        Rec."Date Posted" := TODAY;
        Rec."Time Posted" := TIME;
        Rec."Posted By" := USERID;
        Rec.MODIFY;
        MESSAGE('The Journal Has Been Posted Successfully');
        //END;
    end;
}