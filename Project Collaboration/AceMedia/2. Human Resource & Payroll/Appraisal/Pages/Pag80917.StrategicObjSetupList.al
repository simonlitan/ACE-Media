page 52179374 "Strategic Obj Setup List"
{
    ApplicationArea = All;
    Caption = 'Strategic Obj Setup List';
    PageType = List;
    SourceTable = "Strategic Objective Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // field("Code"; Rec."Code")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the code field.';
                // }
                field("Strategic Pillar"; Rec."Strategic Pillar")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategic Pillar or KRA field.';
                }
                field(Activity; Rec."Strategic Objective")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategic Objective field.';
                }
                field(Description; Rec.Strategy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategy field.';
                }
            }
        }
    }
}
