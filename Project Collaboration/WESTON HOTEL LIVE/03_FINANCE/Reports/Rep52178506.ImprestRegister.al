report 52178506 "Imprest Register"
{
    Caption = 'Imprest Register';
    RDLCLayout = './Reports/SSR/Imprest register.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(FINImprestHeader; "FIN-Imprest Header")
        {







            column(AccountNo; "Account No.")
            {
            }
            column(AccountType; "Account Type")
            {
            }
            column(ActualExpenditure; "Actual Expenditure")
            {
            }
            column(BankName; "Bank Name")
            {
            }
            column(Cashier; Cashier)
            {
            }
            column(CommittedAmount; "Committed Amount")
            {
            }
            column(CurrentStatus; "Current Status")
            {
            }
            column(Date; "Date")
            {
            }
            column(DatePosted; "Date Posted")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(No; "No.")
            {
            }
            column(Payee; Payee)
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(RequestedBy; "Requested By")
            {
            }
            column(Status; Status)
            {
            }
            column(SurrenderStatus; "Surrender Status")
            {
            }
            column(TotalNetAmount; "Total Net Amount")
            {
            }
            column(SurrenderNo_FINImprestHeader; "Surrender No")
            {
            }
            column(Surrenderdate_FINImprestHeader; "Surrender date")
            {
            }
            column(Surrenderedamount_FINImprestHeader; "Surrendered amount")
            {
            }



            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoAddress; CompanyInfo.Address)
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfoPhone1; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfoPhone2; CompanyInfo."Contact Person")
            {
            }
            column(CompanyInfoAdress; CompanyInfo.Address)
            {
            }
            column(CompanyInfoPostal; CompanyInfo."Post Code")
            {
            }
            column(CompanyInfoEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfoWebpage; CompanyInfo."Home Page")
            {
            }
            column(CompanyInfoCity; CompanyInfo.City)
            {
            }
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
    trigger OnPreReport()
    begin
        Companyinfo.get();
        Companyinfo.CalcFields(Picture);
        imprestheader.Reset();
        imprestheader.SetRange("No.", FINImprestHeader."No.");
        if imprestheader.Find('-') then
            imprestheader.CalcFields("Total Net Amount");

    end;

    var
        Companyinfo: record "Company Information";
        imprestheader: record "FIN-Imprest Header";
}
