page 52179075 "Alternative Dispute L Card"
{
    Caption = 'Alternative Dispute LCard';
    PageType = Card;
    SourceTable = "Alternative DR Line";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }

            }
            group("Recommendations ")
            {
                field(Recommendations; Rec.Recommendations)
                {
                    ShowCaption = false;
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
        }
    }
}
