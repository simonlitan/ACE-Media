page 68468 "HR Appraisal Goal Setting NY"
{
    PageType = List;
    SourceTable = "HR Appraisal Goal Setting NY";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Planned Targets/Objectives"; Rec."Planned Targets/Objectives")
                {
                    ApplicationArea = All;
                }
                field("Success Measures"; Rec."Success Measures")
                {
                    ApplicationArea = All;
                }
                field(Timeline; Rec.Timeline)
                {
                    ApplicationArea = All;
                }
                field("Support Neede"; Rec."Support Neede")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
            }
        }
        area(processing)
        {
            action("&Next Page")
            {
                Caption = '&Next Page';
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "HR Appraisal Training Develop";
                RunPageLink = "Appraisal No" = FIELD("Appraisal No");
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //FORM.RUNMODAL(39005843
                    //PAGE.RUN(39003985,Rec);
                end;
            }
        }
    }
}

