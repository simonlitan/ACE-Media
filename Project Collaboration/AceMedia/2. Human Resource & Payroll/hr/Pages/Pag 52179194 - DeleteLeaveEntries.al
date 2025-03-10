page 52179194 "Delete Leave Entries"
{
    Caption = 'Delete Leave Entries';
    PageType = List;
    SourceTable = "HRM-Leave Ledger";

    layout
    {
        area(Content)
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
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = all;
                }
                field("Forfeited Leave"; Rec."Forfeited Leave")
                {
                    ApplicationArea = all;
                }


                // field("Remaining days"; Rec."Remaining days")
                // {
                //     ApplicationArea = all;
                // }
                field("Transaction Description"; Rec."Transaction Description")
                {
                    ApplicationArea = all;
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = all;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
