xmlport 52178507 "Import Safaris Transaction"
{
    Caption = 'Import Safaris Transaction';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {

            tableelement(Safari; "Opera Data Import")
            {
                fieldelement(account; Safari."G/L Account")
                {

                }
                fieldelement(Date; Safari.date)
                {

                }
                fieldelement(Cost_Center; Safari."Cost Center")
                {

                }
                fieldelement(PostingDescription; Safari."Posting Description")
                {

                }
                fieldelement(CurrencyCode; Safari."Currency Code")
                {

                }
                fieldelement(Amount; Safari.Amount)
                {

                }
                trigger OnBeforeInsertRecord()
                var
                    myInt: Integer;
                begin
                    if Safari.Get(Safari."Line No", Safari."Posting Description") then
                        currXMLport.Skip();
                end;
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


