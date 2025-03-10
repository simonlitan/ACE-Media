tableextension 52179313 "GenJournalLine ext" extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(27050; "Transaction Type"; Option)
        {
            OptionCaption = ',Cafeteria';
            OptionMembers = ,Cafeteria;
        }
        field(27051; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(27052; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27053; "Shortcut Dimension 5"; code[20])
        {
            TableRelation = "Dimension Value".code where("Global Dimension No." = filter(5));
        }
    }

}