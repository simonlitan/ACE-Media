page 52178521 "Petty Cash Advance Lines"
{
    PageType = ListPart;
    SourceTable = "Advance PettyCash Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }

                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance Type field.';
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
                field("Petty Cash Holder"; Rec."Petty Cash Holder")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Petty Cash Holder field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = all;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
            }
        }
    }
}