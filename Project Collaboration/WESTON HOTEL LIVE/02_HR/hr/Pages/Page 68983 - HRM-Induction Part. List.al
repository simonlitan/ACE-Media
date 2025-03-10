page 68983 "HRM-Induction Part. List"
{
    PageType = ListPart;
    SourceTable = "HRM-Staff  Induction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Group';
                field("Induction Code"; Rec."Induction Code")
                {
                    ApplicationArea = All;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                }
                field("Employee name"; Rec."Employee name")
                {
                    ApplicationArea = All;
                }
                field("Officer Incharge"; Rec."Officer Incharge")
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field(From; Rec.From)
                {
                    ApplicationArea = All;
                }
                field(Todate; Rec.Todate)
                {
                    ApplicationArea = All;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                }
                field("Days Attended"; Rec."Days Attended")
                {
                    ApplicationArea = All;
                }
                field(Depatment; Rec.Depatment)
                {
                    Caption = 'Department';
                    ApplicationArea = All;
                }
                field("Induction Status"; Rec."Induction Status")
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

