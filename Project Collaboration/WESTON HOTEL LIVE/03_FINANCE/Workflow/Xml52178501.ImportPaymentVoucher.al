xmlport 52178501 "Import Payment Voucher"
{
    Caption = 'Import PV';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(PV; "FIN-Payments Header")
            {
                fieldattribute("NO."; PV."No.")
                {

                }
                fieldattribute(Date; PV.Date)
                {

                }

                fieldattribute(Released_Date; PV."Payment Release Date")
                {

                }
                fieldattribute(Payee; PV.Payee)
                {

                }
                fieldattribute(Currency_Code; PV."Currency Code")
                {

                }
                fieldattribute(Paying_Bank; PV."Paying Bank Account")
                {

                }
                fieldattribute(Bank_Name; PV."Bank Name")
                {

                }
                fieldattribute(Toatal_VAT; PV."Total VAT Amount")
                {

                }
                fieldattribute(Net_Amount; PV."Total Net Amount")
                {

                }
                fieldattribute(Cheque_No; PV."Cheque No.")
                {

                }
                fieldattribute(Status; pv.Status)
                {

                }

            }
        }

    }
    trigger OnInitXmlPort()
    begin
        I := 0;
    end;

    var
        I: Integer;
}



