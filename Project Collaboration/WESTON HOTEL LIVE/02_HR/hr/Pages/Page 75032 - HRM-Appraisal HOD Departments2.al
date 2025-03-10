page 75032 "HRM-Appraisal HOD Departments2"
{
    PageType = List;
    SourceTable = "HRM-HOD Dept. Loading";

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
                field("Appraisal Period Code"; Rec."Appraisal Period Code")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Target"; Rec."Appraisal Target")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Target Description"; Rec."Appraisal Target Description")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
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

