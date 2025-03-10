page 70226 "Performance Criterial Line"
{
    CardPageID = "D Operational Criteria";
    PageType = List;
    SaveValues = true;
    SourceTable = "Performance Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Criteria Code"; Rec."Performance Criteria Code")
                {
                    ApplicationArea = All;
                }
                field("Performance Criter Description"; Rec."Performance Criter Description")
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
                    RunPageLink = "Workplan Code" = FIELD("Performance Criteria Code");
                    ApplicationArea = All;
                }
            }
        }
    }
}

