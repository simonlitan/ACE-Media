page 50029 "HRM Appraisal Role Center"
{
    Caption = 'HRM Appraisal Role Center';
    PageType = RoleCenter;
    UsageCategory = Administration;
    ApplicationArea = All, Basic, Suite, Advance;

    layout
    {
        area(rolecenter)
        {
            group(Control29)
            {
                ShowCaption = false;
                /* part("Employees Cue";"HRM-Employee Cue")
                 {
                     Caption = 'Employees Cue';
                 }
                 */
                systempart(Control27; Outlook)
                {
                }
            }
            group(Control26)
            {
                ShowCaption = false;
                systempart(Control24; Links)
                {
                }
                systempart(Control23; MyNotes)
                {
                }
            }
        }
    }


    actions
    {
        area(sections)
        {
            group(EmployeeMan)
            {
                Caption = 'Employee Manager';
                Image = HumanResources;
                action(Action22)
                {
                    ApplicationArea = all;
                    Caption = 'Employee List';
                    RunObject = Page "HRM-Employee List";
                }

            }
            group(Appraisal)
            {
                Caption = 'HRM Appraisal';

                action(HRMAppraisal)
                {
                    Caption = 'Institution Appraisals';
                    ApplicationArea = All;

                    RunObject = Page "HRM Perfomance AppraisalL";
                }
                action(DPrtAppraisal)
                {
                    Caption = 'Departmental Appraisals';
                    ApplicationArea = All;

                    RunObject = Page "Depart Perfomance AppraisalL";
                }
                action(IndividualAppraisals)
                {
                    Caption = 'Individual Appraisals';
                    ApplicationArea = All;

                    RunObject = Page "HRM-Employee Appraisal List";
                }
                action(AppraisalsView)
                {
                    Caption = 'Appraisals Targets View';
                    ApplicationArea = All;

                    RunObject = Page "Periodic Appraisal TargetsL";
                }
                action(EscalatedView)
                {
                    Caption = 'Employee targets view';
                    ApplicationArea = All;

                    RunObject = Page "Employee Perfomance Appraisals";
                }
            }

        }
    }
}
