page 52178736 "Budgetary Control Setup"
{
    PageType = Card;
    SourceTable = "FIN-Budgetary Control Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Mandatory; Rec.Mandatory)
                {
                    ApplicationArea = All;
                }
            }
            group(Budget)
            {
                Caption = 'Budget';
                field("Current Budget Code"; Rec."Current Budget Code")
                {
                    ApplicationArea = All;
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                    ApplicationArea = All;
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                    ApplicationArea = All;
                }
                field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Dimension 4 Code"; Rec."Budget Dimension 4 Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Dimension 5 Code"; Rec."Budget Dimension 5 Code")
                {
                    ApplicationArea = All;
                }
                field("Budget Dimension 6 Code"; Rec."Budget Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Actual Source"; Rec."Actual Source")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Source field.';
                }
                field("Advance Budget Mandatory"; Rec."Advance Budget Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Budget Mandatory field.';
                }
                field("Allow OverExpenditure"; Rec."Allow OverExpenditure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allow OverExpenditure field.';
                }
                field("Budget Check Criteria"; Rec."Budget Check Criteria")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Check Criteria field.';
                }
                field("Check Workplan Entries"; Rec."Check Workplan Entries")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check Workplan Entries field.';
                }
                field("Claims Budget mandatory"; Rec."Claims Budget mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Claims Budget mandatory field.';
                }
                field("Current Item Budget"; Rec."Current Item Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Item Budget field.';
                }
                field("Imprest Budget mandatory"; Rec."Imprest Budget mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprest Budget mandatory field.';
                }
                field("LPO Budget Mandatory"; Rec."LPO Budget Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LPO Budget Mandatory field.';
                }
                field("Memo Check Budget Mandatory"; Rec."Memo Check Budget Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Memo Check Budget Mandatory field.';
                }
                field("Normal Payments No"; Rec."Normal Payments No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Normal Payments No field.';
                }
                field("PV Budget Mandatory"; Rec."PV Budget Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PV Budget Mandatory field.';
                }
                field("Payroll Budget Mandatory"; Rec."Payroll Budget Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Budget Mandatory field.';
                }
                field("Petty Cash Payments No"; Rec."Petty Cash Payments No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Petty Cash Payments No field.';
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Raise Document"; Rec."Raise Document")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raise Document field.';
                }
                field("Raise PV"; Rec."Raise PV")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raise PV field.';
                }
                field("Store Req. Budget Mamndatory"; Rec."Store Req. Budget Mamndatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Store Req. Budget Mamndatory field.';
                }
                field("Raise Claim"; Rec."Raise Claim")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raise Claim field.';
                }
                field("Transport Budget mandatory"; Rec."Transport Budget mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Budget mandatory field.';
                }
                field("Travel Adv. Budget Mandatory"; Rec."Travel Adv. Budget Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Travel Adv. Budget Mandatory field.';
                }
                field("Advance Petty Cash Mandatory"; Rec."Advance Petty Cash Mandatory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Petty Cash Mandatory field.';
                }
                field("WorkPlan Name"; Rec."WorkPlan Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WorkPlan Name field.';
                }
            }
            group(Actuals)
            {
                Caption = 'Actuals';
                field("Analysis View Code"; Rec."Analysis View Code")
                {
                    ApplicationArea = All;
                }
                field("Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Dimension 2 Code"; Rec."Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Dimension 3 Code"; Rec."Dimension 3 Code")
                {
                    ApplicationArea = All;
                }
                field("Dimension 4 Code"; Rec."Dimension 4 Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}
