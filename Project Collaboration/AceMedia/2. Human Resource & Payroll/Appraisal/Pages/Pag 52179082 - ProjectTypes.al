page 52179082 "Project Types"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Project Types";
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
                field("Project Types"; Rec."Project Types")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Identification field.';
                }

            }
        }
    }
}
