page 52179289 "HRM-J. Working Relationships"
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
                Editable = false;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                }

            }
            part(KPA; "HRM-Job Working Relationships")
            {
                SubPageLink = "Job ID" = FIELD("Job ID");
                ApplicationArea = All;
            }
            field(Control1000000006; '')
            {
                CaptionClass = Text19007263;
                ShowCaption = false;
                Style = Standard;
                StyleExpr = TRUE;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }

    var
        Text19007263: Label 'Working Relationships';
}

