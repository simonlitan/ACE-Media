page 52178774 "PROC-Procurement Plan Lines"
{
    PageType = ListPart;
    SourceTable = "PROC-Procurement Plan Lines";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Type No"; Rec."Type No")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("Remaining Qty"; Rec."Remaining Qty")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

