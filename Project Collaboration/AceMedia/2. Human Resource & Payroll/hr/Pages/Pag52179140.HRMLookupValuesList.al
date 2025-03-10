page 52179140 "HRM-Lookup Values List"
{
    CardPageID = "HRM-Lookup Values Card";
    DeleteAllowed = false;
    //InsertAllowed = false;
    //ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Lookup Values";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                ShowCaption = false;
                field(Type; Rec.Type)
                {
                    //Enabled = false;
                    ApplicationArea = All;
                }
                field("Code"; Rec.Code)
                {
                    // Enabled = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    // Editable = false;
                    ApplicationArea = All;
                }
            }
        }

    }

    actions
    {
    }
}

