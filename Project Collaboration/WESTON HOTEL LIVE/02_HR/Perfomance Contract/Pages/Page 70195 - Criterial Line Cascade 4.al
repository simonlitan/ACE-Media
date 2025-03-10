page 70195 "Criterial Line Cascade 4"
{
    CardPageID = "Criteria Cascade 4";
    PageType = List;
    SaveValues = false;
    SourceTable = "Performance Criteria Cascade 4";

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
                field(Directorates; Rec.Directorates)
                {
                    ApplicationArea = All;
                }
                field(Departments; Rec.Departments)
                {
                    ApplicationArea = All;
                }
                field("Contract Period"; Rec."Contract Period")
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

