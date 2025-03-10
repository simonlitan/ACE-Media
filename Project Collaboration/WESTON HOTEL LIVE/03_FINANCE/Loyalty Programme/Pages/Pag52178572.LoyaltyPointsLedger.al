page 52178572 "Loyalty Points Ledger"
{
    PageType = ListPart;
    SourceTable = "Loyalty Points Ledger";

    layout
    {
        area(Content)
        {
            repeater(general)
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
                field("Sales Amount"; Rec."Sales Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Amount field.';
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
                field("Total Points"; Rec."Total Points")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Points field.';
                }
                field("Equivalence to Cash"; Rec."Equivalence to Cash")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Equivalence to Cash field.';
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
                field("Loyalty Programme"; Rec."Loyalty Programme")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loyalty Programme field.';
                }
            }
        }
    }
}