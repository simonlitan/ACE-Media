/// <summary>
/// Page HRM-Appraisal Goal List Sup (ID 69002).
/// </summary>
page 69002 "HRM-Appraisal Goal List Sup"
{
    CardPageID = "HRM-Appraisal Goal Setting (B)";
    PageType = List;
    SourceTable = "HRM-Appraisal Goal Setting H";
    SourceTableView = WHERE(Sent = CONST("At Supervisor"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = All;
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Sent; Rec.Sent)
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

