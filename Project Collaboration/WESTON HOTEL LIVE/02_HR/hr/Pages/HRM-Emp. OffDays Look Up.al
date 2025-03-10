page 50048 "HRM-Emp. OffDays Look Up"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "HRM-Emp. OffDays";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                // field("Leave Code"; Rec."Leave Code")
                // {
                //     ApplicationArea = All;
                // }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = All;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                }
                field("Acrued Days"; Rec."Acrued Days")
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

