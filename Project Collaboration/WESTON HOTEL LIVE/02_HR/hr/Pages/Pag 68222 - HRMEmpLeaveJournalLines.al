page 68222 "HRM-Emp. Leave Journal Lines"
{
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
            action(GetAnnual_Leave)
            {
                ApplicationArea = all;
                Caption = 'Get Annual Leave Allocations';
                Image = GetLines;
                Promoted = true;

                PromotedCategory = process;


                trigger OnAction()
                begin
                    Rec.GetAnnualLeaveDays();
                end;

            }
            action(Post_Leave)
            {
                ApplicationArea = all;
                Caption = 'Post Leave Journal';
                Image = PostDocument;
                Promoted = true;

                PromotedCategory = Process;


                trigger OnAction()
                begin
                    CODEUNIT.Run(Codeunit::"HR Post Leave Journal Ent.");
                end;
            }


            group(Import)
            {

                Caption = '&Actions';
                action("Import Leave Balances")
                {
                    Caption = 'Import Leave Balances';
                    Image = ImportExcel;
                    Promoted = true;
                    Visible = false;
                    ApplicationArea = all;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        rec.ImportLeaveDays();
                    end;
                }
            }
        }
    }

    var
        salaryGrades: Record "HRM-Job_Salary grade/steps";
        hremployee: Record "HRM-Employee C";
        leaveledger: Record "HRM-Leave Ledger";
        leaveJournal: Record "HRM-Employee Leave Journal";
        ints: Integer;
}

