page 52178762 "FIN-Memo Expense Codes Setup"
{
    PageType = List;
    SourceTable = "FIN-Memo Expense Codes Setup";

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
                field(Description; Rec.Description)
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

