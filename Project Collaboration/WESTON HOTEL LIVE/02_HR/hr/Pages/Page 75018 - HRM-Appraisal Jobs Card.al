page 75018 "HRM-Appraisal Jobs Card"
{
    PageType = Card;
    SourceTable = "HRM-Appraisal Jobs";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Category"; Rec."Appraisal Category")
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;

                }
                field("Appraisal Year Code"; Rec."Appraisal Year Code")
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

