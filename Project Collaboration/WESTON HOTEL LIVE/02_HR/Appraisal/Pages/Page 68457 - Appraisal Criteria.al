page 68457 "Appraisal Criteria"
{
    PageType = List;
    SourceTable = "Appraisal Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Criteria; Rec.Criteria)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Indicators)
            {
                Caption = 'Indicators';
                action("Category Indicators")
                {
                    Caption = 'Category Indicators';
                    Image = InwardEntry;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Appraisal Indicators";
                    RunPageLink = Criteria = FIELD(Criteria),
                                  "Appraisal Year" = FIELD("Appraisal Year");
                    ApplicationArea = All;
                }
            }
        }
    }
}

