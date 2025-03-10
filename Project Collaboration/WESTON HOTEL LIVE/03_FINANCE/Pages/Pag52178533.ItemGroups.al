page 52178533 "Item Groups"
{
    Caption = 'Item Groups';
    PageType = ListPart;
    SourceTable = "Item Group";

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
                    ApplicationArea = All;

                }
                field("Def. Gen. Prod. Posting Group"; Rec."Def. Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
                field("Def. Inventory Posting Group"; Rec."Def. Inventory Posting Group")
                {
                    ApplicationArea = All;

                }
                field("Def. VAT Prod. Posting Group"; Rec."Def. VAT Prod. Posting Group")
                {
                    ApplicationArea = All;

                }
                field("Def. Costing Method"; Rec."Def. Costing Method")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}
