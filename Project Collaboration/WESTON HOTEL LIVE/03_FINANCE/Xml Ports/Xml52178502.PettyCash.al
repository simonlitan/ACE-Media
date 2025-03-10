xmlport 52178502 "Petty Cash"
{
    Caption = 'Import Petty Cash';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(PC; "Advance PettyCash Header")
            {
                fieldattribute("NO."; PC."No.")
                {
                 

                }
                // fieldattribute(PaymentType; pc."Account Type")
                // {

                // }
                // fieldattribute(Date; Pc.Date)
                // {
                // }



                fieldattribute(Date_Posted; Pc."Date Posted")
                {
                    

                }
                fieldattribute(Payee; Pc.Payee)
                {


                }
                fieldattribute(VAT_Amount; PC."Total VAT Amount")
                {

                }
                fieldattribute(NetAmount; pc."Payment Amount")
                {

                }
                fieldattribute(Purpose; pc.Purpose)
                {

                }
                fieldattribute(Status; pc.Status)
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





