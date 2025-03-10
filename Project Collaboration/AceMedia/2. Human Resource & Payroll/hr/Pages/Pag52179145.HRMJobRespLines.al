page 52179145 "HRM-Job Resp. Lines"
{
    // CardPageID = "HRM-Job Responsibilities";
    PageType = List;
    SourceTable = "HRM-Job Responsiblities (B)";
    caption = 'Job Description';

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
                    caption = 'Code';
                    ApplicationArea = all;

                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = all;
                    caption = 'Description';

                }

            }
        }
    }

    actions
    {
    }
}

