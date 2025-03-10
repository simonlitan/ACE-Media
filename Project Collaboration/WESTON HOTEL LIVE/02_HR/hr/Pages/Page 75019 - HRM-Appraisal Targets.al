page 75019 "HRM-Appraisal Targets"
{
    PageType = List;
    SourceTable = "HRM-Appraisal Targets";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Appraisal Job Code"; Rec."Appraisal Job Code")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Year Code"; Rec."Appraisal Year Code")
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Desription; Rec.Desription)
                {
                    ApplicationArea = All;

                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        UnitsSubj: Record "HRM-Appraisal Targets";
}

