page 68492 "Appraisal HRList"
{
    CardPageID = "Appraisal HR";
    PageType = List;
    SourceTable = "Appraisal Card";
    SourceTableView = WHERE(Status = FILTER(Moderation));

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

