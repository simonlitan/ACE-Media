page 68493 "Key Responsibilities Subform"
{
    PageType = ListPart;
    SourceTable = "Job Responsiblities";

    layout
    {
        area(content)
        {
            repeater(group)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
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

