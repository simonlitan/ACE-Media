report 52178542 "Sales Invoice 2"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/SalesInvoice2.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            column(Amount_SalesInvoiceHeader; Amount)

            {
            }

            column(BilltoCustomerNo_SalesInvoiceHeader; "Bill-to Customer No.")
            {
            }
            column(BilltoName_SalesInvoiceHeader; "Bill-to Name")
            {
            }

            column(OrderNo_SalesInvoiceHeader; "Order No.")
            {
            }
            column(QuoteNo_SalesInvoiceHeader; "Quote No.")
            {
            }
            column(AmountIncludingVAT_SalesInvoiceHeader; "Amount Including VAT")
            {
            }
            column(RemainingAmount_SalesInvoiceHeader; "Remaining Amount")
            {
            }
            column(BalAccountNo_SalesInvoiceHeader; "Bal. Account No.")
            {
            }
            column(InvoiceDiscountAmount_SalesInvoiceHeader; "Invoice Discount Amount")
            {
            }
            column(Name_CompanyInformation; Comp.Name)
            {
            }

            column(Address_CompanyInformation; Comp.Address)
            {
            }
            column(EMail_CompanyInformation; Comp."E-Mail")
            {
            }
            column(HomePage_CompanyInformation; Comp."Home Page")
            {
            }
            column(Picture_CompanyInformation; Comp.Picture)
            {
            }
            column(PhoneNo_CompanyInformation; Comp."Phone No.")
            {
            }
            column(VATRegistrationNo_CompanyInformation; "VAT Registration No.")
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Amount_SalesInvoiceLine; Amount)
                {
                }
                column(AmountIncludingVAT_SalesInvoiceLine; "Amount Including VAT")
                {
                }
                column(VATAmount; "Amount Including VAT" - Amount)
                {

                }
                column(UnitPrice_SalesInvoiceLine; "Unit Price")
                {
                }

                column(Description_SalesInvoiceLine; Description)
                {
                }
                column(LineAmount_SalesInvoiceLine; "Line Amount")
                {
                }
                column(LineDiscountAmount_SalesInvoiceLine; "Line Discount Amount")
                {
                }
                column(OrderNo_SalesInvoiceLine; "Order No.")
                {
                }
                column(Quantity_SalesInvoiceLine; Quantity)
                {
                }
                column(UnitCost_SalesInvoiceLine; "Unit Cost")
                {
                }
                column(UnitofMeasure_SalesInvoiceLine; "Unit of Measure")
                {
                }
                column(VAT_SalesInvoiceLine; "VAT %")
                {
                }


                trigger OnPreDataItem()
                begin
                    Comp.get();
                    comp.CalcFields(Picture);
                    SetRange("Line No.", "Sales Invoice Line"."Line No.");

                end;

            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLink = "No." = field("No.");
            }

            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            begin
                CalcFields(Amount);
                Comp.CalcFields(Picture);
                CalcFields("Amount Including VAT");
                CalcFields("Remaining Amount");
                if RemainingAmount = 0 then
                    RemainingAmountTxt := AlreadyPaidLbl
                else
                    if RemainingAmount <> "Amount Including VAT" then
                        RemainingAmountTxt := StrSubstNo(PartiallyPaidLbl, Format(RemainingAmount, 0, '<Precision,2><Standard Format,0>'))
                    else
                        RemainingAmountTxt := '';

                OnAfterGetSalesHeader("Sales Invoice Header");

                TotalSubTotal := 0;
                TotalInvDiscAmount := 0;
                TotalAmount := 0;
                TotalAmountVAT := 0;
                TotalAmountInclVAT := 0;
                TotalPaymentDiscOnVAT := 0;
                if ("Order No." = '') and "Prepayment Invoice" then
                    "Order No." := "Prepayment Order No.";
            end;


        }


    }


    requestpage
    {
        layout
        {
            area(Content)
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
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }


    }


    var
        Comp: record "Company Information";
        myInt: Integer;
        AlreadyPaidLbl: Label 'The invoice has been paid.';
        RemainingAmountTxt: Text;
        RemainingAmount: Decimal;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        PartiallyPaidLbl: Label 'The invoice has been partially paid. The remaining amount is %1', Comment = '%1=an amount';

    [IntegrationEvent(TRUE, FALSE)]
    local procedure OnAfterGetSalesHeader(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
    end;
}