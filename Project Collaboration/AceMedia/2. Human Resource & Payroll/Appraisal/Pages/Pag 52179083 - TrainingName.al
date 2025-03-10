page 52179083 "Training Name"
{
    Caption = 'Training Name';
    PageType = List;
    SourceTable = "Training Name";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = all;
                }
                field("Training Name"; Rec."Training Name")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
