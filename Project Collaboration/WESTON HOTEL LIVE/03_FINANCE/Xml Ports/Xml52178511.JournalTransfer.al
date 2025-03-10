xmlport 52178511 "Journal Transfer"
{
    Caption = 'Import General Journals';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(Journal; "Journals Voucher Lines")
            {
                fieldelement(Date; Journal."Creation Date")
                {

                }
                fieldelement(DocNo; Journal."Document No.")
                {

                }
                fieldelement(DocType; Journal."Document Type")
                {

                }
                fieldelement(AccType; Journal."Account Type")
                {

                }
                fieldelement(AccNo; Journal."Account No.")
                {

                }
                fieldelement(Description; Journal.Description)
                {

                }
                fieldelement(Amount; Journal.Amount)
                {

                }
                fieldelement(Dolar; Journal."Currency Code")
                {

                }
                fieldelement(Amount; Journal."Amount LCY")
                {

                }
                fieldelement(BalAccType; Journal."Bal. Account Type")
                {

                }
                fieldelement(BalAccNo; Journal."Bal. Account No.")
                {

                }
                fieldelement(Branch; Journal."Shortcut Dimension 1 Code")
                {

                }
                fieldelement(CostCenter; Journal."Shortcut Dimension 2 Code")
                {

                }
                fieldelement(UserId; Journal.UserId)
                {

                }


            }
        }
    }




}
