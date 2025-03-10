page 52179119 "HRM-Job Requirement Lines (B)"
{
    PageType = ListPart;
    SourceTable = "HRM-Job Requirement";
    InsertAllowed = true;
    DeleteAllowed = false;
    ModifyAllowed = true;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = All;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = All;
                }
                field(Qualification; Rec.Qualification)
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field("Score ID"; Rec."Score ID")
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

