page 52179166 "HRM-Job Responsibilities"
{
    Caption = 'HR Job Responsibilities';
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Qualification';
    SourceTable = "HRM-Job Responsiblities (B)";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Code"; Rec."Responsibility Code")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755013; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {

        }
    }

    var
        HRJobResponsibilities: Record "HRM-Job Responsiblities (B)";

}

