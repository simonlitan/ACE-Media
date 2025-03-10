page 52179315 "Appraisees Comments Listpart"
{
    Caption = 'Appraisees Comments Listpart';
    PageType = ListPart;
    SourceTable = "Appraisees Comments";

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    Caption = 'Appraisee Comments';
                    ToolTip = 'Specifies the value of the Comments field.';
                }


            }
        }
    }
}
