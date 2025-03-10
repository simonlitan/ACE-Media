page 68434 "HRM-Employment History (B)"
{
    PageType = card;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Genera';
                Editable = false;
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
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = all;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = all;
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = all;
                }
            }
            part(KPA; "HRM-Emp. History Lines")
            {
                Caption = 'Employment History';
                ApplicationArea = all;
                SubPageLink = "Employee No." = FIELD("No.");
            }

        }
    }

    actions
    {
    }

    var
        KPAObjectives: Record "HRM-KPA Objectives (B)";
        KPACode: Code[20];
        Text19034996: Label 'Employment History';
}

