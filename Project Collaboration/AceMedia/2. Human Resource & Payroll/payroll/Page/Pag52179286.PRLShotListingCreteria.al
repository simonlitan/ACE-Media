page 52179286 "PRL-Shot Listing Creteria"
{
    PageType = Document;
    SourceTable = "HRM-Jobs";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                }

                field("Total Score"; Rec."Total Score")
                {
                    ApplicationArea = All;
                }

            }
            part(Control1000000008; "PRL-Short Listing Lines")
            {
                SubPageLink = "Job ID" = FIELD("Job ID");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

