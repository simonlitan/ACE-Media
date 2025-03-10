page 68491 "Appraisal Appraisee"
{
    CardPageID = "Appraisal Header";
    PageType = List;
    SourceTable = "Appraisal Card";
    SourceTableView = WHERE(Status = FILTER(Appraisee));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = All;
                }
                field("Staff No"; Rec."Staff No")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
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

