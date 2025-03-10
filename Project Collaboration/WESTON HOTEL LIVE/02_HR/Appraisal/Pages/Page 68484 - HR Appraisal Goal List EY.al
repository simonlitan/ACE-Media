page 68484 "HR Appraisal Goal List EY"
{
    CardPageID = "HR Appraisal Goal EV";
    PageType = List;
    SourceTable = "HR Appraisal indicators";
    //SourceTableView = WHERE(Test1=CONST(1), Code=CONST(1));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                // field("Employee No";"Employee No")
                // {
                // }
                // field("Employee Name";"Employee Name")
                // {
                // }
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
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Test; Rec.Test)
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

