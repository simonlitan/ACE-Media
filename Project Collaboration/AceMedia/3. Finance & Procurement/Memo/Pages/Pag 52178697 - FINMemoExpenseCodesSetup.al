page 52178697 "FIN-Memo Expense Codes Setup"
{
    PageType = List;
    SourceTable = "FIN-Memo Expense Codes Setup";
    SaveValues = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {



                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

