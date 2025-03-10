page 70205 "Performance Criteria list"
{
    DeleteAllowed = false;
    PageType = List;
    SaveValues = false;
    SourceTable = "Performance Contract Target";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Code"; Rec."Performance Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Performance Description"; Rec."Performance Description")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Visible = false;
                action("Workplan List")
                {
                    Promoted = true;
                    PromotedCategory = Category10;
                    PromotedIsBig = true;
                    RunObject = Page "Performance Contract Activitie";
                    RunPageLink = "Workplan Code" = FIELD("Performance Code");
                    ApplicationArea = All;
                }
            }
        }
    }
}

