page 52178515 "Approved PRN Lines"
{
    AutoSplitKey = true;
    Caption = 'Approved PRN Lines';
    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Purchase Line";
    SourceTableView = WHERE("Document Type" = FILTER(quote), "Document Type 2" = filter(requisition),
                            Ordered = CONST(false),
                            Status = CONST(Released),
                           "Fully Issued" = CONST(false));

    layout
    {
        area(content)
        {
            repeater(GENERAL)
            {
                field("PO Type"; Rec."PO Type")
                {
                    ApplicationArea = All;
                }
                field(Select; Rec.Select2)
                {

                    NotBlank = true;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Ordered; Rec.Ordered)
                {
                    Visible = false;
                    ApplicationArea = All;
                }


                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        IF Vendor.GET(Rec."Buy-from Vendor No.") THEN BEGIN
                            // PIN := Vendor."VAT Registration No.";
                        END;
                    end;
                }
                /* field(PIN; PIN)
                {
                    ApplicationArea = All;
                } */
                field("PO Number"; Rec."PO Number")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Selected By"; Rec."Selected By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

                field(Category; Rec.Category)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                /* field("Service/Item Code"; "Service/Item Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                } */
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                    end;
                }
                /* field("Type of Vehicle"; "Type of Vehicle")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Description"; "Vehicle Description")
                {
                    ApplicationArea = All;
                } */
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    BlankZero = true;
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("VAT %"; Rec."VAT %")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    BlankZero = true;
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = false;
                    Visible = true;
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {


            action("Add to Purchase Order")
            {
                Caption = 'Add to Purchase Order';
                Image = AddAction;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //OpenSalesOrderForm;


                    IF CONFIRM(Text002, FALSE) = TRUE THEN BEGIN

                        ReqLine.RESET;
                        ReqLine.SETRANGE(ReqLine."Document Type 2", ReqLine."Document Type 2"::Requisition);
                        ReqLine.SETRANGE(ReqLine.Select2, TRUE);
                        ReqLine.SETRANGE(ReqLine.Ordered, FALSE);

                        ReqLine.SETRANGE(ReqLine."Selected By", USERID);
                        //ReqLine.SETFILTER(ReqLine.Category,'<>%1',ReqLine.Category::Item);
                        IF ReqLine.FIND('-') THEN BEGIN
                            REPEAT
                                PURCHLINE.RESET;
                                PURCHLINE.SETRANGE(PURCHLINE."Document Type", PURCHLINE."Document Type"::Order);
                                PURCHLINE.SETRANGE(PURCHLINE."Document No.", ReqLine."PO Number");


                                IF PURCHLINE.FIND('-') THEN BEGIN
                                    REPEAT
                                        LineNo := PURCHLINE."Line No.";
                                    //MESSAGE('%1',ReqLine."No.");
                                    UNTIL PURCHLINE.NEXT = 0;
                                END ELSE BEGIN

                                    LineNo := 0;
                                END;

                                /*


                                //MESSAGE('%1',ReqLine."No.");
                                PURCHLINE.RESET;
                                PURCHLINE.SETRANGE(PURCHLINE."Document Type",PURCHLINE."Document Type"::Order);
                                PURCHLINE.SETRANGE(PURCHLINE."Document No.",ReqLine."PO Number");
                                PURCHLINE.SETRANGE(PURCHLINE.Type,ReqLine.Type);
                                PURCHLINE.SETRANGE(PURCHLINE."No.",ReqLine."No.");

                                IF PURCHLINE.FINDFIRST=FALSE  THEN BEGIN
                                repeat
                                 // MESSAGE('%1',ReqLine."Service/Item Code");


                                */


                                //MESSAGE('%1',ReqLine."No.");
                                PURCHLINE.INIT;
                                PURCHLINE."Line No." := LineNo + 10000;

                                PURCHLINE."Document Type" := PURCHLINE."Document Type"::Order;
                                PURCHLINE."Document No." := ReqLine."PO Number";
                                //MESSAGE('%1',ReqLine."No.");
                                PURCHLINE.Type := ReqLine.Type;
                                //PURCHLINE.VALIDATE(PURCHLINE.Type);
                                PURCHLINE."No." := ReqLine."No.";
                                IF Rec.Type = Rec.Type::"G/L Account" THEN BEGIN
                                    IF Acct.GET(ReqLine."No.") THEN BEGIN
                                        PURCHLINE."Gen. Bus. Posting Group" := Acct."Gen. Bus. Posting Group";
                                        PURCHLINE."Gen. Prod. Posting Group" := Acct."Gen. Prod. Posting Group";
                                        PURCHLINE."VAT Bus. Posting Group" := Acct."VAT Bus. Posting Group";
                                        PURCHLINE."VAT Prod. Posting Group" := Acct."VAT Prod. Posting Group";
                                    END;

                                END;
                                PURCHLINE.Category := ReqLine.Category;
                                //PURCHLINE.VALIDATE(PURCHLINE.Category);
                                //PURCHLINE."Item Category" := ReqLine."Item Category";

                                // PURCHLINE."Service/Item Code" := ReqLine."Service/Item Code";
                                PURCHLINE."Location Code" := ReqLine."Location Code";
                                //PURCHLINE.VALIDATE(PURCHLINE."Service/Item Code");
                                //PURCHLINE.Type:=ReqLine.Type;
                                //PURCHLINE.VALIDATE(PURCHLINE.Type);
                                // PURCHLINE.Quantity := ReqLine."Qty. Requested";
                                //PURCHLINE.VALIDATE(PURCHLINE.Quantity);

                                IF PURCHLINE.Type = PURCHLINE.Type::"G/L Account" THEN BEGIN
                                    PURCHLINE."Job No." := ReqLine."Job No.";

                                    PURCHLINE."Job Task No." := ReqLine."Job Task No.";


                                END;

                                PURCHLINE.INSERT(TRUE);
                                //MESSAGE('%1',PURCHLINE."Service/Item Code");
                                //END;

                                // PURCHLINE.VALIDATE("Service/Item Code");
                                PURCHLINE."No." := ReqLine."No.";

                                //IF PURCHLINE.Type=PURCHLINE.Type::"G/L Account" THEN BEGIN
                                //PURCHLINE.VALIDATE(PURCHLINE."No.");
                                PURCHLINE.Description := ReqLine.Description;
                                PURCHLINE."Direct Unit Cost" := ReqLine."Direct Unit Cost";
                                PURCHLINE.VALIDATE(PURCHLINE."Direct Unit Cost");
                                PURCHLINE."Dimension Set ID" := ReqLine."Dimension Set ID";
                                PURCHLINE.VALIDATE(PURCHLINE."Dimension Set ID");
                                //;
                                PURCHLINE.VALIDATE("Job No.");
                                PURCHLINE.VALIDATE("Job Task No.");
                                PURCHLINE.MODIFY;
                                //END;
                                //PURCHLINE.VALIDATE("Service/Item Code");
                                //PURCHLINE.VALIDATE(PURCHLINE.Category);
                                PURCHLINE.VALIDATE(PURCHLINE.Quantity);
                                LineNo := LineNo + 10000;
                            //END;



                            UNTIL ReqLine.NEXT = 0;
                        END;


                        ReqLine.RESET;
                        ReqLine.SETRANGE(ReqLine."Document Type 2", ReqLine."Document Type 2"::Requisition);
                        ReqLine.SETRANGE(ReqLine.Select2, TRUE);
                        ReqLine.SETRANGE(ReqLine.Ordered, FALSE);
                        ReqLine.SETRANGE(ReqLine."Selected By", USERID);


                        IF ReqLine.FIND('-') THEN BEGIN
                            REPEAT

                                PURCHLINE.RESET;
                                PURCHLINE.SETRANGE(PURCHLINE."Document Type", PURCHLINE."Document Type"::Order);
                                PURCHLINE.SETRANGE(PURCHLINE."Document No.", ReqLine."PO Number");
                                PURCHLINE.SETRANGE(PURCHLINE.Type, ReqLine.Type);
                                PURCHLINE.SETRANGE(PURCHLINE."No.", ReqLine."No.");

                                IF PURCHLINE.FINDFIRST THEN BEGIN



                                    PURCHLINE.Category := ReqLine.Category;
                                    // PURCHLINE."Service/Item Code" := ReqLine."Service/Item Code";
                                    PURCHLINE."Location Code" := ReqLine."Location Code";
                                    PURCHLINE.Description := ReqLine.Description;
                                    PURCHLINE.MODIFY;
                                    /*
                                    //BEGIN--insert line dimension
                                     DocDim.RESET;
                                     DocDim.SETRANGE(DocDim."Table ID",39);
                                     DocDim.SETRANGE(DocDim."Document Type",ReqLine."Document Type");
                                     DocDim.SETRANGE(DocDim."Document No.",ReqLine."Document No.");
                                     DocDim.SETRANGE(DocDim."Line No.",ReqLine."Line No.");

                                     IF DocDim.FIND('-') THEN BEGIN
                                     REPEAT

                                     IF DocDim2.GET(38,PURCHLINE."Document Type"::Order,PURCHLINE."Document No.",0,DocDim."Dimension Code")
                                     THEN BEGIN
                                     DocDim2."Dimension Code":=DocDim."Dimension Code";
                                     DocDim2.VALIDATE( DocDim2."Dimension Code");
                                     DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                     DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                     DocDim2."Dimension Code":=DocDim."Dimension Code";
                                     DocDim2.MODIFY;

                                     END ELSE BEGIN
                                     DocDim2.INIT;
                                     DocDim2."Table ID":=38;
                                     DocDim2."Document Type":=PURCHLINE."Document Type";
                                     DocDim2."Document No.":=PURCHLINE."Document No.";
                                     DocDim2."Line No.":=0;
                                     DocDim2."Dimension Code":=DocDim."Dimension Code";
                                     DocDim2.VALIDATE( DocDim2."Dimension Code");
                                     DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                     DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                     DocDim2.INSERT(TRUE);

                                     END;


                                     IF DocDim2.GET(39,PURCHLINE."Document Type"::Order,PURCHLINE."Document No.",PURCHLINE."Line No.",DocDim."Dimension Code")
                                     THEN BEGIN
                                     DocDim2."Dimension Code":=DocDim."Dimension Code";
                                     DocDim2.VALIDATE( DocDim2."Dimension Code");
                                     DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                     DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                     DocDim2."Dimension Code":=DocDim."Dimension Code";
                                     DocDim2.MODIFY;

                                     END ELSE BEGIN
                                     DocDim2.INIT;
                                     DocDim2."Table ID":=39;
                                     DocDim2."Document Type":=PURCHLINE."Document Type";
                                     DocDim2."Document No.":=PURCHLINE."Document No.";
                                     DocDim2."Line No.":=PURCHLINE."Line No.";
                                     DocDim2."Dimension Code":=DocDim."Dimension Code";
                                     DocDim2.VALIDATE( DocDim2."Dimension Code");
                                     DocDim2."Dimension Value Code":=DocDim."Dimension Value Code";
                                     DocDim2.VALIDATE(DocDim2."Dimension Value Code");
                                     DocDim2.INSERT(TRUE);

                                     END;

                                     UNTIL DocDim.NEXT=0;
                                     END;


                                    //END--insert line dimension

                                    */


                                END;

                                ReqLine."Ordered by" := USERID;
                                ReqLine."Order Creation date" := TODAY;
                                ReqLine."Order Creation Time" := TIME;
                                ReqLine.Ordered := TRUE;
                                ReqLine.MODIFY;
                            UNTIL ReqLine.NEXT = 0;
                        END;


                        /*

                       //MESSAGE('%1',ReqLine."No.");
                        ReqLine2.RESET;
                        ReqLine2.SETRANGE(ReqLine2.Type,ReqLine.Type);
                        ReqLine2.SETRANGE(ReqLine2."No.",ReqLine."No.");
                        ReqLine2.SETFILTER(ReqLine2."Document No.",'>%1',ReqLine."Document No.");

                       IF ReqLine2.FIND('-') THEN BEGIN

                       REPEAT
                       //MESSAGE('%1',ReqLine."No.");
                       PURCHLINE.RESET;
                       PURCHLINE.SETRANGE(PURCHLINE."Document Type",PURCHLINE."Document Type"::Order);
                       PURCHLINE.SETRANGE(PURCHLINE."Document No.",ReqLine."PO Number");
                       PURCHLINE.SETRANGE(PURCHLINE.Type,ReqLine.Type);
                       PURCHLINE.SETRANGE(PURCHLINE."No.",ReqLine."No.");

                       IF PURCHLINE.FINDFIRST  THEN BEGIN
                       PURCHLINE.Quantity:=PURCHLINE.Quantity+ReqLine2."Qty. Requested";
                       PURCHLINE.VALIDATE(PURCHLINE.Quantity);
                       PURCHLINE.MODIFY;
                       END;


                       UNTIL ReqLine2.NEXT=0;
                       END;
                       */

                    END;

                end;
            }
            action("CreatePurchase Order")
            {
                Caption = 'Create Purchase Order';
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    IF CONFIRM(Text003, FALSE) = TRUE THEN BEGIN
                        ReqLine.RESET;
                        ReqLine.SETRANGE(ReqLine."Document Type", ReqLine."Document Type 2"::Requisition);
                        ReqLine.SETRANGE(ReqLine.Select2, TRUE);
                        ReqLine.SETRANGE(ReqLine.Ordered, FALSE);
                        ReqLine.SETRANGE(ReqLine."Selected By", USERID);
                        IF ReqLine.FINDFIRST THEN BEGIN
                            //insert purchase header
                            //IF ReqLine."Buy-from Vendor No." = xRec."Buy-from Vendor No." THEN BEGIN
                            PurchaseHeader.INIT;
                            GLSetup.GET;
                            GLSetup.TESTFIELD("Order Nos.");
                            GLSetup.TESTFIELD(GLSetup."LSO Nos");
                            IF ReqLine."PO Type" = ReqLine."PO Type"::LPO THEN BEGIN
                                NoSeriesMgt.InitSeries(GLSetup."Order Nos.", ' ', 0D, LineNo2, PurchaseHeader."No. Series");
                                LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."Order Nos.", WORKDATE, TRUE);
                                PurchaseHeader."No. Series" := GLSetup."Order Nos.";
                                PurchaseHeader."Document Type 2" := PurchaseHeader."Document Type 2"::requisition;
                            END ELSE
                                IF ReqLine."PO Type" = ReqLine."PO Type"::LSO THEN BEGIN
                                    NoSeriesMgt.InitSeries(GLSetup."LSO Nos", ' ', 0D, LineNo2, PurchaseHeader."No. Series");
                                    LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."LSO Nos", WORKDATE, TRUE);
                                    PurchaseHeader."No. Series" := GLSetup."LSO Nos";
                                    PurchaseHeader."Document Type 2" := PurchaseHeader."Document Type 2"::requisition;
                                END;

                            PurchaseHeader."No." := LineNo2;
                            PurchaseHeader."Posting No. Series" := GLSetup."Posted Invoice Nos.";
                            PurchaseHeader."Buy-from Vendor No." := Rec."Buy-from Vendor No.";
                            PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
                            PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Order;
                            PurchaseHeader."Document Date" := WORKDATE;
                            PurchaseHeader."Posting Date" := WORKDATE;
                            PurchaseHeader."Vendor Order No." := Rec."Document No.";
                            PurchaseHeader."Order Date" := WORKDATE;
                            PurchaseHeader."Posting Description" := 'Order  ' + PurchaseHeader."No.";
                            PurchaseHeader."Prepayment Due Date" := WORKDATE;
                            PurchaseHeader."Vendor Invoice No." := ReqLine."No.";

                            PurchaseHeader."Pay-to Vendor No." := ReqLine."Buy-from Vendor No.";
                            PurchaseHeader.VALIDATE(PurchaseHeader."Pay-to Vendor No.");
                            PurchaseHeader."Due Date" := WORKDATE;
                            PurchaseHeader."Expected Receipt Date" := WORKDATE;
                            PurchaseHeader."Currency Factor" := 1;
                            PurchaseHeader."Dimension Set ID" := ReqLine."Dimension Set ID";
                            PurchaseHeader.INSERT(TRUE);
                        END;

                        ReqLine.RESET;
                        ReqLine.SETRANGE(ReqLine."Document Type 2", ReqLine."Document Type 2"::Requisition);
                        ReqLine.SETRANGE(ReqLine.Select2, TRUE);
                        ReqLine.SETRANGE(ReqLine.Ordered, FALSE);
                        ReqLine.SETRANGE(ReqLine."Selected By", USERID);
                        IF ReqLine.FIND('-') THEN BEGIN
                            REPEAT

                                /*
                                //insert the lines
                                ReqLine2.RESET;
                                ReqLine2.SETRANGE(ReqLine2."Buy-from Vendor No.",ReqLine."Buy-from Vendor No.");
                                ReqLine2.SETRANGE(ReqLine2."PO Type",ReqLine."PO Type");
                                IF ReqLine2.FIND('-') THEN
                                BEGIN
                                  REPEAT*/
                                purchaseLine.INIT;
                                purchaseLine."Document Type" := purchaseLine."Document Type"::Order;
                                purchaseLine."Document No." := PurchaseHeader."No.";
                                purchaseLine."Buy-from Vendor No." := ReqLine."Buy-from Vendor No.";
                                purchaseLine."Pay-to Vendor No." := ReqLine."Buy-from Vendor No.";
                                purchaseLine."Line No." := ReqLine."Line No.";
                                purchaseLine.Type := ReqLine.Type;
                                purchaseLine."No." := ReqLine."No.";
                                purchaseLine.Description := PADSTR(ReqLine.Description, 50);
                                // purchaseLine."Service/Item Code" := ReqLine."Service/Item Code";
                                purchaseLine."Job No." := ReqLine."Job No.";
                                purchaseLine."Job Task No." := ReqLine."Job Task No.";
                                purchaseLine.Quantity := ReqLine.Quantity;
                                purchaseLine."Location Code" := ReqLine."Location Code";
                                purchaseLine.VALIDATE(purchaseLine.Quantity);
                                purchaseLine."Direct Unit Cost" := ReqLine."Direct Unit Cost";
                                purchaseLine.VALIDATE(purchaseLine."Direct Unit Cost");
                                purchaseLine."Line Amount" := ReqLine."Line Amount";
                                purchaseLine."Unit of Measure" := ReqLine."Unit of Measure";
                                purchaseLine."Unit of Measure Code" := ReqLine."Unit of Measure Code";
                                purchaseLine."Dimension Set ID" := ReqLine."Dimension Set ID";
                                purchaseLine.VALIDATE(purchaseLine."Shortcut Dimension 1 Code");
                                purchaseLine.VALIDATE(purchaseLine."Shortcut Dimension 2 Code");
                                purchaseLine."Gen. Bus. Posting Group" := ReqLine."Gen. Bus. Posting Group";
                                purchaseLine."Gen. Prod. Posting Group" := ReqLine."Gen. Prod. Posting Group";
                                purchaseLine."VAT Bus. Posting Group" := ReqLine."VAT Bus. Posting Group";
                                purchaseLine."VAT Prod. Posting Group" := ReqLine."VAT Prod. Posting Group";
                                purchaseLine.INSERT(TRUE);
                                //UNTIL ReqLine2.NEXT=0;
                                //END;
                                /*
                                ReqLine."Ordered by":=USERID;
                                ReqLine."Order Creation date":=TODAY;
                                ReqLine."Order Creation Time":=TIME;
                                ReqLine.Ordered:=TRUE;
                                ReqLine.MODIFY;
                                */
                                MESSAGE('Purchase order no %1 created successfully', PurchaseHeader."No.");
                            UNTIL ReqLine.NEXT = 0;
                        END;

                    END;

                    //END;
                    //END;
                    //CurrPage.CLOSE();

                end;
            }
            action("Create Purchase Order")
            {
                Caption = 'Generate Purchase Order';
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ApplicationArea = All;

                trigger OnAction()
                begin

                    IF CONFIRM(Text003, FALSE) = TRUE THEN BEGIN

                        //different selected lines

                        ReqLine.RESET;
                        ReqLine.SETRANGE(ReqLine."Document Type 2", ReqLine."Document Type 2"::Requisition);
                        ReqLine.SETRANGE(ReqLine.Select2, TRUE);
                        ReqLine.SETRANGE(ReqLine.Ordered, FALSE);
                        ReqLine.SETRANGE(ReqLine."Selected By", USERID);
                        IF ReqLine.FIND('-') THEN BEGIN
                            REPEAT
                                //insert purchase header
                                PurchaseHeader.INIT;
                                GLSetup.GET;
                                GLSetup.TESTFIELD("Order Nos.");
                                GLSetup.TESTFIELD(GLSetup."LSO Nos");
                                IF ReqLine."PO Type" = ReqLine."PO Type"::LPO THEN BEGIN
                                    NoSeriesMgt.InitSeries(GLSetup."Order Nos.", ' ', 0D, LineNo2, PurchaseHeader."No. Series");
                                    LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."Order Nos.", WORKDATE, TRUE);
                                    PurchaseHeader."No. Series" := GLSetup."Order Nos.";
                                    PurchaseHeader."Document type" := PurchaseHeader."Document type"::order;
                                END ELSE
                                    IF ReqLine."PO Type" = ReqLine."PO Type"::LSO THEN BEGIN
                                        NoSeriesMgt.InitSeries(GLSetup."LSO Nos", ' ', 0D, LineNo2, PurchaseHeader."No. Series");
                                        LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."LSO Nos", WORKDATE, TRUE);
                                        PurchaseHeader."No. Series" := GLSetup."LSO Nos";
                                        PurchaseHeader."Document type" := PurchaseHeader."Document type"::order;
                                    END;

                                PurchaseHeader."No." := LineNo2;
                                PurchaseHeader."Posting No. Series" := GLSetup."Posted Invoice Nos.";
                                PurchaseHeader."Buy-from Vendor No." := ReqLine."Buy-from Vendor No.";
                                PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
                                // PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::quote;
                                PurchaseHeader."Document Date" := WORKDATE;
                                PurchaseHeader."Posting Date" := WORKDATE;
                                PurchaseHeader."Vendor Order No." := ReqLine."Document No.";
                                PurchaseHeader."Order Date" := WORKDATE;
                                PurchaseHeader."Posting Description" := PurchaseHeader."No.";
                                PurchaseHeader."Prepayment Due Date" := WORKDATE;
                                // PurchaseHeader."Vendor Invoice No." := ReqLine."No.";
                                PurchaseHeader."Assigned User ID" := USERID;
                                PurchaseHeader."Pay-to Vendor No." := ReqLine."Buy-from Vendor No.";
                                PurchaseHeader.VALIDATE(PurchaseHeader."Pay-to Vendor No.");
                                PurchaseHeader."Due Date" := WORKDATE;
                                PurchaseHeader."Expected Receipt Date" := WORKDATE;
                                PurchaseHeader."Currency Factor" := 1;
                                PurchaseHeader."Dimension Set ID" := ReqLine."Dimension Set ID";
                                PurchaseHeader.INSERT(TRUE);


                                //insert the lines
                                ReqLine2.RESET;
                                ReqLine2.SETRANGE(ReqLine2."Buy-from Vendor No.", ReqLine."Buy-from Vendor No.");
                                ReqLine2.SETRANGE(ReqLine2."PO Type", ReqLine."PO Type");
                                IF ReqLine2.FIND('-') THEN BEGIN
                                    REPEAT
                                        purchaseLine.INIT;
                                        purchaseLine."Document Type" := purchaseLine."Document Type"::Order;
                                        purchaseLine."Document No." := PurchaseHeader."No.";
                                        purchaseLine."Buy-from Vendor No." := ReqLine2."Buy-from Vendor No.";
                                        purchaseLine."Pay-to Vendor No." := ReqLine2."Buy-from Vendor No.";
                                        purchaseLine."Line No." := ReqLine2."Line No.";
                                        purchaseLine.Type := ReqLine2.Type;
                                        purchaseLine."No." := ReqLine2."No.";
                                        purchaseLine.Description := PADSTR(ReqLine2.Description, 50);
                                        // purchaseLine."Service/Item Code" := ReqLine2."Service/Item Code";
                                        purchaseLine."Job No." := ReqLine2."Job No.";
                                        purchaseLine."Job Task No." := ReqLine2."Job Task No.";
                                        purchaseLine.Quantity := ReqLine2.Quantity;
                                        purchaseLine."Location Code" := ReqLine2."Location Code";
                                        purchaseLine.VALIDATE(purchaseLine.Quantity);
                                        purchaseLine."Direct Unit Cost" := ReqLine2."Direct Unit Cost";
                                        purchaseLine.VALIDATE(purchaseLine."Direct Unit Cost");
                                        purchaseLine."Line Amount" := ReqLine2."Line Amount";
                                        purchaseLine."Unit of Measure" := ReqLine2."Unit of Measure";
                                        purchaseLine."Unit of Measure Code" := ReqLine2."Unit of Measure Code";
                                        purchaseLine."Dimension Set ID" := ReqLine."Dimension Set ID";
                                        purchaseLine.VALIDATE(purchaseLine."Shortcut Dimension 1 Code");
                                        purchaseLine.VALIDATE(purchaseLine."Shortcut Dimension 2 Code");
                                        purchaseLine."Gen. Bus. Posting Group" := ReqLine2."Gen. Bus. Posting Group";
                                        purchaseLine."Gen. Prod. Posting Group" := ReqLine2."Gen. Prod. Posting Group";
                                        purchaseLine."VAT Bus. Posting Group" := ReqLine2."VAT Bus. Posting Group";
                                        purchaseLine."VAT Prod. Posting Group" := ReqLine2."VAT Prod. Posting Group";
                                        purchaseLine.INSERT(TRUE);
                                    UNTIL ReqLine2.NEXT = 0;
                                END;


                                ReqLine."Ordered by" := USERID;
                                ReqLine."Order Creation date" := TODAY;
                                ReqLine."Order Creation Time" := TIME;
                                ReqLine.Ordered := TRUE;
                                ReqLine.MODIFY;

                                MESSAGE('Purchase order no %1 created successfully', PurchaseHeader."No.");
                            UNTIL ReqLine.NEXT = 0;
                        END;
                    END;




                    //END;
                    //END;
                    //CurrPage.CLOSE();
                end;
            }
            action("Process Order")
            {
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    IF CONFIRM(Text004, FALSE) THEN BEGIN
                        //PurchaseHeader.INIT;
                        GLSetup.GET;
                        GLSetup.TESTFIELD("Order Nos.");
                        GLSetup.TESTFIELD("LSO Nos");
                        rec.TestField(Select2);
                        rec.TestField("PO Type");
                        /*                      IF ReqLine."PO Type" = ReqLine."PO Type"::LPO THEN BEGIN
                                                 NoSeriesMgt.InitSeries(GLSetup."Order Nos.", ' ', 0D, LineNo2, PurchaseHeader."No. Series");
                                                 LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."Order Nos.", WORKDATE, TRUE);
                                                 PurchaseHeader."No. Series" := GLSetup."Order Nos.";
                                                 PurchaseHeader."Document type" := PurchaseHeader."Document type"::order;
                                                 // PurchHeader."Assigned User ID" := UserId;
                                             END ELSE */
                        IF ReqLine."PO Type" = ReqLine."PO Type"::LPO THEN BEGIN
                            NoSeriesMgt.InitSeries(GLSetup."LSO Nos", ' ', 0D, LineNo2, PurchaseHeader."No. Series");
                            LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."LSO Nos", WORKDATE, TRUE);
                            PurchaseHeader."No. Series" := GLSetup."LSO Nos";
                            PurchaseHeader."Document type" := PurchaseHeader."Document type"::order;
                            //PurchHeader."Assigned User ID" := UserId;
                        END;

                        PurchaseHeader."No." := LineNo2;
                        // PurchHeader."Assigned User ID" := UserId;

                        RequsitionManager.RequisitionReview(Rec);
                        //RequsitionManager.ChangeDocHeaderStatus("Document No.");

                        purchaseLine.RESET;
                        purchaseLine.SETRANGE(purchaseLine.Select2, TRUE);
                        IF purchaseLine.FIND('-') THEN BEGIN
                            REPEAT
                                //MESSAGE('%1',purchaseLine."Document No.");
                                purchaseLine."Ordered by" := USERID;
                                purchaseLine."Order Creation date" := TODAY;
                                purchaseLine."Order Creation Time" := TIME;
                                purchaseLine.Select2 := FALSE;
                                purchaseLine."Buy-from Vendor No." := Rec."Buy-from Vendor No.";
                                purchaseLine."PO Type" := Rec."PO Type";
                                purchaseLine.Ordered := TRUE;


                                purchaseLine.MODIFY;
                                MESSAGE('Purchase order no %1 %2 created successfully', PurchaseHeader."No.");
                            UNTIL purchaseLine.NEXT = 0;
                        END;


                    END;
                end;
            }

        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
        IF (Rec.Quantity <> 0) AND Rec.ItemExists(Rec."No.") THEN BEGIN
            COMMIT;
            IF NOT ReservePurchLine.DeleteLineConfirm(Rec) THEN
                EXIT(FALSE);
            ReservePurchLine.DeleteLine(Rec);
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitType;
        CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin
        // IF UserSetup.GET(USERID) THEN BEGIN
        //IF UserSetup."Procurement officer" = FALSE THEN
        // ERROR(Text006);
        // END;
    end;

    var
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        ShortcutDimCode: array[8] of Code[20];
        UpdateAllowedVar: Boolean;
        Text000: Label 'Unable to execute this function while in view only mode.';
        PurchHeader: Record "Purchase Header";

        Text001: Label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
        PO: Record "Purchase Header";
        PURCHLINE: Record "Purchase Line";
        ReqLine: Record "Purchase Line";
        ReqLine2: Record "Purchase Line";
        LineNo: Integer;
        Acct: Record "G/L Account";
        DocDim: Record "Dimension Set Entry";
        DocDim2: Record "Dimension Set Entry";
        Text002: Label 'The seleceted lines will be assigned to the specified LPO/LSO. Are you sure this is what you want?';
        Text003: Label 'The seleceted lines will be used to create LPO. Are you sure this is what you want?';
        GLSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LineNo2: Code[20];
        gCuNoSeriesMngmnt: Codeunit NoSeriesManagement;
        PurchaseHeader: Record "Purchase Header";
        purchaseLine: Record "Purchase Line";
        Text004: Label 'Do you want to proceed and perform the selected action on the purchase requisition lines?';
        Text005: Label 'LPO Creation process completed';
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text006: Label 'Access to approved purchase Lines is denied!';
        Vendor: Record Vendor;

    // [Scope('OnPrem')]
    procedure ApproveCalcInvDisc()
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Disc. (Yes/No)", Rec);
    end;

    //[Scope('OnPrem')]
    procedure CalcInvDisc()
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Calc.Discount", Rec);
    end;

    // [Scope('OnPrem')]
    procedure ExplodeBOM()
    begin
        IF Rec."Prepmt. Amt. Inv." <> 0 THEN
            ERROR(Text001);
        CODEUNIT.RUN(CODEUNIT::"Purch.-Explode BOM", Rec);
    end;

    //[Scope('OnPrem')]
    procedure OpenSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TESTFIELD("Sales Order No.");
        SalesHeader.SETRANGE("No.", Rec."Sales Order No.");
        SalesOrder.SETTABLEVIEW(SalesHeader);
        SalesOrder.EDITABLE := FALSE;
        SalesOrder.RUN;
    end;

    // [Scope('OnPrem')]
    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
        IF TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) THEN BEGIN
            CurrPage.SAVERECORD;
            TransferExtendedText.InsertPurchExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            UpdateForm(TRUE);
    end;

    //[Scope('OnPrem')]
    procedure ShowTracking()
    var
        TrackingForm: Page "Order Tracking";
    begin
        TrackingForm.SetPurchLine(Rec);
        TrackingForm.RUNMODAL;
    end;

    //[Scope('OnPrem')]
    procedure OpenSpecOrderSalesOrderForm()
    var
        SalesHeader: Record "Sales Header";
        SalesOrder: Page "Sales Order";
    begin
        Rec.TESTFIELD("Special Order Sales No.");
        SalesHeader.SETRANGE("No.", Rec."Special Order Sales No.");
        SalesOrder.SETTABLEVIEW(SalesHeader);
        SalesOrder.EDITABLE := FALSE;
        SalesOrder.RUN;
    end;

    // [Scope('OnPrem')]
    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    //[Scope('OnPrem')]
    procedure SetUpdateAllowed(UpdateAllowed: Boolean)
    begin
        UpdateAllowedVar := UpdateAllowed;
    end;

    // [Scope('OnPrem')]
    procedure UpdateAllowed(): Boolean
    begin
        IF UpdateAllowedVar = FALSE THEN BEGIN
            MESSAGE(Text000);
            EXIT(FALSE);
        END;
        EXIT(TRUE);
    end;



    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(FALSE);
        IF (Rec.Type = Rec.Type::"Charge (Item)") AND (Rec."No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
            CurrPage.SAVERECORD;
    end;

    local procedure CrossReferenceNoOnAfterValidat()
    begin
        InsertExtendedText(FALSE);
    end;
}


