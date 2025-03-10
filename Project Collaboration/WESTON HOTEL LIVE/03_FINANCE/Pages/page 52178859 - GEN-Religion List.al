page 52178859 "GEN-Religion List"
{
    PageType = List;
    SourceTable = "GEN-Religion";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Relegion; Rec.Relegion)
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

