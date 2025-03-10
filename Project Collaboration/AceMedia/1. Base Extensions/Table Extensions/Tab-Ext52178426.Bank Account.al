/// <summary>
/// TableExtension ExtExtBank Account (ID 52179300) extends Record Bank Account.
/// </summary>
tableextension 52178426 "Bank Account" extends "Bank Account"
{
    fields
    {
        field(6000; "Bank Type"; Option)
        {
            Caption = 'Bank Type';
            OptionCaption = 'Normal,Cash,Fixed Deposit,SMPA,Chq Collection';
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";
        }
        field(6001; "Receipt No. Series"; Code[20])
        {
            TableRelation = "No. Series".Code;
        }
    }
}