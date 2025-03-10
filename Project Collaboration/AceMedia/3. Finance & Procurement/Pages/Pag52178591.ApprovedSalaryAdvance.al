/// <summary>
/// Page Approved Salary Advance (ID 52178589).
/// </summary>
page 52178591 "Approved Salary Advance1"
{
    CardPageID = "FIN-Staff Advance Req.";
    Editable = false;
    InsertAllowed = false;
    DelayedInsert = false;
    PageType = List;
    SourceTable = "FIN-Staff Advance Header";
    SourceTableView = where(Status = const(Approved), Posted = const(false));

    layout
    {
        area(content)
        {
            repeater(rep001)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Cashier; Rec.Cashier)
                {
                    Caption = 'Requestor ID';
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Repayent Interval"; Rec."Repayent Interval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Repayent Interval field.';
                }
                field("Repayent Interval Value"; Rec."Repayent Interval Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Repayent Interval Value field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }

                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
    var
        BCSetup: Record "FIN-Budgetary Control Setup";
        FINBudgetEntries: Record "FIN-Budget Entries";
        FINStaffAdvanceLines: Record "FIN-Staff Advance Lines";





}
