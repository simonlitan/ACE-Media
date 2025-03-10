xmlport 52178505 "Import Vendor Ledgers"
{

    Caption = 'Import Vendor Ledger Entries';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = true;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {

            tableelement(VLE; "Vendor Ledger Entry")
            {
                fieldattribute(Entry_No; VLE."Entry No.")
                {

                }
                fieldattribute(Vendor_No; VLE."Vendor No.")
                {

                }
                fieldattribute(Posting_Date; VLE."Posting Date")
                {

                }
                fieldattribute(DOC_Type; VLE."Document Type")
                {

                }
                fieldattribute(doc_No; VLE."Document No.")
                {

                }
                fieldattribute(Description; VLE.Description)
                {

                }
                fieldattribute(Amount; VLE.Amount)
                {

                }
                fieldattribute(Amount; VLE."Amount (LCY)")
                {

                }
                fieldattribute(BuyFrom_Vendor; VLE."Buy-from Vendor No.")
                {

                }
                fieldattribute(VendorPostingGroup; VLE."Vendor Posting Group")
                {

                }
                fieldattribute(Globaldim1; VLE."Global Dimension 1 Code")
                {

                }
                fieldattribute(GlobalDim2; VLE."Global Dimension 2 Code")
                {

                }
                fieldattribute(OriginalAmount; VLE."Original Amount")
                {

                }
                fieldattribute(balAccType; VLE."Bal. Account Type")
                {

                }
                fieldattribute(balAccNo; VLE."Bal. Account No.")
                {

                }
                fieldattribute(Open; VLE.Open)
                {

                }
                // fieldattribute(Debit; vle."Debit Amount")
                // {

                // }
                // fieldattribute(Credit; VLE."Credit Amount")
                // {

                // }

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

