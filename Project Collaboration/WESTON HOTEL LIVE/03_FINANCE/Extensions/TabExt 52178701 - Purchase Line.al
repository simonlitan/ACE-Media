tableextension 52178701 "ExtPurchase Line" extends "Purchase Line"
{
    fields
    {
        field(50000; committed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52178511; Comments; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Vote Book"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ADDED THIS FIELD';
        }
        field(50004; "Expense Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ADDED THIS FIELD';
        }
        field(50005; "RFQ No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ADDED THIS FIELD';
        }
        field(50006; "RFQ Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'ADDED THIS FIELD';
        }
        field(50007; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008; "RFQ Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50010; "Project Code"; Code[10])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header".Lost WHERE("No." = FIELD("Document No.")));

        }
        field(50011; Status; Enum "Purchase Document Status")
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Lookup("Purchase Header".Status WHERE("No." = FIELD("Document No."),
                                                                 "Document Type" = FIELD("Document Type")));
        }
        field(50012; "Asset No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(50013; "Document Type 2"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Requisition,Quote,"Order";
        }
        field(50014; "Procurement Plan Item No"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /* TESTFIELD("Shortcut Dimension 2 Code");
                 PrPlan.RESET;
                 PrPlan.SETRANGE(PrPlan.Department,"Shortcut Dimension 2 Code");
                 PrPlan.SETRANGE(PrPlan."Type No","Procurement Plan Item No");
                 IF PrPlan.FIND('-') THEN BEGIN
                 IF Quantity>PrPlan."Remaining Qty" THEN ERROR('The selected items is more than items on procurement plan');
                 PrPlan."Remaining Qty":=PrPlan."Remaining Qty"-Quantity;
                 PrPlan.MODIFY;
                 END;*/

            end;
        }
        field(50033; "Request for Quote No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Purchase Header".Lost WHERE("Document Type" = FIELD("Document Type"),
                                                               "No." = FIELD("Document No.")));


            trigger OnValidate()
            begin
                /*   //CHECK WHETHER HAS LINES AND DELETE
                 IF NOT CONFIRM('If you change the Request for Quote No. the current lines will be deleted. Do you want to continue?',FALSE)
                 THEN
                     ERROR('You have selected to abort the process') ;

                     PurchLine.RESET;
                     PurchLine.SETRANGE(PurchLine."Document No.","No.");
                     PurchLine.DELETEALL;

                 RFQ.RESET;
                 RFQ.SETRANGE(RFQ."Document No.","Request for Quote No.");
                 IF RFQ.FIND('-') THEN BEGIN
                   REPEAT
                       PurchLine.INIT;
                       PurchLine."Document Type":="Document Type";
                       PurchLine."Document No.":="No.";
                       PurchLine."Line No.":=RFQ."Line No.";
                       PurchLine.Type:=RFQ.Type;
                       PurchLine."Document Type 2":="Document Type 2";
                       PurchLine."No.":=RFQ."No.";
                       PurchLine.VALIDATE("No.");
                       PurchLine."Location Code":=RFQ."Location Code";
                       PurchLine.VALIDATE("Location Code");
                       PurchLine.Quantity:=RFQ.Quantity;
                       PurchLine.VALIDATE(Quantity);
                       PurchLine."Direct Unit Cost":=RFQ."Direct Unit Cost";
                       PurchLine.VALIDATE("Direct Unit Cost");
                       PurchLine.Amount:=RFQ.Amount;
                       PurchLine.INSERT;
                   UNTIL RFQ.NEXT=0;
                 END;
                */

            end;
        }
        field(50034; "Line Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50035; "Budgeted Amount"; Decimal)
        {
            // FieldClass = FlowField;
            // CalcFormula = Sum("G/L Budget Entry".Amount WHERE ("Global Dimension 1 Code"=FIELD("Shortcut Dimension 1 Code"),
            //                                                    "Global Dimension 2 Code"=FIELD("Shortcut Dimension 2 Code"),
            //                                                    "G/L Account No."=FIELD("Vote Book"),
            //                                                    "Budget Name"=FIELD("Budget Name")));

        }
        field(50036; "Actual Expenditure"; Decimal)
        {
            // FieldClass = FlowField;
            // CalcFormula = Sum("G/L Entry".Amount WHERE("G/L Account No."=FIELD("Vote Book"),
            //                                             "Global Dimension 1 Code"=FIELD("Shortcut Dimension 1 Code"),
            //                                             "Global Dimension 2 Code"=FIELD("Shortcut Dimension 2 Code"),
            //                                             "Purch. Lost"=FIELD("Budget Name")));

        }
        field(50037; "Committed Amount"; Decimal)
        {
            // FieldClass = FlowField;
            // CalcFormula = Sum(Committment.Amount WHERE ("G/L Account No."=FIELD("Vote Book"),
            //                                             "Shortcut Dimension 1 Code"=FIELD("Shortcut Dimension 1 Code"),
            //                                             "Shortcut Dimension 2 Code"=FIELD("Shortcut Dimension 2 Code"),
            //                                             Budget=FIELD("Budget Name")));

        }
        field(50038; "Budget Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(50039; "Budget Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "Description 3"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50540; "Procurement Type Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50606; "Manual Requisition No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." WHERE("Document Type" = CONST(Quote),
                                                         Status = CONST(Released));

            trigger OnValidate()
            begin
                "Manually Added" := TRUE;
            end;
        }
        field(50607; "Manually Added"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(51000; "RFQ Remarks"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(51002; "Requisition No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9588696; lost; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(52178500; Select2; Boolean)
        {
            trigger OnValidate()
            begin

                MODIFY(FALSE);
                TESTFIELD("PO Type");
                TESTFIELD("Buy-from Vendor No.");
                "Selected By" := USERID;
            end;

        }
        field(52178501; Ordered; Boolean)
        {

        }
        field(52178502; "PO Type"; Option)
        {
            OptionCaption = ' ,LPO,LSO';
            OptionMembers = " ",LSO,LPO;
            trigger OnValidate()
            begin
                Decision := Decision::Order;
            end;


        }
        field(52178503; "PO Number"; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE("Document Type 2" = filter(Requisition),
                                                         Status = CONST(Open));

            trigger OnValidate()
            begin
                MODIFY(FALSE);
            end;
        }
        field(52178504; "Selected By"; Code[50])
        {
        }
        field(52178505; Category; Option)
        {
            OptionCaption = ' ,Item,Service,Capex';
            OptionMembers = " ",Item,Service,Capex;

            trigger OnValidate()
            begin

                //Ushindi

                TestStatusOpen;
                IF Category = Category::Item THEN BEGIN
                    //INSERT(TRUE);
                    // MODIFY(TRUE);
                    Type := Type::Item
                    //END ELSE IF Category=Category::Service THEN BEGIN
                    //Type:=Type::"G/L Account";


                END;
            end;
        }
        field(52178506; "Ordered by"; code[100])
        {

        }

        field(52178507; "Order Creation date"; date)
        {

        }
        field(52178508; "Order Creation Time"; time)
        {

        }
        field(52178509; "Fully Issued"; Boolean)
        {
        }
        field(52178510; Decision; Option)
        {
            OptionCaption = ' ,Order';
            OptionMembers = " ","Order";
        }

    }

    // trigger OnAfterInsert()
    // var
    //     Err: Label 'Sorry, you have selected %1 items you can only select maximum of 10.';
    //     MaxItem: Integer;
    // begin
    //     MaxItem := 0;
    //     Rec.Reset();
    //     Rec.SetRange("Document Type", LPO."Document Type"::Order);
    //     Rec.SetRange("Document No.", Rec."Document No.");
    //     if Rec.FindSet() then
    //         repeat
    //             MaxItem += 1;
    //         until Rec.Next() = 0;
    //     if MaxItem > 10 then
    //         Error(Err, MaxItem);

    // end;



    var
        LPO: Record "Purchase Header";
}