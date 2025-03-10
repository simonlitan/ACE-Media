page 52179205 "HRM-Interview Details List"
{
    CardPageID = "HRM-Interview Details Card";
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Interview Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
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

