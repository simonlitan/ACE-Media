page 68077 "PRL-PeriodTransaction List"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    Editable = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "PRL-Period Transactions";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field("Group Order"; Rec."Group Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group Order field.';
                }
                field("Sub Group Order"; Rec."Sub Group Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Group Order field.';
                }
                field("Journal Account Code"; Rec."Journal Account Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Journal Account Code field.';
                }
                field("Journal Bal Acc"; Rec."Journal Bal Acc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Journal Bal Acc field.';
                }


            }
        }
    }

    actions
    {
    }
}

