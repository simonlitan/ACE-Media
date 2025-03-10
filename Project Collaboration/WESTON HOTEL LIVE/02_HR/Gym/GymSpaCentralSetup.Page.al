page 50055 "Gym/Spa Central Setup"
{
    PageType = List;
    SourceTable = "Gym/Spa Central Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Title Code"; Rec."Title Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Category; Rec.Category)
                {
                }
            }
        }
    }

    actions
    {
    }
}

