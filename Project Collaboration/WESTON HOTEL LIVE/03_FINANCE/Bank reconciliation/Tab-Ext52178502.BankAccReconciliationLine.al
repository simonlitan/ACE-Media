tableextension 52178502 "Bank Acc. Reconciliation Line" extends "Bank Acc. Reconciliation Line"
{
    
  fields
    {
        field(52178500; Reconciled; Boolean)
        {

            trigger OnValidate()
            begin
                //check if the type of entry that the user has selected is difference
                IF (Type = Type::Difference) OR ("Document No." = '') THEN BEGIN
                    ERROR('Differences cannot be reconciled');
                END;
            end;
        }
        field(52178501; "Open Type"; Option)
        {
            OptionCaption = ' ,Unpresented Cheques List,Uncredited Cheques Lit,Items not in cash book';
            OptionMembers = " ",Unpresented,Uncredited,Manual;
        }
        field(52178502; "Credit Amount"; decimal)
        {

        }
        field(52178503; "Debit Amount"; Decimal)
        {

        }
    }
}
