page 52178531 "opera Data Import"
{
    Caption = 'opera Data Import';
    PageType = List;
    SourceTable = "Opera  Buffer Import";

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Cost Center"; Rec."Cost Center")
                {
                    ApplicationArea = All;

                }
                field(date; Rec.date)
                {
                    ApplicationArea = All;

                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;

                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;

                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;

                }

            }
        }
    }
}
