/// <summary>
/// TableExtension Bank Acc. Reconciliation Line (ID 52178502) extends Record Bank Acc. Reconciliation Line.
/// </summary>
tableextension 52178526 "Bank Acc. Reconciliation Line" extends "Bank Acc. Reconciliation Line"
{
    fields
    {
        field(6000; Reconciled; Boolean)
        {

            trigger OnValidate()
            begin
                //check if the type of entry that the user has selected is difference
                IF (Type = Type::Difference) OR ("Document No." = '') THEN BEGIN
                    ERROR('Differences cannot be reconciled');
                END;
            end;
        }
        field(6001; "Open Type"; Option)
        {
            OptionCaption = ' ,Unpresented Cheques List,Uncredited Cheques Lit,Items not in cash book';
            OptionMembers = " ",Unpresented,Uncredited,Manual;
        }
        field(6002; "Credit Amount"; decimal)
        {

        }
        field(6003; "Debit Amount"; Decimal)
        {

        }
    }
}
