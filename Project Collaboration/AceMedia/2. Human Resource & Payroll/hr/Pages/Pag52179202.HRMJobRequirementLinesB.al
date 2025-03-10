page 52179202 "HRM-Job Requirement Lines(B)"
{
    Caption = 'HR Job Requirements';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Job Requirements";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = all;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field(Mandatory; Rec.Mandatory)
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

