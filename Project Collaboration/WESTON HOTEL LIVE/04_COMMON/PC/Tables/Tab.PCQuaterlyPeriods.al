table 52178985 "PC Quaterly Periods"
{
    DrillDownPageId = "PC Quaterly Periods";
    LookupPageId = "PC Quaterly Periods";
    fields
    {
        field(1; "Quater"; code[20])
        {

        }
        field(2; "PC Period"; code[20])
        {
            TableRelation = "PC Periods"."PC Period";
        }
        field(3; "Description"; Text[100])
        {

        }
        field(4; "Start Date"; date)
        {

        }
        field(5; "End Date"; date)
        {

        }
        field(7; "Submission Start Date"; date)
        {

        }
        field(8; "Submission End Date"; date)
        {

        }
    }
    keys
    {
        key(key1; "PC Period", Quater)
        {

        }
    }

}