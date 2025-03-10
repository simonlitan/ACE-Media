page 52178656 "FIN-Budgetary Comparison List"
{
    Caption = 'Votebook Summary';
    Editable = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "FIN-Budget Entries Summary";
    // SourceTableView = where("% Balance" = filter(>= 0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Budget Name"; Rec."Budget Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vote Name"; Rec."Vote Name")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = true;
                    ApplicationArea = All;
                    Caption = 'Directorate';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Department';
                    Editable = true;
                    ApplicationArea = All;
                    Visible = true;
                }
                field(Allocation; Rec.Allocation)
                {
                    ApplicationArea = All;
                }
                field(Revision; Rec.Revision)
                {
                    ApplicationArea = All;
                }
                field("Revised Allocations"; Rec."Revised Allocations")
                {
                    ApplicationArea = All;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = All;
                }
                field("Commitment/Posted"; Rec."Commitment/Posted")
                {
                    ApplicationArea = all;
                    Visible = false;
                }

                field(Expenses; Rec.Expenses)
                {
                    ApplicationArea = All;
                }

                field("Total Expense/Commitment"; Rec."Total Expense/Commitment")
                {
                    ApplicationArea = All;
                    Visible = true;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                }
                field("Stored Total Balance"; Rec."Stored Total Balance")
                {
                    ApplicationArea = all;
                }
                field("Net Balance"; Rec."Net Balance")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("% Balance"; Rec."% Balance")
                {
                    // ApplicationArea = All;
                    Visible = true;
                    ApplicationArea = All;
                    editable = false;
                }
                field("% Net Balance"; Rec."% Net Balance")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
    }

    // trigger OnAfterGetRecord()
    // var
    //     Bank: Record "FIN-Budget Entries Summary";
    // begin
    //     Bank.Reset();
    //     Bank.SetRange(Balance);
    //     if Bank.Find('-') then
    //         Bank."% Balance" := Bank.Balance / Bank.Allocation * 100;

    // end;





    actions
    {
        area(Processing)
        {
            action(Reports)
            {
                ApplicationArea = All;
                RunObject = Report "Votebook Report";
            }
        }
    }
}
