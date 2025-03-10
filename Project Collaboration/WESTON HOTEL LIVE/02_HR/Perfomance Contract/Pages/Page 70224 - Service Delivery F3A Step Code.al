page 70224 "Service Delivery F3A Step Code"
{
    PageType = List;
    SourceTable = "Service Delivery F3A Step Code";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Steps; Rec.Steps)
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

