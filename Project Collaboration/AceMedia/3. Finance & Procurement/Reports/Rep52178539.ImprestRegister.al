/// <summary>
/// Report Imprest Register (ID 52178508).
/// </summary>
report 52178539 "Imprest Register"
{
    Caption = 'Imprest Register';
    RDLCLayout = './Reports/SSR/Imprest register.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(FINImprestHeader; "FIN-Imprest Header")
        {
            RequestFilterFields = Status;
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
            column(Compinfopic; Compinfo.Picture)
            {

            }
            column(Compinfoname; Compinfo.Name)
            {

            }
            column(Compinfophone; Compinfo."Phone No.")
            {

            }
            column(Compinfoemail; Compinfo."E-Mail")
            {

            }
            column(Compinfoaddress; Compinfo.Address)
            {

            }
            column(Compinfowebpage; Compinfo."Home Page")
            {

            }
            dataitem("FIN-Imprest Surr. Header"; "FIN-Imprest Surr. Header")
            {
                DataItemLink = "Imprest Issue Doc. No" = field("No."), "Account No." = field("Account No.");
                column(ActualSpent_FINImprestSurrHeader; "Actual Spent")
                {
                }
                column(No_FINImprestSurrHeader; No)
                {
                }
                column(Amount_FINImprestSurrHeader; Amount)
                {
                }
                column(CashSurrenderAmt_FINImprestSurrHeader; "Cash Surrender Amt")
                {
                }
                column(OutstandingBalance; (Amount - ("Actual Spent" + "Cash Surrender Amt")))
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Imprestsurrheader.Reset();
                    Imprestsurrheader.SetRange("Imprest Issue Doc. No", FINImprestHeader."No.");
                    Imprestsurrheader.SetRange("Account No.", FINImprestHeader."Account No.");
                    if Imprestsurrheader.Find('-') then
                        No_FINImprestSurrHeader := Imprestsurrheader.No;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if FINImprestHeader."Total Net Amount" <= 0 then CurrReport.Skip();
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
    trigger OnPreReport()
    begin
        Compinfo.get();
        Compinfo.CalcFields(Picture);
        imprestheader.Reset();
        imprestheader.SetRange("No.", FINImprestHeader."No.");
        if imprestheader.Find('-') then
            imprestheader.CalcFields("Total Net Amount");

    end;

    var
        Compinfo: record "Company Information";
        imprestheader: record "FIN-Imprest Header";
        Imprestsurrheader: Record "FIN-Imprest Surr. Header";
        No_FINImprestSurrHeader: code[30];
}
