page 68458 "Appraisal Form"
{
    PageType = Document;
    SourceTable = "Employee Appraisals";

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
                // field(HRMEmployee."First Name" + ' ' + HRMEmployee."Middle Name" + ' ' + HRMEmployee."Last Name";
                //     HRMEmployee."First Name" + ' ' + HRMEmployee."Middle Name" + ' ' + HRMEmployee."Last Name")
                // {
                //     Caption = 'Names';
                // }
                // field(HRMEmployee."Department Code";
                //     HRMEmployee."Department Code")
                // {
                //     Caption = 'Department';
                // }
                // field("Date Of Join";"Date Of Join")
                // {
                //     Caption = 'Date Employed';
                // }
                // field(HRMEmployee.Position;
                //     Employee.Position)
                // {
                //     Caption = 'Job Position';
                // }
                // field(HRMEmployee."Job Title";
                //     Employee."Job Title")
                // {
                //     Caption = 'Job Title';
                // }
                // field(Jobs.Grade;
                //     Jobs.Grade)
                // {
                //     Caption = 'Grade';
                // }
                // field(Jobs.Objective;
                //     Jobs.Objective)
                // {
                //     Caption = 'Job Objective/Function';
                // }
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
            part("HRM-Key Responsibilities Subform"; "Key Responsibilities Subform")
            {
                SubPageLink = "Job ID" = FIELD("Job ID");
                ApplicationArea = All;
            }
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
                    IF EmployeeApp.GET(Rec."Employee No", Rec."Appraisal Type", Rec."Appraisal Period") THEN
                        PAGE.RUNMODAL(39005893, EmployeeApp);
                end;
            }
        }
    }

    var
        HRMEmployee: Record "HRM-Employee C";
        Jobs: Record "HRM-Company Jobs";
        EmployeeApp: Record "Employee Appraisals";
        Text19035248: Label 'Key Responsibilities';
}

