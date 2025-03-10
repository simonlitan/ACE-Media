page 52179125 "PC Periods"

{
    PageType = List;
    SourceTable = "PC Periods";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("Period Year"; Rec."PC Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Weight; Rec.Weight)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Quaterly Periods")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                RunObject = page "PC Quaterly Periods";
                RunPageLink = "PC Period" = field("PC Period");
            }
            action("Indicators")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = process;
                RunObject = page "PC Indicator Names";
                RunPageLink = "PC Period" = field("PC Period");
            }


        }
    }
}