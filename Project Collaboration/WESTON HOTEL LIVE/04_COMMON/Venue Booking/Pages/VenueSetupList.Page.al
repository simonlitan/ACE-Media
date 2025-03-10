page 52179096 "Venue Setup List"
{
    PageType = List;
    SourceTable = "Venue Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Venue Code"; Rec."Venue Code")
                {
                    ApplicationArea = All;
                }
                field("Venue Description"; Rec."Venue Description")
                {
                    Enabled = false;
                    ApplicationArea = All;
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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

