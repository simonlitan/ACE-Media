page 52179303 Activities
{
    Caption = 'Activities';
    PageType = List;

    SourceTable = Activities;
    UsageCategory = Lists;

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
