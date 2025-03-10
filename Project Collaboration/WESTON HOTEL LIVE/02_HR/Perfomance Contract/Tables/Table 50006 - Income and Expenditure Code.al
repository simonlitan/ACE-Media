table 50006 "Income and Expenditure Code"
{
    DrillDownPageID = "Income and Expenditure Code";
    LookupPageID = "Income and Expenditure Code";

    fields
    {
        field(1; "Income & Expenditure Code"; Code[100])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Quarter Starting"; Date)
        {
        }
        field(4; "Quarter Ending"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Income & Expenditure Code")
        {
        }
    }

    fieldgroups
    {
    }
}

