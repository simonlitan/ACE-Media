page 52178923 "Internal quality audit list"
{
    Caption = 'ISO-Internal quality audit';
    PageType = List;
    SourceTable = "Internal quality audit";
    CardPageId = "Internal quality audit Card";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Audit Number"; Rec."Audit No")
                {
                    ApplicationArea = All;

                }
                field("Audit Date"; Rec."Audit Date")
                {
                    ApplicationArea = All;

                }
                field("Audit Purpose"; Rec."Audit purpose")
                {
                    ApplicationArea = All;

                }
            }

        }
    }
}
