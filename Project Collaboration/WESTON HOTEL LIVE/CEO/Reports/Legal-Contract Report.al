report 52178869 "Legal-Contract Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './CEO/Reports/SSR/Legal-Contract Report.rdl';
    EnableExternalImages = true;

    dataset
    {
        dataitem("Legal-Contracts"; "Legal-Contracts")
        {
            DataItemTableView = SORTING("Code");
            RequestFilterFields = "Code";
            column(Code; Code)
            {

            }
            column(Contract_Number; "Contract Number")
            {

            }
            column(Purchase_Req__Number; "Purchase Req. Number")
            {

            }
            column(Contract_Amount; "Contract Amount")
            {

            }
            column(Budgeted_Amount; "Budgeted Amount")
            {

            }
            column(Tender_No_; "Tender No.")
            {

            }
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(Vendor_Name; "Vendor Name")
            {

            }
            column(Start_Date; "Start Date")
            {

            }
            column(Completion_Date; "Completion Date")
            {

            }
            column(Status; Status)
            {

            }
            column(companyName; CompanyInformation.Name)
            {
            }
            column(companyAddress; CompanyInformation."Address 2")
            {
            }
            column(pic; CompanyInformation.Picture)
            {
            }
        }
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

    trigger OnInitReport()
    begin
        DateFilter := TODAY;
    end;

    trigger OnPreReport()
    begin
        IF CompanyInformation.GET THEN
            CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        DateFilter: Date;
}