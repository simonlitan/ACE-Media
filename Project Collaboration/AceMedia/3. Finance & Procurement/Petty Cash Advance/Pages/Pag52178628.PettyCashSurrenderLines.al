page 52178628 "PettyCash Surrender Lines"
{
    PageType = ListPart;
    SourceTable = "PettyCash Surrender Details";

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("Surrender No."; Rec."Surrender No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Surrender No. field.';
                }
                field("Account No:"; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No: field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Advance Holder"; Rec."Advance Holder")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Holder field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                }
                field("Doc No."; Rec."Doc No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Doc No. field.';
                }
            }
        }
    }


}