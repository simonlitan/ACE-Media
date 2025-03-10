page 52179156 "HRM-Employment History (B)"
{
    PageType = card;
    SourceTable = "HRM-Employee C";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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

                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
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

        KPACode: Code[20];
        Text19034996: Label 'Employment History';
}

