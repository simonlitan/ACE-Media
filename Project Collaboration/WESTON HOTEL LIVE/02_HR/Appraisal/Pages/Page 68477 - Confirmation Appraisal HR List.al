page 68477 "Confirmation Appraisal HR List"
{
    CardPageID = "HR Confirmation Appraisal hr";
    PageType = List;
    SourceTable = "Appraisal Card Confirmation";
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
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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

