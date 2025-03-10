page 52178568 "Loyalty Programmes"
{
    PageType = List;
    SourceTable = "Loyalty Programmes";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Programme; Rec."Programme Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Programme field.';
                }
                field("Points Rate"; Rec."Amount per Point")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Points Rate field.';
                }
                field("Charge Per Session"; Rec."Charge Per Session")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Charge Per Session field.';
                }
                field("Subscription Fee"; Rec."Subscription Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subscription Fee field.';
                }
                field("Accrued Liability"; Rec."Accrued Liability")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accrued Liability field.';
                }
                field("Accrued Expense"; Rec."Accrued Expense")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accrued Expense field.';
                }
                field("LifeTime Registration"; Rec."LifeTime Registration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LifeTime Registration field.';
                }
                field("Renewal Registration"; Rec."Renewal Registration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Renewal Registration field.';
                }
            }
        }
    }
}