page 52179081 Trainings
{
    ApplicationArea = All;
    Caption = 'Trainings';
    PageType = List;
    SourceTable = Trainings;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Training Identification"; Rec."Training Identification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Identification field.';
                }

            }
        }
    }
}
