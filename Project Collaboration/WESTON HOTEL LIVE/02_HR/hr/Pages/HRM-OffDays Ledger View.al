page 50046 "HRM-OffDays Ledger View"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = True;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "HRM-OffDays Ledger";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
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

                field("Remaining days"; Rec."Remaining days")
                {
                    ApplicationArea = all;
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                    ApplicationArea = all;
                }
                field("Leave Period"; Rec."Off-Days Period")
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

    actions
    {
        area(creation)
        {
            action("Reverse Leave Entry")
            {
                ApplicationArea = all;
                Caption = 'Reverse Off-Day Entry';
                Image = ReverseLines;
                Promoted = true;
                PromotedCategory = process;

                trigger OnAction()
                begin
                    leaveLedger.ReverseLeaveEntry();
                end;

            }
        }
    }

    var
        leaveLedger: Record "HRM-OffDays Ledger";
        lastNo: Integer;
}

