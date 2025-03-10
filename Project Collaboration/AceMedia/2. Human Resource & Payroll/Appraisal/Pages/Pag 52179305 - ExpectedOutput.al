page 52179305 "Expected Output"
{
    Caption = 'Expected Output';
    PageType = List;
    SourceTable = "Expected Output";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
