table 50007 "Income and Expend Step Code"
{
    DrillDownPageID = "Income and Expend Step Code";
    LookupPageID = "Income and Expend Step Code";

    fields
    {
        field(1; "Income & Expenditure Code"; Code[100])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Steps; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Income & Expenditure Code", Steps)
        {
        }
    }

    fieldgroups
    {
    }
}

