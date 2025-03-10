report 52179168 "Appraisal Nepad Report"
{
    //1-4
    ApplicationArea = All;
    Caption = 'Appraisal Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './hr/Reports/SSR/Appraisal201.rdl';
    //WordLayout = './Appraisal/Layouts/Appraisal.docx';
    dataset
    {
        dataitem(SelfAppraisal; "Employee Self-Appraisal")
        {
            column(Department; Department)
            {
            }
            column(YoS; "Years of service") { }
            column(Divisonsection_SelfAppraisal; "Divison/section")
            {
            }
            column(EmpNo; "Employee No")
            {
            }
            column(Grade; Grade)
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(LastReviewDate_SelfAppraisal; "Last Review Date")
            {
            }
            column(Name_SelfAppraisal; Name)
            {
            }
            column(No_SelfAppraisal; "No.")
            {
            }
            dataitem("Strategic Objective"; "Strategic Objective")
            {
                column(ActivitieT; Activities)
                {
                }
                column(AgrFinalScore; "Agreed final Score")
                {
                }
                column(MOV; "Means of Verification")
                {
                }
                column(Reasonsforvariance_StrategicObjective; "Reasons for variance")
                {
                }
                column(SelfRating; "Self Rating")
                {
                }
                column(StrategicObjective_StrategicObjective; "Strategic Objective")
                {
                }
                column(SupRating; "Supervisor  Rating")
                {
                }
                column(StraObjective; "Strategic Objective")
                {

                }
                column(ExpOutput; "Expected Output Desc")
                {

                }
                column(variance_StrategicObjective; variance)
                {
                }
                column(final_Score; "Agreed final Score")
                {

                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document No.", SelfAppraisal."No.");
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}

