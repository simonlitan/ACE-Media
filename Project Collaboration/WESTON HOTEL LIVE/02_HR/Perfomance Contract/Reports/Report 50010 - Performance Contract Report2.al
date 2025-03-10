report 50010 "Performance Contract Report2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Perfomance Contract/Reports/SSR/Performance Contract Report2.rdl';

    dataset
    {
        dataitem(DataItem1; "Performance Criteria Cascade 2")
        {
            column(PerformanceCriterDescription_PerformanceCriteriaCascade2; "Performance Criter Description")
            {
            }
            column(PerformanceCriteriaCode_PerformanceCriteriaCascade2; "Performance Criteria Code")
            {
            }
            column(Blocked_PerformanceCriteriaCascade2; Blocked)
            {
            }
            column(Directorates_PerformanceCriteriaCascade2; Directorates)
            {
            }
            column(Departments_PerformanceCriteriaCascade2; Departments)
            {
            }
            column(NoSeries_PerformanceCriteriaCascade2; "No. Series")
            {
            }
            column(ContractPeriod_PerformanceCriteriaCascade2; "Contract Period")
            {
            }
            dataitem(DataItem2; "Perfmnc Criteria Line Cascade2")
            {
                DataItemLink = "Activity Code" = FIELD("Performance Criteria Code");
                column(PerformanceCriteriaStepCode_PerfmncCriteriaLineCascade2; "Performance Criteria Step Code")
                {
                }
                column(TargetForContractPeriod_PerfmncCriteriaLineCascade2; "Target For Contract Period")
                {
                }
                column(StatusLastContractPeriod_PerfmncCriteriaLineCascade2; "Status Last Contract Period")
                {
                }
                column(Weights_PerfmncCriteriaLineCascade2; Weights)
                {
                }
                column(units_PerfmncCriteriaLineCascade2; units)
                {
                }
                column(PerformanceStepDescription_PerfmncCriteriaLineCascade2; "Performance Step Description")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

