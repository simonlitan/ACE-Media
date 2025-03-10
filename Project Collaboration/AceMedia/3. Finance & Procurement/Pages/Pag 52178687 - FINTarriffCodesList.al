page 52178687 "FIN-Tarriff Codes List"
{
    PageType = List;
    SourceTable = "FIN-Tariff Codes";

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
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = all;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

