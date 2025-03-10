// codeunit 52178505 MyCodeunit
// {
//     trigger OnRun()
//     begin

//     end;

//     procedure MyProcedure()
//     var
//         PurchaseHeader: Record "Purchase Header";
//         ReqLine: Record "Purchase Line";
//         GLSetup: Record "Purchases & Payables Setup";
//         gCuNoSeriesMngmnt: Codeunit NoSeriesManagement;
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         LineNo2: Code[20];
//         Text003: Text;
//     begin
//         IF CONFIRM(Text003, FALSE) = TRUE THEN BEGIN
//             ReqLine.RESET;
//             ReqLine.SETRANGE(ReqLine."Document Type", ReqLine."Document Type 2"::Requisition);
//             ReqLine.SETRANGE(ReqLine.Select2, TRUE);
//             ReqLine.SETRANGE(ReqLine.Ordered, FALSE);
//             ReqLine.SETRANGE(ReqLine."Selected By", USERID);
//             IF ReqLine.FINDFIRST THEN BEGIN
//                 PurchaseHeader.INIT;
//                 GLSetup.GET;
//                 GLSetup.TESTFIELD("Order Nos.");
//                 GLSetup.TESTFIELD(GLSetup."LSO Nos");
//                 IF ReqLine."PO Type" = ReqLine."PO Type"::LPO THEN BEGIN
//                     LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."Order Nos.", WORKDATE, TRUE);
//                     PurchaseHeader."No. Series" := GLSetup."Order Nos.";
//                     PurchaseHeader."Document Type 2" := PurchaseHeader."Document Type 2"::Requisition;
//                 END
//                 ELSE
//                     IF ReqLine."PO Type" = ReqLine."PO Type"::LSO THEN BEGIN
//                         LineNo2 := gCuNoSeriesMngmnt.GetNextNo(GLSetup."LSO Nos", WORKDATE, TRUE);
//                         PurchaseHeader."No. Series" := GLSetup."LSO Nos";
//                         PurchaseHeader."Document Type 2" := PurchaseHeader."Document Type 2"::Requisition;
//                     END;
//                 PurchaseHeader."No." := LineNo2;
//                 PurchaseHeader."Posting No. Series" := GLSetup."Posted Invoice Nos.";
//                 PurchaseHeader."Buy-from Vendor No." := Rec."Buy-from Vendor No.";
//                 PurchaseHeader.VALIDATE(PurchaseHeader."Buy-from Vendor No.");
//                 PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Order;
//                 PurchaseHeader."Document Date" := WORKDATE;
//                 PurchaseHeader."Posting Date" := WORKDATE;
//                 PurchaseHeader."Vendor Order No." := Rec."Document No.";
//                 PurchaseHeader."Order Date" := WORKDATE;
//                 PurchaseHeader."Posting Description" := 'Order  ' + PurchaseHeader."No.";
//                 PurchaseHeader."Prepayment Due Date" := WORKDATE;
//                 PurchaseHeader."Vendor Invoice No." := ReqLine."No.";
//                 PurchaseHeader."Pay-to Vendor No." := ReqLine."Buy-from Vendor No.";
//                 PurchaseHeader.VALIDATE(PurchaseHeader."Pay-to Vendor No.");
//                 PurchaseHeader."Due Date" := WORKDATE;
//                 PurchaseHeader."Expected Receipt Date" := WORKDATE;
//                 PurchaseHeader."Currency Factor" := 1;
//                 PurchaseHeader."Dimension Set ID" := ReqLine."Dimension Set ID";
//                 PurchaseHeader.INSERT(TRUE);

//                 ReqLine."Document No." := LineNo2;
//                 ReqLine.Modify();
//                 Message('success');

//             END;
       
       
        
//         end;

//     end;

// }