tableextension 52179300 "Bank Account" extends "Bank Account"
{
    fields
    {
        field(50000; "Bank Type"; Option)
        {
            Caption = 'Bank Type';
            OptionCaption = 'Normal,Cash,Fixed Deposit,SMPA,Chq Collection';
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";
        }
        field(50005; "Receipt No. Series"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
    }
}