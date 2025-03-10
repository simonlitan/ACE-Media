page 52178983 "ICT Support Desk team"
{
    PageType = List;
    DeleteAllowed = false;
    SourceTable = "ICT Support Desk team";
    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field(Responsibility; Rec.Responsibility)
                {
                    Caption = 'Assigned Designation';
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(EMail; Rec.EMail)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }

        }
    }
}