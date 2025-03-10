report 52179363 "WorkPlan"
{
    ApplicationArea = All;
    Caption = 'WorkPlan';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Appraisal/Layouts/workplan.RDL';
    // WordLayout = './Appraisal/Layouts/workplan.docx';
    dataset
    {
        dataitem(SelfAppraisal; "Self Appraisal")
        {
            column(Logo; CompInfo.Picture)
            {

            }
            column("To"; "To")
            {

            }
            column(From; From)
            {

            }
            column(Employee_No; "Employee No")
            {

            }
            column(Name; Name)
            {

            }
            column(Supervisor; Supervisor)
            {

            }
            column(Period_Under_Review; "Period Under Review")
            {

            }
            column(Job_Title; "Job Title")
            {

            }
            column(Divison_section; "Divison/section")
            {

            }
            column(Years_of_service; "Years of service")
            {

            }
            column(Last_Review_Date; "Last Review Date")
            {

            }
            dataitem("Strategic Objective"; "Strategic Objective")
            {
                column(Activities_StrategicObjective; Activities)
                {
                }
                column(Activity_Desc; "Activity Desc")
                {

                }
                column(Strategic_Objective; "Strategic Objective")
                {

                }

                column(KPIsegTimeframes_StrategicObjective; "KPI(s) e.g Timeframes")
                {
                }
                column(KRA_StrategicObjective; "KRA Description")
                {
                }
                column(MeansofVerification_StrategicObjective; "Means of Verification")
                {
                }
                column(Means_of_verification_Desc; "Means of verification Desc")
                {

                }
                column(StrategicObjective_StrategicObjective; "Strategic Obj Description")
                {
                }
                column(Weight_StrategicObjective; Weight)
                {
                }
                column(ExpectedOutput_StrategicObjective; "Expected Output")
                {
                }
                column(Expected_Output_Desc; "Expected Output Desc")
                {

                }
                column(Strategy; "Strategic Obj Description")
                {

                }
                column(Strategies_Desc; "Strategies Desc")
                {

                }
                column(StaffActivities; "Staff Activities")
                {

                }
                column(Staffexpectedoutput; "Staff expected output")
                {

                }
                column(StaffMeansofVerification; "Staff Means of Verification")
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
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        CompInfo.Get();
        CompInfo.CalcFields(Picture)
    end;

    var
        fromDate: Date;
        EndDate: Date;
        CompInfo: Record "Company Information";
}
