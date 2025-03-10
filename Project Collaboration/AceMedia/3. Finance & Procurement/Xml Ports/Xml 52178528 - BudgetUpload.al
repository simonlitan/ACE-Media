xmlport 52178528 "Budget Upload"
{
    Caption = 'Import Items';
    Direction = Import;
    Format = VariableText;
    FormatEvaluate = Legacy;
    DefaultFieldsValidation = false;
    UseRequestPage = false;

    schema
    {
        textelement(root)
        {
            tableelement(Budget; "FIN-Budget Entries")
            {
                fieldattribute(budgetName; Budget."Budget Name")
                {

                }
                fieldattribute(GL; Budget."G/L Account No.")
                {

                }
                fieldattribute(Date; Budget.Date)
                {

                }
                fieldattribute(Directorate; Budget."Global Dimension 1 Code")
                {

                }
                fieldattribute(Department; Budget."Budget Dimension 2 Code")
                {

                }
                fieldattribute(Description; Budget.Description) { }

                fieldattribute(UserId; Budget."User ID") { }
                fieldattribute(TransactionType; Budget."Transaction Type") { }
                fieldattribute(CommitmentStatus; Budget."Commitment Status") { }
                fieldattribute(DocType; Budget."Document Type") { }
                trigger OnBeforeInsertRecord()
                var

                begin
                    // Budget."Budget Name" = '' then 
                    // currXMLport.Skip();
                    Counter := Counter + 1

                end;




            }
        }
    }
    var
        Counter: Integer;

}

