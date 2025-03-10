report 50011 "Performance Contract Report3"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Perfomance Contract/Reports/SSR/Performance Contract Report3.rdl';

    dataset
    {
        dataitem(DataItem1; "Performance Criteria Cascade 3")
        {
            column(PerformanceCriterDescription_PerformanceCriteriaCascade3; "Performance Criter Description")
            {
            }
            column(PerformanceCriteriaCode_PerformanceCriteriaCascade3; "Performance Criteria Code")
            {
            }
            column(Blocked_PerformanceCriteriaCascade3; Blocked)
            {
            }
            column(Directorates_PerformanceCriteriaCascade3; Directorates)
            {
            }
            column(Departments_PerformanceCriteriaCascade3; Departments)
            {
            }
            column(NoSeries_PerformanceCriteriaCascade3; "No. Series")
            {
            }
            column(ContractPeriod_PerformanceCriteriaCascade3; "Contract Period")
            {
            }
            dataitem(DataItem2; "Perfmnc Criteria Line Cascade3")
            {
                DataItemLink = "Activity Code" = FIELD("Performance Criteria Code");
                column(PerformanceCriteriaStepCode_PerfmncCriteriaLineCascade2; "Performance Criteria Step Code")
                {
                }
                column(TargetForContractPeriod_PerfmncCriteriaLineCascade3; "Target For Contract Period")
                {
                }
                column(StatusLastContractPeriod_PerfmncCriteriaLineCascade3; "Status Last Contract Period")
                {
                }
                column(Weights_PerfmncCriteriaLineCascade3; Weights)
                {
                }
                column(units_PerfmncCriteriaLineCascade3; units)
                {
                }
                column(PerformanceStepDescription_PerfmncCriteriaLineCascade3; "Performance Step Description")
                {
                }
                column(TargetContractPeriod_PerfmncCriteriaLineCascade3; "Target (Contract Period)")
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

