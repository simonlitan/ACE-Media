page 70197 "Performance Cascade List 4"
{
    PageType = ListPart;
    SaveValues = true;
    SourceTable = "Perfmnc Criteria Line Cascade4";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Criteria Category"; Rec."Performance Criteria Category")
                {
                    ApplicationArea = All;
                }
                field("Performance Criteria Step Code"; Rec."Performance Criteria Step Code")
                {
                    ApplicationArea = All;
                }
                field("Performance Step Description"; Rec."Performance Step Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(units; Rec.units)
                {
                    ApplicationArea = All;
                }
                field(Weights; Rec.Weights)
                {
                    ApplicationArea = All;
                }
                field("Status Last Contract Period"; Rec."Status Last Contract Period")
                {
                    ApplicationArea = All;
                }
                field("Target (Contract Period)"; Rec."Target (Contract Period)")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
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

