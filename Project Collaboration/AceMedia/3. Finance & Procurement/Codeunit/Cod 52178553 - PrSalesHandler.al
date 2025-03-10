// codeunit 52178553 PrSalesHandler
// {
  
//     Subtype = Normal;

//     procedure CreateMultiVendorPurchases(SalesHeader: Record "Sales Header")
//     var
//         PurchaseHeader: Record "Purchase Header";
//         SalesLine: Record "Sales Line";
//         PurchaseLine: Record "Purchase Line";
//        // VendorDict: Dictionary of [Code[20]];
//         VendorNo: Code[20];
//         SalesPurchaseLink: Record "Sales-Purchase Link";
//     begin
//         if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
//             Error('Only sales orders can create purchase orders.');

//         SalesLine.SetRange("Document Type", SalesHeader."Document Type");
//         SalesLine.SetRange("Document No.", SalesHeader."No.");

//         if SalesLine.FindSet() then
//             repeat
//                 VendorNo := GetVendorForPRService(SalesLine."No.");

//                 if VendorNo = '' then
//                     Error('No vendor assigned for PR service "%1".', SalesLine."Description");

//                 if not VendorDict.ContainsKey(VendorNo) then begin
//                     // Create a new Purchase Order
//                     PurchaseHeader.Init();
//                     PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Order;
//                     PurchaseHeader.Validate("Buy-from Vendor No.", VendorNo);
//                     PurchaseHeader.Insert();
                    
//                     VendorDict.Add(VendorNo, PurchaseHeader);

//                     // Insert into Sales-Purchase Link Table
//                     SalesPurchaseLink.Init();
//                     SalesPurchaseLink."Sales Order No." := SalesHeader."No.";
//                     SalesPurchaseLink."Purchase Order No." := PurchaseHeader."No.";
//                     SalesPurchaseLink."Vendor No." := VendorNo;
//                     SalesPurchaseLink.Insert();
//                 end else begin
//                     VendorDict.Get(VendorNo, PurchaseHeader);
//                 end;

//                 // Create Purchase Line
//                 PurchaseLine.Init();
//                 PurchaseLine."Document Type" := PurchaseHeader."Document Type";
//                 PurchaseLine."Document No." := PurchaseHeader."No.";
//                 PurchaseLine.Validate("No.", SalesLine."No.");
//                 PurchaseLine.Validate(Quantity, SalesLine.Quantity);
//                 PurchaseLine.Validate("Unit Price", SalesLine."Unit Price" * 0.7); 
//                 PurchaseLine.Insert();

//                 SalesLine."External Document No." := PurchaseHeader."No.";
//                 SalesLine.Modify();

//             until SalesLine.Next() = 0;

//         Message('Purchase Orders created for PR services.');
//     end;

//     local procedure GetVendorForPRService(ServiceItemNo: Code[20]): Code[20]
//     var
//         PRVendorMapping: Record "Vendor";
//     begin
//         if PRVendorMapping.Get(ServiceItemNo) then
//             exit(PRVendorMapping."No.")
//         else
//             exit('VENDOR001'); 
//     end;
// }
