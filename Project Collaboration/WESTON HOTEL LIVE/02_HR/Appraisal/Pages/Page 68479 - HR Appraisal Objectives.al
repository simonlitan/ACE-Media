page 68479 "HR Appraisal Objectives"
{
    PageType = ListPart;
    SourceTable = "Appraisal Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = All;
                }
                field("Criteria Code"; Rec."Criteria Code")
                {
                    ApplicationArea = All;
                }
                field("Criteria Description"; Rec."Criteria Description")
                {
                    ApplicationArea = All;
                }
                field("Performance Indicator Code"; Rec."Performance Indicator Code")
                {
                    Caption = 'Indicator Code';
                    ApplicationArea = All;
                }
                field("Performance Indicator Descript"; Rec."Performance Indicator Descript")
                {
                    ApplicationArea = All;
                }
                field(Ratings; Rec.Ratings)
                {
                    ApplicationArea = All;
                }
                field("Rating Description"; Rec."Rating Description")
                {
                    ApplicationArea = All;
                }
                field("HOD Asssement Summary"; Rec."HOD Asssement Summary")
                {
                    ApplicationArea = All;
                }
                field("Weak Areas Discussed"; Rec."Weak Areas Discussed")
                {
                    Caption = 'Weak Areas discussed with employee(HOD General Comments)';
                    ApplicationArea = All;
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    Caption = 'Employee Comments';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

