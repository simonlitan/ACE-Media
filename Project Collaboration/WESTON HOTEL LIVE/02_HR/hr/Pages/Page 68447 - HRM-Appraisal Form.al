page 68447 "HRM-Appraisal Form"
{
    PageType = Document;
    SourceTable = "HRM-Employee Appraisals";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Employee.""First Name"" + ' ' + Employee.""Middle Name"" + ' ' + Employee.""Last Name"""; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
                {
                    Caption = 'Names';
                    ApplicationArea = All;
                }
                field("Employee.""Department Code"""; Employee."Department Code")
                {
                    Caption = 'Department';
                    ApplicationArea = All;
                }
                field("Employee.""Date Of Join"""; Employee."Date Of Join")
                {
                    Caption = 'Date Employed';
                    ApplicationArea = All;
                }
                field("Employee.Position"; Employee.Position)
                {
                    Caption = 'Job Position';
                    ApplicationArea = All;
                }
                field("Employee.""Job Title"""; Employee."Job Title")
                {
                    Caption = 'Job Title';
                    ApplicationArea = All;
                }
                field("Jobs.Grade"; Jobs.Grade)
                {
                    Caption = 'Grade';
                    ApplicationArea = All;
                }
                field("Jobs.Objective"; Jobs.Objective)
                {
                    Caption = 'Job Objective/Function';
                    ApplicationArea = All;
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                }
                field("No. Supervised (Directly)"; Rec."No. Supervised (Directly)")
                {
                    ApplicationArea = All;
                }
                field("No. Supervised (In-Directly)"; Rec."No. Supervised (In-Directly)")
                {
                    ApplicationArea = All;
                }
            }
            // part(Control1102755005;"HRM-Key Responsibil Subform")
            // {
            //     SubPageLink = "Job ID"=FIELD("Job ID");
            // }
        }
    }

    actions
    {
        area(processing)
        {
            action("Next Page   >>")
            {
                Caption = 'Next Page   >>';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if EmployeeApp.Get(Rec."Employee No", Rec."Appraisal Type", Rec."Appraisal Period") then
                        PAGE.RunModal(39005893, EmployeeApp);
                end;
            }
        }
    }

    var
        Employee: Record "HRM-Employee C";
        Jobs: Record "HRM-Company Jobs";
        EmployeeApp: Record "HRM-Employee Appraisals";
        Text19035248: Label 'Key Responsibilities';
}

