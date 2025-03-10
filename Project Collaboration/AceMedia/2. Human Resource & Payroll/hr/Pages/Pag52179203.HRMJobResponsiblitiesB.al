page 52179203 "HRM-Job Responsiblities (B)"
{
    UsageCategory = Lists;
    ApplicationArea = all;
    Caption = 'Job Responsiblities';
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
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Responsibility Code"; Rec."Responsibility Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Responsibility Code field.';
                }

                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = all;
                }
                field(Remarks; Rec.Remarks)
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

