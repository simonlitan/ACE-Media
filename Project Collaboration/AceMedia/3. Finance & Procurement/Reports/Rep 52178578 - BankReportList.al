report 52178578 "Bank Report List"
{
    Caption = 'Bank Report List';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    RDLCLayout = './Reports/SSR/Bank list Report.rdl';

    dataset
    {
        dataitem("Bank Account"; "Bank Account")
        {
            RequestFilterFields = "No.", "Bank Account No.";
            column(BankNo; "No.")
            {

            }
            column(Name; Name)
            { }
            column(Bank_Account_No_; "Bank Account No.")
            {

            }
            column(Bank_Branch_No_; "Bank Branch No.")
            {

            }
            column(Balance__LCY_; "Balance (LCY)")
            {

            }
            column(Picture; compinfo.Picture)

            {

            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No.");
                column(Document_No_; "Document No.")
                {

                } 
                column(Description; Description)
                {

                }
                column(Posting_Date; "Posting Date")
                {

                }
                column(Amount__LCY_; "Amount (LCY)")
                {

                }
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture)
    end;

    var
        CompInfo: Record "Company Information";

}


