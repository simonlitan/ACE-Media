page 52178525 "FIN-Budget Entries2"
{
    PageType = List;
    SourceTable = "FIN-Budget Entries";

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ToolTip = 'Specifies the value of the Budget Name field.';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ToolTip = 'Specifies the value of the G/L Account No. field.';
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                    //Editable = false;
                }

                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                    //Editable = false;
                }

                field("Transaction Type"; Rec."Transaction Type")
                {
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Commitment Status"; Rec."Commitment Status")
                {
                    ToolTip = 'Specifies the value of the Commitment Status field.';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    ApplicationArea = All;
                    //Editable = false;
                }

                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ToolTip = 'Specifies the value of the Document No field.';
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Document Description"; Rec."Document Description")
                {
                    ToolTip = 'Specifies the value of the Document Description field.';
                    ApplicationArea = All;
                    //Editable = false;
                }

            }
        }
    }
}