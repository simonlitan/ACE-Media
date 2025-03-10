page 52178695 "FIN-Memo Details"
{
    PageType = List;
    SourceTable = "FIN-Memo Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Expense Code"; Rec."Expense Code")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Payee Type"; Rec."Payee Type")
                {
                    ApplicationArea = All;
                }
                field("Staff no."; Rec."Staff no.")
                {
                    ApplicationArea = All;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region field.';
                }


                field(Rate; Rec.Rate)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Days; Rec.Days)
                {
                    ApplicationArea = All;

                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("PAYE Amount"; Rec."PAYE Amount")
                {
                    Editable = false;
                    Enabled = false;
                    visible = false;
                    ApplicationArea = All;
                }
                field("Compute P.A.Y.E."; Rec."Compute P.A.Y.E.")
                {
                    visible = false;
                    ApplicationArea = All;
                }
                field("P.A.Y.E. Rate"; Rec."P.A.Y.E. Rate")
                {
                    Editable = false;
                    Enabled = false;
                    visible = false;
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    Editable = false;
                    Enabled = false;
                    visible = false;
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    Editable = false;
                    Enabled = false;
                    visible = false;
                    ApplicationArea = All;
                }
                field("Period Year"; Rec."Period Year")
                {
                    Editable = false;
                    Enabled = false;
                    visible = false;
                    ApplicationArea = All;
                }
                field("Current Gross"; Rec."Current Gross")
                {
                    visible = false;
                    ApplicationArea = All;
                }
                field("Is Taxable"; Rec."Is Taxable")
                {
                    visible = false;
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}