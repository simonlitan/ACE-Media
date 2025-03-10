page 52179275 "PRL-PeriodTransaction List"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "PRL-Period Transactions";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                // ShowCaption = false;
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                    Visible = true;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    Visible = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Visible = true;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = all;
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = all;
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = all;
                }
                field("Group Text"; Rec."Group Text")
                {
                    ApplicationArea = all;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                }

                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    Visible = true;
                }
                field("Original Amount"; Rec."Original Amount")
                {
                    ApplicationArea = all;
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
                    ApplicationArea = all;
                    Editable = true;
                }
                field("Journal Account Type"; Rec."Journal Account Type")
                {
                    ApplicationArea = all;
                }
                field("Post As"; Rec."Post As")
                {
                    ApplicationArea = all;
                }
                field("coop parameters"; Rec."coop parameters")
                {
                    ApplicationArea = all;
                }


            }
        }
    }

    actions
    {
    }
}

