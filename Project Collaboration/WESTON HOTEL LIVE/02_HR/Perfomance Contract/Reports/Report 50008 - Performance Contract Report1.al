report 50008 "Performance Contract Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Perfomance Contract/Reports/SSR/Performance Contract Report1.rdl';

    dataset
    {
        dataitem(DataItem1; "Performance Criteria Cascade 1")
        {
            column(PerformanceCriterDescription_PerformanceCriteriaCascade1; "Performance Criter Description")
            {
            }
            column(PerformanceCriteriaCode_PerformanceCriteriaCascade1; "Performance Criteria Code")
            {
            }
            column(Blocked_PerformanceCriteriaCascade1; Blocked)
            {
            }
            column(Directorates_PerformanceCriteriaCascade1; Directorates)
            {
            }
            column(Departments_PerformanceCriteriaCascade1; Departments)
            {
            }
            column(NoSeries_PerformanceCriteriaCascade1; "No. Series")
            {
            }
            column(ContractPeriod_PerformanceCriteriaCascade1; "Contract Period")
            {
            }
            dataitem(DataItem2; "Performan Criteria Line Casc 1")
            {
                DataItemLink = "Activity Code" = FIELD("Performance Criteria Code");
                column(PerformanceCriteriaStepCode_PerfmncCriteriaLineCascade1; "Performance Criteria Step Code")
                {
                }
                column(TargetForContractPeriod_PerfmncCriteriaLineCascade1; "Target For Contract Period")
                {
                }
                column(StatusLastContractPeriod_PerfmncCriteriaLineCascade1; "Status Last Contract Period")
                {
                }
                column(Weights_PerfmncCriteriaLineCascade1; Weights)
                {
                }
                column(units_PerfmncCriteriaLineCascade1; units)
                {
                }
                column(PerformanceStepDescription_PerfmncCriteriaLineCascade1; "Performance Step Description")
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

