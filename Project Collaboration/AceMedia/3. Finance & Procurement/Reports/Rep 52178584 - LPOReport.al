report 52178584 "LPO Report"
{
    ApplicationArea = All;
    Caption = 'LPO';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/LPO.rdl';
    dataset
    {

        dataitem(PurchaseHeader; "Purchase Header")
        {

            column(CompanyName; CompInfo.Name)
            { }
            column(Logo; CompInfo.Picture)
            { }
            column(Address; CompInfo.Address)
            { }
            column(Phone; CompInfo."Phone No.") { }
            column(Title; Format(UpperCase(Title)))
            { }
            column(CurrencyCode; CurrencyCode) { }
            column(DocumentType; "Document Type")
            {
            }
            column(BuyfromVendorNo; "Buy-from Vendor No.")
            {
            }
            column(VendorName; VendorName) { }
            column(VendorAddress; VendorAddress) { }
            column(VendorCity; VendorCity) { }
            column(VendorPostalCode; VendorPostalCode) { }
            column(No; "No.")
            {
            }
            column(PaytoVendorNo; "Pay-to Vendor No.")
            {
            }
            column(PaytoName; "Pay-to Name")
            {
            }

            column(PaytoAddress; "Pay-to Address")
            {
            }
            column(PaytoAddress2; "Pay-to Address 2")
            {
            }
            column(PaytoCity; "Pay-to City")
            {
            }

            column(OrderDate; "Order Date")
            {
            }
            column(Document_Date; "Document Date") { }

            column(UserId; "User Id")
            {
            }
            column(Quote_No_; "Quote No.") { }

            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No."), "Document Type" = field("Document Type");
                column(No_; "No.") { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Description_2; "Description 2") { }
                column(Document_Type; "Document Type") { }
                column(Document_No_; "Document No.") { }
                column(Buy_from_Vendor_No_; "Buy-from Vendor No.") { }
                column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Direct_Unit_Cost; "Direct Unit Cost") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Line_Amount; "Line Amount") { }
                column(Amount1; Amount) { }
                column(Amount_Including_VAT; "Amount Including VAT") { }
            }
            trigger OnAfterGetRecord()
            begin
                /*  PurchaseHeader.Reset();
                 PurchaseHeader.SetRange("No.", "No.");
                 PurchaseHeader.SetRange("Document Type", "Document Type");
                 "Purchase Line".Reset();
                 "Purchase Line".SetRange("Document No.", "No.");
                 "Purchase Line".SetRange("Document Type", "Document Type");
                 "Purchase Line".Validate("Direct Unit Cost"); */

                Vendor.Reset();
                if Vendor.Get(PurchaseHeader."Pay-to Vendor No.") then begin
                    VendorName := Vendor.Name;
                    VendorAddress := Vendor.Address;
                    VendorCity := Vendor.City;
                    VendorPostalCode := Vendor."Post Code";
                end;
                if "Currency Code" <> '' then
                    CurrencyCode := "Currency Code" else
                    CurrencyCode := GLSetup."LCY Code";
            end;
        }


    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }


    trigger OnInitReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);

        GLSetup.Get();

    end;

    var
        CompInfo: Record "Company Information";
        Title: Label 'Local Purchase Order';
        Vendor: Record Vendor;
        VendorName, VendorAddress, VendorCity, VendorPostalCode : Text;
        POS: Page "Purchase Order Subform";
        CurrencyCode: Code[20];
        GLSetup: Record "General Ledger Setup";
}
