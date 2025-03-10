tableextension 52178528 "G/L Budget Entry" extends "G/L Budget Entry"
{
        fields
    {
        field(52178700; "Transaction Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Allocation,Commitment,Expense,Revision;
        }
        field(52178701; "Revision Account"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
    }
    
       
}
