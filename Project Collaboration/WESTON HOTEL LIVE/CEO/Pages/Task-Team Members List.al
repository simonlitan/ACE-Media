page 52178938 "Task-Team Members List"
{
    PageType = ListPart;
    SourceTable = "Task-Team Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Team Code"; Rec."Team Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    //Visible = false;
                }
                field("PF Number"; Rec."PF Number")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                }
                field(Responsibility; Rec.Responsibility)
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

