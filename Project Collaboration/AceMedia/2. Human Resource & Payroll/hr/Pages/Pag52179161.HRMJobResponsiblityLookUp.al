page 52179161 "HRM-Job Responsiblity Look Up"
{
    PageType = ListPart;
    SourceTable = "HRM-Job Responsiblities";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
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

