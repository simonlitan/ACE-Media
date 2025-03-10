page 52179249 "prPCAMassLines"
{
    PageType = ListPart;
    SourceTable = prMassPCALines;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Change Advice Serial No."; Rec."Change Advice Serial No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Change Advice Serial No. field.';
                }
                field("Employee Code"; Rec."Employee Code")
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
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Recurance Index"; Rec."Recurance Index")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recurance Index field.';
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {

        }
    }

    var
        objLines: Record prMassPCALines;
        SalaryGrades: Record "HRM-Salary Grades";
        objemp: Record "HRM-Employee C";
}

