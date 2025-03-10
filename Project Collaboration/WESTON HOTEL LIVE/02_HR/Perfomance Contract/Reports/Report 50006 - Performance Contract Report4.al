report 50006 "Performance Contract Report4"
{
    DefaultLayout = RDLC;
    RDLCLayout = './perfomance contract/Reports/SSR/Performance Contract Report4.rdl';

    dataset
    {
        dataitem(DataItem1; "Performance Criteria Cascade 4")
        {
            column(PerformanceCriterDescription_PerformanceCriteriaCascade4; "Performance Criter Description")
            {
            }
            column(PerformanceCriteriaCode_PerformanceCriteriaCascade4; "Performance Criteria Code")
            {
            }
            column(Blocked_PerformanceCriteriaCascade4; Blocked)
            {
            }
            column(Directorates_PerformanceCriteriaCascade4; Directorates)
            {
            }
            column(Departments_PerformanceCriteriaCascade4; Departments)
            {
            }
            column(NoSeries_PerformanceCriteriaCascade4; "No. Series")
            {
            }
            column(ContractPeriod_PerformanceCriteriaCascade4; "Contract Period")
            {
            }
            dataitem(DataItem2; "Perfmnc Criteria Line Cascade4")
            {
                DataItemLink = "Activity Code" = FIELD("Performance Criteria Code");
                column(PerformanceCriteriaStepCode_PerfmncCriteriaLineCascade4; "Performance Criteria Step Code")
                {
                }
                column(TargetForContractPeriod_PerfmncCriteriaLineCascade4; "Target For Contract Period")
                {
                }
                column(StatusLastContractPeriod_PerfmncCriteriaLineCascade4; "Status Last Contract Period")
                {
                }
                column(Weights_PerfmncCriteriaLineCascade4; Weights)
                {
                }
                column(units_PerfmncCriteriaLineCascade4; units)
                {
                }
                column(PerformanceStepDescription_PerfmncCriteriaLineCascade4; "Performance Step Description")
                {
                }
                column(TargetContractPeriod_PerfmncCriteriaLineCascade4; "Target (Contract Period)")
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

