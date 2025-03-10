page 52178535 "Product group"
{
    Caption = 'Product group';
    PageType = List;
    SourceTable = "Product Groups";

    layout
    {
        area(content)
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
