page 69212 "HRM-Posted Leave Journal"
{
    Editable = false;
    PageType = List;
    SourceTable = "HRM-Employee Leave Journal";
    

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = all;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                    ApplicationArea = all;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = all;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
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





        }
    }

    var
        salaryGrades: Record "HRM-Job_Salary grade/steps";
        hremployee: Record "HRM-Employee C";
        leaveledger: Record "HRM-Leave Ledger";
        leaveJournal: Record "HRM-Employee Leave Journal";
        ints: Integer;
}

