page 50050 "Denominations List"
{
    PageType = List;
    SourceTable = Denominations;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Denomination Code"; Rec.Denomination)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Remarks)
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

