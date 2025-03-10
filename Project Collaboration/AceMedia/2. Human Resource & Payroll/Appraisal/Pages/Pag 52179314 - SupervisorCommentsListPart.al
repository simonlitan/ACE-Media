page 52179314 "Supervisor Comments ListPart"
{
    Caption = 'Supervisor Comments ListPart';
    PageType = ListPart;
    SourceTable = "Supervisors Comments";

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Comment field.';
                }

            }
        }
    }
}
