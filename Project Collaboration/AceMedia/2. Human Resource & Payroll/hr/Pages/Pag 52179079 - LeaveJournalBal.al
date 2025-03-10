page 52179079 "Leave Journal Bal"
{
    Caption = 'Leave Journal Bal';
    PageType = List;
    SourceTable = "HRM-Leave Ledger";
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = all;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = all;
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                    ApplicationArea = all;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = all;
                }
                field("Curr Leave Balance"; Rec."Curr Leave Balance")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
