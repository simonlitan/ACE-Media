report 50235 "WorkPlan"
{
    ApplicationArea = All;
    Caption = 'WorkPlan';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = './Appraisal/Layouts/workplan.docx';
    dataset
    {
        dataitem(SelfAppraisal; "Self Appraisal")
        {
            column("To"; "To")
            {

            }
            column(From; From)
            {

            }
            dataitem("Strategic Objective"; "Strategic Objective")
            {
                column(Activities_StrategicObjective; Activities)
                {
                }
                column(Strategic_Objective; "Strategic Objective")
                {

                }
                column(KPIsegTimeframes_StrategicObjective; "KPI(s) e.g Timeframes")
                {
                }
                column(KRA_StrategicObjective; KRA)
                {
                }
                column(MeansofVerification_StrategicObjective; "Means of Verification")
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
                column(Strategy; "Strategic Obj Description")
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
    var
        fromDate: Date;
        EndDate: Date;
}
