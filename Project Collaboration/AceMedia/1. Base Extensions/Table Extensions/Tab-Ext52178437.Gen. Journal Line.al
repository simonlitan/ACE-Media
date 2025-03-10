/// <summary>
/// TableExtension ExtGen. Journal Line (ID 52179313) extends Record Gen. Journal Line.
/// </summary>
tableextension 52178437 "GenJournalLine ext" extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(6000; "Transaction Type"; Option)
        {
            OptionCaption = ',Cafeteria';
            OptionMembers = ,Cafeteria;
        }
        field(6001; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6002; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6003; "Shortcut Dimension 5"; code[20])
        {
            TableRelation = "Dimension Value".code where("Global Dimension No." = filter(5));
        }
    }

}