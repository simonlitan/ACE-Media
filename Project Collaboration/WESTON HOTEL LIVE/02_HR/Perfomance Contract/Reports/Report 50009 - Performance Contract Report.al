report 50009 "Performance Contract Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Perfomance Contract/Reports/SSR/Performance Contract Report.rdl';

    dataset
    {
        dataitem(DataItem1; "Performance Criteria")
        {
            column(PerformanceCriteriaCode_PerformanceCriteria; "Performance Criteria Code")
            {
            }
            column(PerformanceCriterDescription_PerformanceCriteria; "Performance Criter Description")
            {
            }
            column(Directorates_PerformanceCriteria; Directorates)
            {
            }
            column(Departments_PerformanceCriteria; Departments)
            {
            }
            dataitem(DataItem2; "Performance Criteria Line")
            {
                DataItemLink = "Activity Code" = FIELD("Performance Criteria Code");
                column(ActivityCode_PerformanceCriteriaLine; "Activity Code")
                {
                }
                column(TargetsDescription_PerformanceCriteriaLine; "Targets Description")
                {
                }
                column(WorkplanCode_PerformanceCriteriaLine; "Workplan Code")
                {
                }
                column(GeneralNote_PerformanceCriteriaLine; "General Note")
                {
                }
                column(PerformanceCriteriaCategory_PerformanceCriteriaLine; "Performance Criteria Category")
                {
                }
                column(PerformanceCriteriaDescripti_PerformanceCriteriaLine; "Performance Criteria Descripti")
                {
                }
                column(PerformanceStepDescription_PerformanceCriteriaLine; "Performance Step Description")
                {
                }
                column(Comment_PerformanceCriteriaLine; Comment)
                {
                }
                column(Directorates_PerformanceCriteriaLine; Directorates)
                {
                }
                column(Departments_PerformanceCriteriaLine; Departments)
                {
                }
                column(Quantity_PerformanceCriteriaLine; Quantity)
                {
                }
                column(units_PerformanceCriteriaLine; units)
                {
                }
                column(PerformanceCriteriaStepCode_PerformanceCriteriaLine; "Performance Criteria Step Code")
                {
                }
                column(Weights_PerformanceCriteriaLine; Weights)
                {
                }
                column(Status_PerformanceCriteriaLine; "Status Last Contract Period")
                {
                }
                column(Target_PerformanceCriteriaLine; "Target (Contract Period)")
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

