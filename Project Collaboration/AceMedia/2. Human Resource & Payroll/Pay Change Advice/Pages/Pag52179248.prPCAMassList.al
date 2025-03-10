page 52179248 "prPCAMassList"
{
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    CardPageID = "prMassPCA Card";
    PageType = List;
    SourceTable = prMassPCAHD;
    SourceTableView = WHERE(Status = FILTER('<> Posted'));

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
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }

                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                }

                field(Comments; Rec.Comments)
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

