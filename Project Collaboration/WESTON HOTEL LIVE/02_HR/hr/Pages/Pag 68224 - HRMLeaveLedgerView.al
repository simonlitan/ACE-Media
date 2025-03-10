page 68224 "HRM-Leave Ledger View"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = True;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "HRM-Leave Ledger";

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

                field("Remaining days"; Rec."Remaining days")
                {
                    ApplicationArea = all;
                }
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

    actions
    {
        area(creation)
        {
            action("Reverse Leave Entry")
            {
                ApplicationArea = all;
                Caption = 'Reverse Leave Entry';
                Image = ReverseLines;
                Promoted = true;
                PromotedCategory = process;

                trigger OnAction()
                begin
                    leaveLedger.ReverseLeaveEntry();
                end;

            }
            action("Leave Balances")
            {
                ApplicationArea = all;
                RunObject = report "Annual Leave Balances";
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Emp : Record "HRM-Employee C";
    begin
        if Emp.Get(emp."No.") then
        rec."Employee Name" := Emp."Full Name";
    end;

    var
        leaveLedger: Record "HRM-Leave Ledger";
        lastNo: Integer;
}

