page 50039 "Payroll Journal Lines"
{
    PageType = ListPart;
    SourceTable = "Payroll Journal Lines";

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
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GL Account field.';
                }
                field("Bal Account"; Rec."Bal Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal Account field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }

                field("Group Text"; Rec."Group Text")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group Text field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }

    }

}