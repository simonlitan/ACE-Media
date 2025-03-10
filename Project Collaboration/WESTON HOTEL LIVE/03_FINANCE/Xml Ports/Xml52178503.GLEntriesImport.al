xmlport 52178503 "G_L Entries Import"
{
    Caption = 'G_L Entries Imprt';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(GL; "G/L Entry")
            {
                fieldattribute("NO."; GL."Entry No.")
                {

                }
                fieldattribute(Account_No; GL."G/L Account No.")
                {

                }
                fieldattribute(Posting_date; GL."Posting Date")
                {

                }
                fieldattribute(Document_type; gl."Document Type")
                {

                }
                fieldattribute(Document_No; GL."Document No.")
                {

                }
                fieldattribute(Descrption; GL.Description)
                {

                }

                fieldattribute(Amount; GL.Amount)
                {

                }
                fieldattribute(Global_Dim1; GL."Global Dimension 1 Code")
                {

                }
                fieldattribute(Global_Dim2; GL."Global Dimension 2 Code")
                {

                }

                fieldattribute(GenPosting_Group; GL."Gen. Posting Type")
                {

                }
                fieldattribute(Gen_Bus_Posting; GL."Gen. Bus. Posting Group")
                {

                }
                fieldattribute(GenProduct_Posting; GL."Gen. Prod. Posting Group")
                {

                }
                fieldattribute(Bal_AccType; GL."Bal. Account Type")
                {

                }
                fieldattribute(UserID; GL."User ID")
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