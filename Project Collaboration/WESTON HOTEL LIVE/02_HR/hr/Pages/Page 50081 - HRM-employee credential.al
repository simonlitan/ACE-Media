page 50081 "HRM-employee credential"
{
    PageType = CardPart;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                label(" ")
                {
                    ApplicationArea = All;
                }
                field("Portal Password"; Rec."Portal Password")
                {
                    ExtendedDatatype = None;
                    ApplicationArea = All;
                }
                field("Changed Password"; Rec."Changed Password")
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

