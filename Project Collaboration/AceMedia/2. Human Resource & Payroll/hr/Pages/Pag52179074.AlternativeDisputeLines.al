page 52179074 "Alternative Dispute Lines"
{
    Caption = 'Alternative Dispute Lines';
    CardPageId = "Alternative Dispute L Card";
    //Editable = false;
    PageType = ListPart;
    SourceTable = "Alternative DR Line";
    // DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Recommendations; Rec.Recommendations)
                {
                    ApplicationArea = All;
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Id field.';
                }
            }
        }
    }
}
