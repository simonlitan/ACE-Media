page 68453 "Appraisal  Closed List"
{
    CardPageID = "Appraisal Closed";
    PageType = List;
    SourceTable = "Appraisal Card";
    SourceTableView = WHERE(Status = FILTER("Closed/HR"));

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

