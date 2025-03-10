page 52178574 "Loyalty Series Setups"
{
    PageType = Document;
    SourceTable = "Loyalty Setups";
    layout
    {
        area(Content)
        {
            group(General)
            {

                field("Loyalty Customers"; Rec."Loyalty Customers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loyalty Customers field.';
                }
                field("Sales Capture"; Rec."Sales Capture")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Capture field.';
                }
                field(WorkPlan; Rec.WorkPlan)
                {
                    ApplicationArea = all;
                }
            }
        }

    }
}