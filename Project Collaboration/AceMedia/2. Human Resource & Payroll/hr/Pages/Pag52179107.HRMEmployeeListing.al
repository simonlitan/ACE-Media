page 52179107 "HRM-Employee Listing"
{
    DataCaptionFields = "No.", "First Name", "Middle Name", "Last Name", Status, "Global Dimension 1 Code", "Shortcut Dimension 3 Code";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Employee C";
    SourceTableView = order(ascending) where(status = filter('Active'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

