page 68482 "HR Appraisal Goal Setting List"
{
    CardPageID = "HR Appraisal Goal Setting L";
    PageType = List;
    SourceTable = "HR Appraisal indicators";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field("Entry No";"Entry No")
                // {
                // }
                // field("Employee No";"Employee No")
                // {
                // }
                // field("Employee Name";"Employee Name")
                // {
                // }
                // field("Job Title";"Job Title")
                // {

                field(Test2; Rec.Test2)
                {
                    ApplicationArea = All;
                }
                field(Criteria; Rec.Criteria)
                {
                    ApplicationArea = All;
                }
                field("Performance Indicator"; Rec."Performance Indicator")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Test1; Rec.Test1)
                {
                    ApplicationArea = All;
                }
                field(Test; Rec.Test)
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

