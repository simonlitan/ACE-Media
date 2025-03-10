/// <summary>
/// Table Contract Monitoring Param (ID 52178479).
/// </summary>
table 52178862 "Contract Monitoring Param"
{
    DrillDownPageId = "Contract Monitoring Param List";
    LookupPageId = "Contract Monitoring Param List";
    fields
    {
        field(1; "Line No."; integer)
        {
            AutoIncrement = true;

        }
        field(2; Code; code[30])
        {

        }
        field(3; Description; Text[100])
        {

        }
        field(4; Remarks; Text[100])
        {

        }

    }
    keys
    {
        key(key1; "Line No.", Code)
        {
            Clustered = true;
        }
    }
}