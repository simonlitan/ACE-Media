page 52179368 "Comments List"
{
    ApplicationArea = All;
    Caption = 'Comments List';
    PageType = List;
    SourceTable = "Detailed Appraisal Comments";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }

            }
        }
    }
}
