page 52178704 "Memo Details Preview"
{
    Editable = false;
    PageType = List;
    SourceTable = "FIN-Memo Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Memo No."; Rec."Memo No.")
                {
                    ApplicationArea = All;
                }
                field("Staff no."; Rec."Staff no.")
                {
                    ApplicationArea = All;
                }
                field("Expense Code"; Rec."Expense Code")
                {
                    ApplicationArea = All;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("P.A.Y.E. Rate"; Rec."P.A.Y.E. Rate")
                {
                    ApplicationArea = All;
                }
                field("PAYE Amount"; Rec."PAYE Amount")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Is Taxable"; Rec."Is Taxable")
                {
                    ApplicationArea = All;
                }
                field("Payee Type"; Rec."Payee Type")
                {
                    ApplicationArea = All;
                }
                field("Memo Status"; Rec."Memo Status")
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                }
                field("Period Year"; Rec."Period Year")
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

