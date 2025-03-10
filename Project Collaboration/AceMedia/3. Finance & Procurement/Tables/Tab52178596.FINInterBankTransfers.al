table 52178596 "FIN-InterBank Transfers"
{
    // DrillDownPageID = 68209;
    // LookupPageID = 68209;

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
        field(3; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 1","Custom 2","Custom 3","Custom 4","Custom 5";
        }
        field(4; "Receiving Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                "Amount 2" := 0;
                "Exch. Rate Destination" := 0;
                "Request Amt LCY" := 0;
                "Reciprical 2" := 0;
                Remarks := '';
                "Receiving Bank Account Name" := '';

                IF "Receiving Transfer Type" = "Receiving Transfer Type"::"Intra-Company" THEN BEGIN
                    BankAcc.RESET;
                    IF BankAcc.GET("Receiving Account") THEN BEGIN
                        "Receiving Bank Account Name" := BankAcc.Name;
                        "Currency Code Destination" := BankAcc."Currency Code";
                    END;
                END
                ELSE
                    IF "Receiving Transfer Type" = "Receiving Transfer Type"::"Inter-Company" THEN BEGIN
                        ICPartner.RESET;
                        IF ICPartner.GET("Receiving Account") THEN BEGIN
                            "Receiving Bank Account Name" := ICPartner.Name;
                            "Currency Code Destination" := ICPartner."Currency Code";
                        END;
                    END;
            end;
        }
        field(5; "Received From"; Text[100])
        {
        }
        field(6; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(7; "Receiving Bank Account Name"; Text[150])
        {
        }
        field(8; Posted; Boolean)
        {
        }
        field(9; "Date Posted"; Date)
        {
        }
        field(10; "Time Posted"; Time)
        {
        }
        field(11; "Posted By"; Code[20])
        {
        }
        field(12; Remarks; Text[50])
        {
        }
        field(13; "Transaction Name"; Text[100])
        {
        }
        field(14; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Currency Code Source" = '' THEN
                    "Pay Amt LCY" := Amount;

                IF "Exch. Rate Source" <> 0 THEN
                    VALIDATE("Exch. Rate Source");
            end;
        }
        field(15; "Paying Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                Amount := 0;
                "Exch. Rate Source" := 0;
                "Reciprical 1" := 0;
                "Exch. Rate Source" := 0;
                "Pay Amt LCY" := 0;
                "Paying  Bank Account Name" := '';

                IF "Source Transfer Type" = "Source Transfer Type"::"Intra-Company" THEN BEGIN
                    BankAcc.RESET;
                    IF BankAcc.GET("Paying Account") THEN BEGIN
                        "Paying  Bank Account Name" := BankAcc.Name;
                        "Currency Code Source" := BankAcc."Currency Code";
                    END;
                END
                ELSE
                    IF "Source Transfer Type" = "Source Transfer Type"::"Inter-Company" THEN BEGIN
                        ICPartner.RESET;
                        IF ICPartner.GET("Paying Account") THEN BEGIN
                            "Paying  Bank Account Name" := ICPartner.Name;
                            "Currency Code Source" := ICPartner."Currency Code";
                        END;
                    END;
            end;
        }
        field(16; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(17; "Source Depot Code"; Code[20])
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
        field(18; "Source Department Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Source Budget Center Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(19; "Source Depot Name"; Text[50])
        {
            Caption = 'Source Depot Name';
        }
        field(20; "Receiving Depot Code"; Code[20])
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
        field(21; "Receiving Department Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Receiving Department Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(22; "Receiving Depot Name"; Text[50])
        {
        }
        field(23; "Receiving Department Name"; Text[50])
        {
        }
        field(24; "Source Department Name"; Text[50])
        {
            Caption = 'Source Department Name';
        }
        field(25; "Paying  Bank Account Name"; Text[50])
        {
        }
        field(26; "Inter Bank Template Name"; Code[10])
        {
            Caption = 'Inter Bank Template Name';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(27; "Inter Bank Journal Batch"; Code[10])
        {
            Caption = 'Inter Bank Journal Batch';
            NotBlank = true;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Inter Bank Template Name"));
        }
        field(28; "Receiving Transfer Type"; Option)
        {
            OptionMembers = "Intra-Company","Inter-Company";
        }
        field(29; "Source Transfer Type"; Option)
        {
            OptionMembers = "Intra-Company","Inter-Company";
        }
        field(30; "Currency Code Destination"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;
        }
        field(31; "Currency Code Source"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;
        }
        field(32; "Amount 2"; Decimal)
        {

            trigger OnValidate()
            begin
                IF "Currency Code Destination" = '' THEN
                    "Request Amt LCY" := "Amount 2";

                IF "Exch. Rate Destination" <> 0 THEN
                    VALIDATE("Exch. Rate Destination");
            end;
        }
        field(33; "Exch. Rate Source"; Decimal)
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
        field(34; "Exch. Rate Destination"; Decimal)
        {
            DecimalPlaces = 0 : 15;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Reciprical 2" := 1 / "Exch. Rate Destination";
                VALIDATE("Reciprical 2");
            end;
        }
        field(35; "Reciprical 1"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Pay Amt LCY" := ROUND(Amount * "Reciprical 1");
            end;
        }
        field(36; "Reciprical 2"; Decimal)
        {
            DecimalPlaces = 5 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                "Request Amt LCY" := ROUND("Amount 2" * "Reciprical 2");
            end;
        }
        field(37; "Balance 1"; Decimal)
        {
        }
        field(38; "Balance 2"; Decimal)
        {
        }
        field(39; "Current Source A/C Bal."; Decimal)
        {
        }
        field(40; "Register Number"; Integer)
        {
        }
        field(41; "From No"; Integer)
        {
        }
        field(42; "To No"; Integer)
        {
        }
        field(43; "Shortcut Dimension 3 Code"; Code[20])
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
        field(44; "Shortcut Dimension 4 Code"; Code[20])
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
        field(45; Dim3; Text[250])
        {
        }
        field(46; Dim4; Text[250])
        {
        }
        field(47; "Shortcut Dimension 3 Code1"; Code[20])
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
        field(48; "Shortcut Dimension 4 Code1"; Code[20])
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
        field(49; Dim31; Text[250])
        {
        }
        field(50; Dim41; Text[250])
        {
        }
        field(51; "Sending Responsibility Center"; Code[10])
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
        field(52; "Reciept Responsibility Center"; Code[10])
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
        field(53; "Sending Resp Centre"; Text[60])
        {
            Editable = false;
        }
        field(54; "Receipt Resp Centre"; Text[60])
        {
            Editable = false;
        }
        field(55; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,Posted,Cancelled,"Pending Approval",Approved;
        }
        field(56; "Created By"; Code[30])
        {
        }
        field(57; "Request Amt LCY"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(58; "Pay Amt LCY"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(59; "External Doc No."; Code[20])
        {
        }
        field(60; "Transfer Release Date"; Date)
        {
        }
        field(61; "Cancelled By"; Code[30])
        {
        }
        field(62; "Date Cancelled"; Date)
        {
        }
        field(63; "Time Cancelled"; Time)
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
}