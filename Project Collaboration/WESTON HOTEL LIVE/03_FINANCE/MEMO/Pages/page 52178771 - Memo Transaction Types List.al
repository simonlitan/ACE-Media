page 52178771 "Memo Transaction Types List"
{
    PageType = List;
    SourceTable = "Memo-Transaction Type";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Transaction Type Desc."; Rec."Transaction Type Desc.")
                {
                    ApplicationArea = All;
                }
                field("Is Taxable"; Rec."Is Taxable")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

