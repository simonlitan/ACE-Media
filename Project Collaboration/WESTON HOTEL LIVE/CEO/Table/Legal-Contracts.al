table 52178898 "Legal-Contracts"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;

        }
        field(2; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Contract Number"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Tender No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Purchase Req. Number"; Text[100])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));
            //TableRelation = "Purchase Header"."No.";

            trigger OnValidate()
            var
                PH: Record "Purchase Header";
                PL: Record "Purchase Line";
            begin
                PH.RESET;
                PH.SETRANGE(PH."No.", "Purchase Req. Number");
                IF PH.FIND('-') THEN
                    "Vendor No." := PH."Buy-from Vendor No.";
                "Vendor Name" := PH."Buy-from Vendor Name";
                "Contract Amount" := PH.Amount;
                "Tender No." := PH."Tendor Number"


            end;
        }
        field(11; "Vendor No."; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Vendor Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Department; Code[100])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            var
                DimVal: Record "Dimension Value";
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal.Code, "Department");
                IF DimVal.FIND('-') THEN
                    "Department Name" := DimVal.Name
            end;
        }
        field(15; "Department Name"; Text[250])
        {
        }
        field(7; "Budgeted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Contract Amount"; Decimal)
        {
            AutoFormatExpression = 'Currency Code';
            AutoFormatType = 1;
           /*  CalcFormula = Sum("Purchase Line".Amount WHERE("Document No." = FIELD("Purchase Req. Number")));
            //Caption = 'Amount';
            //Editable = false;
            FieldClass = FlowField; */
        }
        field(9; Stage; Option)
        {
            OptionMembers = Draft,"Not Signed",Canceled,Signed,Terminated;
            OptionCaption = 'Draft,Not Signed,Canceled,Signed,Terminated';
        }
        field(10; Status; Option)
        {
            OptionMembers = Active,Terminated;
            OptionCaption = 'Active,Terminated';
        }
        field(12; "No Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "User Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Completion Date"; Date)
        {

        }
        field(18; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Paid Amount"; Decimal)
        {
            /* AutoFormatExpression = 'Currency Code';
             AutoFormatType = 1;
             CalcFormula = Sum("Purchase Line".Amount WHERE("Document No." = FIELD("Purchase Req. Number")));
             //Caption = 'Amount';
             //Editable = false;
             FieldClass = FlowField;  */
        }
        field(20; "Balance"; Decimal)
        {
            AutoFormatExpression = 'Currency Code';
            AutoFormatType = 1;
           /*  CalcFormula = Sum("Purchase Line"."Budget Balance" WHERE("Document No." = FIELD("Purchase Req. Number")));
            //Caption = 'Amount';
            //Editable = false;
            FieldClass = FlowField; */
        }
        field(21; "Termination Reason"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Region Code"; Code[100])
        {
            /* TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGIONS'));
            trigger OnValidate()
            var
                Dimval: Record "Dimension Value";
            begin
                if Dimval.Get("Region Code") then begin
                    "Region Name" := Dimval.Name;
                end;
            end; */
            // CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = filter('Region|Regions'));


            trigger OnValidate()
            var
                DimVal: Record "Dimension Value";
            begin
                DimVal.RESET;
                DimVal.SETRANGE(DimVal.Code, "Region Code");
                IF DimVal.FIND('-') THEN
                    "Region Name" := DimVal.Name
            end;
        }
        field(23; "Region Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Startt Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Endd Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Insurance Company"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Amount"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "First ToR"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Second ToR"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Third ToR"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Fourth ToR"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Fifth ToR"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.", "Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IF "Code" = '' THEN BEGIN
            NoSeriesMgt.InitSeries('CONTRACTCASES', xRec."No Series", 0D, "Code", "No Series");
        END;
        "User Id" := USERID;
        "Date Created" := CURRENTDATETIME;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}