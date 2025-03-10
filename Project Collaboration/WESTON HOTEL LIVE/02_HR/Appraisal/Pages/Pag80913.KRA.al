page 50219 "KRA"
{
    ApplicationArea = All;
    Caption = 'Key Results Areas';
    PageType = List;
    SourceTable = KRA;
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
