page 85516 "Perfomance Evaluation"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "Perfomance Evaluation";

    layout
    {
        area(content)
        {
            group("Perfomance Evaluation")
            {
                // field(objCode;Rec.objCode)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Objective code';
                //     Editable = true;
                // }
                // field(Objective;Rec.Objective)
                // {
                //     ApplicationArea = All;
                //     Editable = true;
                // }

                field(Punctuality; Rec.Punctuality)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Personal Presentation, Attendance & Punctuality: Impression created by  appearance, disposition and attittude.Regular and punctual attendance in accordance with  days and hours of operation';
                }
                field(Productivity; Rec.Productivity)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Productivity: Produces high levels of outputs in a timely manner under normal and pressure conditions';
                }
                field(Quality; Rec.Quality)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Quality of Work: Produces highest quality, error free work that is in keeping with the style of the Company';
                }
                field(Knowledge; Rec.Knowledge)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Knowledge of Job: Shows familiarity with the professional and technical requirements of the position and its relevance and contribution to the Company’s mission and objectives';
                }
                field(Development; Rec.Development)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Personal Development: Undertakes initiatives and or participates in programmes to improve personal capacity to carry out job functions and responsibilities.  Maintains good on-the-job deportment';
                }
                field(Iniciative; Rec.Iniciative)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Initiative:Identifies and offers solutions to operational problems, deficiencies and constraints; demonstrates astuteness in judging appropriateness of acting promptly and independently, or after consultation with superior(s)';
                }
                field(Judgement; Rec.Judgement)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Judgement: Demonstrates ability to rigorously assess situations, evaluate response options and consequences and to select /recommend appropriate intervention or action.';
                }
                field(Reliability; Rec.Reliability)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Reliability & Dependability: Consistently carries out responsibilities to effectively and efficiently achieve desired outcomes or outputs within agreed schedules and deadlines.  Can be relied upon to act or ensure that actions are carried out in the best interest of the Company.';
                }
                field(Communication; Rec.Communication)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Communication: Consistently exhibits good oral, writing and listening skills.  Interacts in a professional manner with peers, subordinates and the general public';
                }
                field(Teamwork; Rec.Teamwork)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Teamwork: Willing to volunteer, share responsibilities and contribute to the completion  of tasks, especially under situations of pressure';
                }
                field(Ethics; Rec.Ethics)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Tooltip = 'Comments and examples';
                    Caption = 'Work Ethics and Integrity: The employee’s proper handling of confidential information, adherence to policies and commitments to productivity, coworkers and work schedules';
                }
            }
        }
    }
    actions
    {
    }
    // trigger OnAfterGetRecord()
    // begin
    //     Rec.SETFILTER("Appraisal year Code", HRMAppraisalYears.Code);
    // end;
    // trigger OnOpenPage()
    // begin
    //     HRMAppraisalYears.RESET;
    //     HRMAppraisalYears.SETRANGE(Closed, FALSE);
    //     IF HRMAppraisalYears.FIND('-') THEN
    //         Rec.SETFILTER("Appraisal year Code", HRMAppraisalYears.Code);
    // end;
    var UserSetup: Record 91;
    HRMAppraisalYears: Record "HRM-Appraisal Years";
    HRMAppraisalPeriods: Record "HRM-Appraisal Periods";
//editability: Boolean;
}
