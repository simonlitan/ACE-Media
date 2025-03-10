page 75016 "HRM-Appraisal Targets List"
{
    Editable = true;
    PageType = List;
    SourceTable = "HRM-Appraisal Targets";

    layout
    {
        area(content)
        {
            repeater(genaral)
            {
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
}

