page 68339 "HRM-Job Resp. Lines"
{
    // CardPageID = "HRM-Job Responsibilities";
    PageType = List;
    SourceTable = "HRM-Job Responsiblities (B)";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Responsibility Code"; Rec."Responsibility Code")
                {
                    ApplicationArea = all;

                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = all;

                }

            }
        }
    }

    actions
    {
    }
}

