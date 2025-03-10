xmlport 52178512 "Bank Reconcilliation"
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
            tableelement(BR; "Bank Acc. Reconciliation Line")
            {
                fieldattribute(TransNo; BR."Transaction Date")
                {
                 

                }
                fieldattribute(Type; BR.Type)
                {

                }
                fieldattribute (Description; BR.Description)
                {

                }
                fieldattribute(stamentAmount; BR."Statement Amount")
                {

                }
                fieldattribute(ApplyAmount; BR."Applied Amount")
                {

                }
                fieldattribute(Diffrence; BR.Difference)
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
