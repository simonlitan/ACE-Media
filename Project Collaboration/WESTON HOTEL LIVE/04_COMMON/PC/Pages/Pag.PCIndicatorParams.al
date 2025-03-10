page 52179123 "PC Indicator Params"
{
    PageType = List;
    SourceTable = "PC Indicator Params";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("PC Period"; Rec."PC Period")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PC Period field.';
                }

                field("Indicator Code"; Rec."Indicator Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indicator Code field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Department; Rec.Department)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Head of Department"; Rec."Head of Department")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Head of Department field.';
                }
                field("Annual Target"; Rec."Annual Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Target field.';
                }
                field("Q1 Target"; Rec."Q1 Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Target field.';
                }
                field("Q2 Target"; Rec."Q2 Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Target field.';
                }
                field("Q3 Target"; Rec."Q3 Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Target field.';
                }
                field("Q4 Target"; Rec."Q4 Target")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Target field.';
                }
                field("Annual Achievement"; Rec."Annual Achievement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Achievement field.';
                }
                field("Q1 Achievement"; Rec."Q1 Achievement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Achievement field.';
                }
                field("Q2 Achievement"; Rec."Q2 Achievement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Achievement field.';
                }
                field("Q3 Achievement"; Rec."Q3 Achievement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Achievement field.';
                }
                field("Q4 Achievement"; Rec."Q4 Achievement")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Achievement field.';
                }
                field("% Change"; Rec."% Change")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the % Change field.';
                }
                field("Raw Score"; Rec."Raw Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Raw Score field.';
                }
                field("Weighted Score"; Rec."Weighted Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weighted Score field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }
}