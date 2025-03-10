page 52179124 "PC Indicator Results"
{
    PageType = List;
    SourceTable = "PC Indicator Results";
    DeleteAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Indicator Code"; Rec."Indicator Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indicator Code field.';
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
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Weight; Rec.Weight)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Unit; Rec.Unit)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit field.';
                }
                field("PC Period"; Rec."PC Period")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PC Period field.';
                }
                field("Annual Target"; Rec."Annual Target")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Target field.';
                }
                field("Q1 Target"; Rec."Q1 Target")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Target field.';
                }
                field("Q2 Target"; Rec."Q2 Target")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Target field.';
                }
                field("Q3 Target"; Rec."Q3 Target")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Target field.';
                }
                field("Q4 Target"; Rec."Q4 Target")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Target field.';
                }
                field("Quater Period"; Rec."Quater Period")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quater Period field.';
                }
                field(Score; Rec.Score)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Score field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Post Score")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.Posted := true;
                    Message('Posted Successfully');

                end;

            }
        }
    }

    trigger OnOpenPage()
    begin

    end;

}