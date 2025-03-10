page 52179304 "Means Of Verification"
{
    Caption = 'Means Of Verification';
    PageType = List;
    SourceTable = "Means Of Verification";

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
