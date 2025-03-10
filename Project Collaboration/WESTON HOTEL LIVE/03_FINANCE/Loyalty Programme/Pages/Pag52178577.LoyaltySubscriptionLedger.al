page 52178577 "Loyalty Subscription Ledger"
{
    PageType = List;
    SourceTable = "Loyalty Subscription Ledger";
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Loyalty Period"; Rec."Loyalty Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loyalty Period field.';
                }
                field("Subscription Amount"; Rec."Subscription Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Subscription Amount field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Batch No."; Rec."Batch No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch No. field.';
                }
                field("Is Reversal"; Rec."Is Reversal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Is Reversal field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Loyalty Programme"; Rec."Programme Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loyalty Programme field.';
                }
            }
        }
    }
}