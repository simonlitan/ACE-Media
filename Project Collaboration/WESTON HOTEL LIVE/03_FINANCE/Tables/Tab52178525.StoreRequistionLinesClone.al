table 52178525 "Store Requistion Lines Clone"
{
    fields
    {
        field(1; "Requistion No"; Code[20])
        {
            trigger OnValidate()
            begin
                /*
                  IF ReqHeader.GET("Requistion No") THEN BEGIN
                    IF ReqHeader."Global Dimension 1 Code"='' THEN
                       ERROR('Please Select the Global Dimension 1 Requisitioning')
                  END;
                 */
            end;
        }
        field(3; "Line No."; Integer)
        {
            //AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = 'Item';
            OptionMembers = Item;
        }
        field(5; "No."; Code[20])
        {
            Caption = 'No.';
            //TableRelation = Item WHERE(Blocked = CONST(false));

            trigger OnValidate()
            begin

            end;
        }
        field(6; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(7; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            begin
            end;
        }
        field(9; "Qty in store"; Decimal)
        {
            FieldClass = Normal;
        }
        field(10; "Request Status"; Option)
        {
            Editable = true;
            FieldClass = Normal;
            OptionMembers = Pending,Released,"Director Approval","Budget Approval","FD Approval","CEO Approval",Approved,Closed;
        }
        field(11; "Action Type"; Option)
        {
            OptionMembers = " ",Issue,"Ask for Quote";

            trigger OnValidate()
            begin
                IF Type = Type::Item THEN BEGIN
                    IF "Action Type" = "Action Type"::Issue THEN
                        ERROR('You cannot Issue a G/L Account please order for it')
                END;
                //Compare Quantity in Store and Qty to Issue
                IF Type = Type::Item THEN BEGIN
                    IF "Action Type" = "Action Type"::Issue THEN BEGIN
                        IF Quantity > "Qty in store" THEN
                            ERROR('You cannot Issue More than what is available in store')
                    END;
                END;
            end;
        }
        field(12; "Unit of Measure"; Code[20])
        {
            // TableRelation = "Unit of Measure";
        }
        field(13; "Total Budget"; Decimal)
        {
        }
        field(14; "Current Month Budget"; Decimal)
        {
        }
        field(15; "Unit Cost"; Decimal)
        {

            trigger OnValidate()
            begin
                // IF Type=Type::Item THEN
                "Line Amount" := "Unit Cost" * Quantity;
            end;
        }
        field(16; "Line Amount"; Decimal)
        {
        }
        field(17; "Quantity Requested"; Decimal)
        {
            Caption = 'Quantity Requested';
            DecimalPlaces = 0 : 5;
        }
        field(24; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(25; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(26; "Current Actuals Amount"; Decimal)
        {
        }
        field(27; Committed; Boolean)
        {
        }
        field(57; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            // TableRelation = "Gen. Business Posting Group";
        }
        field(58; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            //   TableRelation = "Gen. Product Posting Group";
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            // TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PRODUCT'));
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(83; "Issuing Store"; Code[20])
        {
            // TableRelation = Location;
        }
        field(84; "Bin Code"; Code[20])
        {
            //TableRelation = Bin.Code WHERE("Location Code" = FIELD("Issuing Store"));
        }
        field(85; "FA No."; Code[20])
        {
            // TableRelation = "Fixed Asset"."No.";
        }
        field(86; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            // TableRelation = Maintenance;

            trigger OnValidate()
            begin
                /*
                IF "Maintenance Code" <> '' THEN
                  TESTFIELD("FA Posting Type","FA Posting Type"::Maintenance);
                */

            end;
        }
        field(87; "Last Date of Issue"; Date)
        {
        }
        field(88; "Last Quantity Issued"; Decimal)
        {
        }
        field(89; Remarks; Text[250])
        {
        }
        field(53900; "Lot No."; Code[20])
        {
            Caption = 'Lot No.';
            Editable = false;
        }
        field(53901; "Item Status"; Option)
        {
            OptionMembers = ,Functional,Faulty;
        }
        field(53902; "Product Group"; Code[20])
        {
            CalcFormula = Lookup(Item."Item Category Code" WHERE("No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(54000; Test; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(54001; "Location Filter"; Code[100])
        {
            FieldClass = FlowFilter;
            // TableRelation = Location.Code;
        }
        field(51516000; Posted; Boolean)
        {
        }
        field(51516001; "Posting Date"; text[20])
        {
        }
        field(51516002; "Category Code"; Code[20])
        {
        }
        field(51516003; "Item Group"; Code[20])
        {
        }
        field(51516004; "Item Product Group"; Code[20])
        {
        }
        field(51516006; "Category Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Item Category".Code;
        }
        field(51516007; "Cost Center Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(51516008; "Date Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(51516009; "Item Product Group Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            //TableRelation = "Product Group".Code;
        }
        field(51516010; "Cost Per Cost Center"; Decimal)
        {
        }
        field(51516011; Status; Option)
        {
            CalcFormula = Lookup("PROC-Store Requistion Header".Status WHERE("No." = FIELD("No.")));
            Editable = true;
            FieldClass = FlowField;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;
        }
        field(51516012; "Qty balance"; Decimal)
        {
        }
        field(51516013; "Quantity To Issue"; Decimal)
        {
        }
        field(51516014; "Quantity Issued"; Decimal)
        {
        }
        field(51516015; "Issue Quantity"; Decimal)
        {
        }
        field(51516016; "Budget Name"; Code[20])
        {
        }
        field(51516017; "Budget Balance"; Decimal)
        {
        }
        field(51516018; "Vote Account"; Code[20])
        {
        }
        field(51516019; "Issue UserID"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Requistion No")
        {
            Clustered = true;
            // SumIndexFields = "Line Amount";
        }
        key(Key2; "No.", Type)
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        // ReqHeader.RESET;
        // ReqHeader.SETRANGE(ReqHeader."No.", "Requistion No");
        // IF ReqHeader.FIND('-') THEN
        //     IF ReqHeader.Status <> ReqHeader.Status::Open THEN
        //         IF UserSet.GET(USERID) THEN
        //             IF UserSet."Modify Store Req. Quantities" = FALSE THEN
        //                 ERROR('You Cannot Delete Entries if status is not open')
    end;

    trigger OnInsert()
    begin
        "Line Amount" := "Unit Cost" * Quantity;

        ReqHeader.RESET;
        ReqHeader.SETRANGE(ReqHeader."No.", "Requistion No");
        IF ReqHeader.FIND('-') THEN BEGIN
            IF ReqHeader."Global Dimension 1 Code" = '' THEN ERROR('Please enter the branch code!');
            IF ReqHeader."Shortcut Dimension 2 Code" = '' THEN ERROR('Please enter the cost center code!');


            "Shortcut Dimension 1 Code" := ReqHeader."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := ReqHeader."Shortcut Dimension 2 Code";
            "Shortcut Dimension 3 Code" := ReqHeader."Shortcut Dimension 3 Code";
            "Shortcut Dimension 4 Code" := ReqHeader."Shortcut Dimension 4 Code";
            // "Issuing Store":=ReqHeader."Issuing Store";
            // IF ReqHeader.Status<>ReqHeader.Status::Open THEN
            //   ERROR('You Cannot Enter Entries if status is not Pending')
        END;
    end;

    trigger OnModify()
    begin
        IF Type = Type::Item THEN
            "Line Amount" := "Unit Cost" * Quantity;

        /*ReqHeader.RESET;
         ReqHeader.SETRANGE(ReqHeader."No.","Requistion No");
         IF ReqHeader.FIND('-') THEN BEGIN
          IF ReqHeader.Status<>ReqHeader.Status::Open THEN
          IF UserSet.GET(USERID) THEN
          IF UserSet."Modify Store Req. Quantities"=FALSE THEN
              ERROR('You Cannot Modify Entries if status is not Pending')
         END;
            */

    end;

    var
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "PROC-Store Requistion Header";
        BudgetDate: Date;
        YrBudget: Decimal;
        RequisitionLine: Record "Store Requistion Lines Clone";
        Text031: Label 'You cannot define item tracking on this line because it is linked to production order %1.';
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
        Items: Record Item;
        LocCode: Code[20];
        Qty: Decimal;
        RmgQty: Decimal;
        QtyRem: Decimal;
        UserSet: Record "User Setup";


    procedure OpenItemTrackingLines()
    begin
        TESTFIELD(Type, Type::Item);
        TESTFIELD("No.");
        IF "Lot No." <> '' THEN
            ERROR(Text031, "Lot No.");

        TESTFIELD(Quantity);

        //ReservePurchLine.CallItemTrackingS11(Rec);
    end;
}

