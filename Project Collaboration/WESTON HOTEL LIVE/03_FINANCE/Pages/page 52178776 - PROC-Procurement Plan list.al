/// <summary>
/// Page PROC-Procurement Plan list (ID 52178776).
/// </summary>
page 52178776 "PROC-Procurement Plan list"
{
    CardPageID = "PROC-Procurement Plan Header";
    PageType = List;
    Editable = false;
    InsertAllowed = true;
    DeleteAllowed = false;
    ModifyAllowed = false;

    SourceTable = "PROC-Procurement Plan Header";



    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field(Project; Rec.Projects)
                {
                    ApplicationArea = all;
                }
                field("Procurement Plan Period"; Rec."Procurement Plan Period")
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

