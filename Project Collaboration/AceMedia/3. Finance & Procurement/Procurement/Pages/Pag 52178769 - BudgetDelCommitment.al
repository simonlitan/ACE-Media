page 52178769 "Budget Del Commitment"
{
    Caption = 'Budget Del Commitment';
    PageType = List;
    SourceTable = "FIN-Budget Entries";
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = all;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = all;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = all;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field("Commitment Status"; Rec."Commitment Status")
                {
                    ApplicationArea = all;
                }

            }
        }
    }
}
