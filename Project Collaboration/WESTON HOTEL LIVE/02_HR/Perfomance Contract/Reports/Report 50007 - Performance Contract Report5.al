report 50007 "Performance Contract Report5"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Perfomance Contract/Reports/SSR/Performance Contract Report5.rdl';

    dataset
    {
        dataitem(DataItem1; "Performance Criteria Cascade 5")
        {
            column(PerformanceCriterDescription_PerformanceCriteriaCascade5; "Performance Criter Description")
            {
            }
            column(PerformanceCriteriaCode_PerformanceCriteriaCascade5; "Performance Criteria Code")
            {
            }
            column(Blocked_PerformanceCriteriaCascade5; Blocked)
            {
            }
            column(Directorates_PerformanceCriteriaCascade5; Directorates)
            {
            }
            column(Departments_PerformanceCriteriaCascade5; Departments)
            {
            }
            column(NoSeries_PerformanceCriteriaCascade5; "No. Series")
            {
            }
            column(ContractPeriod_PerformanceCriteriaCascade5; "Contract Period")
            {
            }
            dataitem(DataItem2; "Perfmnc Criteria Line Cascade5")
            {
                DataItemLink = "Activity Code" = FIELD("Performance Criteria Code");
                column(PerformanceCriteriaStepCode_PerfmncCriteriaLineCascade5; "Performance Criteria Step Code")
                {
                }
                column(TargetForContractPeriod_PerfmncCriteriaLineCascade5; "Target For Contract Period")
                {
                }
                column(StatusLastContractPeriod_PerfmncCriteriaLineCascade5; "Status Last Contract Period")
                {
                }
                column(Weights_PerfmncCriteriaLineCascade5; Weights)
                {
                }
                column(units_PerfmncCriteriaLineCascade5; units)
                {
                }
                column(PerformanceStepDescription_PerfmncCriteriaLineCascade5; "Performance Step Description")
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

