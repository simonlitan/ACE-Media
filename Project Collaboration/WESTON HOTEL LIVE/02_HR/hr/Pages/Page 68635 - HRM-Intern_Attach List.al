page 68635 "HRM-Intern&Attach List"
{
    CardPageID = "HRM-Intern&Attach  Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HRM-Internships&Attachments";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = All;
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = All;
                }
                field("Ref No"; Rec."Ref No")
                {
                    ApplicationArea = All;
                }
                field("Year Of Study"; Rec."Year Of Study")
                {
                    ApplicationArea = All;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = All;
                }
                field(Renewable; Rec.Renewable)
                {
                    ApplicationArea = All;
                }
                field(Paid; Rec.Paid)
                {
                    ApplicationArea = All;
                }
                field(Disability; Rec.Disability)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Attachment Letter")
            {
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                //RunObject = Report 68634;
            }
            action("Memo Letter")
            {
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                // RunObject = Report 68635;
            }
            action("Internship Letter")
            {
                Image = CashFlow;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                //RunObject = Report 68636;
            }
            action("Recommendation Letter")
            {
                Image = RollUpCosts;
                Promoted = true;
                PromotedCategory = Category4;
                ApplicationArea = All;
                //RunObject = Report 68637;
            }
        }
    }
}

