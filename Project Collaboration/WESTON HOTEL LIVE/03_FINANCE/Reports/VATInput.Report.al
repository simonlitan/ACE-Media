report 52178511 "VAT Input"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/VATInput.rdl';
    ApplicationArea = ALL;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "Document Date";
            column(Amount_PurchInvHeader; "Purch. Inv. Header".Amount)
            {
            }
            column(AmountIncludingVAT_PurchInvHeader; "Purch. Inv. Header"."Amount Including VAT")
            {
            }
            column(BuyfromVendorNo_PurchInvHeader; "Purch. Inv. Header"."Buy-from Vendor No.")
            {
            }
            column(PaytoVendorNo_PurchInvHeader; "Purch. Inv. Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoName_PurchInvHeader; "Purch. Inv. Header"."Pay-to Name")
            {
            }
            column(YourReference_PurchInvHeader; "Purch. Inv. Header"."Your Reference")
            {
            }
            column(OrderDate_PurchInvHeader; "Purch. Inv. Header"."Order Date")
            {
            }
            column(PostingDate_PurchInvHeader; "Purch. Inv. Header"."Posting Date")
            {
            }
            column(DocumentDate_PurchInvHeader; "Purch. Inv. Header"."Document Date")
            {
            }
            //   column(VATRegistrationNo_PurchInvHeader; "Purch. Inv. Header"."VAT Registration No.")
            // {
            // }
            column(VendorInvoiceNo_PurchInvHeader; "Purch. Inv. Header"."Vendor Invoice No.")
            {
            }
            column(VATRegistrationNo_PurchInvHeader; Ven."PIN No.")
            {
            }
            column(VAT; VAT)
            {
            }
            column(Description; Description)
            {
            }
            column(TaxableAmount; TaxableAmount)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF "Purch. Inv. Header".Amount = "Purch. Inv. Header"."Amount Including VAT" THEN
                    CurrReport.SKIP;

                Description := '';

                PurchInvoiceLine.RESET;
                PurchInvoiceLine.SETRANGE(PurchInvoiceLine."Document No.", "Purch. Inv. Header"."No.");
                IF PurchInvoiceLine.FIND('-') THEN
                    Description := PurchInvoiceLine.Description;
               
                Ven.Reset;
                Ven.SetRange("No.", "Pay-to Vendor No.");
                If Ven.Find('-') Then;
            end;
        }
        
        // dataitem(Vendor; Vendor)
        // {
        //        RequestFilterFields = "PIN No.","No.";
        //        //DataItemLink = VAT Registration No." := FIELD("PIN No.");

        //     column(VATRegistrationNo_PurchInvHeader; Vendor."PIN No.")
        //     {
        //     }
        // }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        VAT: Decimal;
        Description: Text;
        PurchInvoiceLine: Record 123;
        TaxableAmount: Decimal;
        Ven: Record Vendor;
}

