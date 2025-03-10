page 52179254 "Other mPCA list"
{
    CardPageID = "Other massPCAs";
    PageType = List;
    SourceTable = prMassPCAHD;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Change Advice Serial No."; Rec."Change Advice Serial No.")
                {
                    ApplicationArea = All;
                }

                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field(Effected; Rec.Effected)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effected field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(Status; Rec.Status)
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

