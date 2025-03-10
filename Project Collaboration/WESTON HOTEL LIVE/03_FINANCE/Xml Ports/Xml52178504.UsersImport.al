xmlport 52178504 "Users Import"
{

    Caption = 'Import Users';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(User; User)
            {
                fieldattribute(User_Id; user."User Name")
                {

                }
                fieldattribute(Name; user."Full Name")
                {

                }
                fieldattribute(status; user.State)
                {

                }
                fieldattribute(security; user."User Security ID")
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

