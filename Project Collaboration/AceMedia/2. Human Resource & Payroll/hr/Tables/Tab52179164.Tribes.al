table 52179164 "Tribes"
{
    DrillDownPageID = "Tribes List";
    LookupPageID = "Tribes List";

    fields
    {
        field(1; "Tribe Code"; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Total Employees"; Integer)
        {
            CalcFormula = Count("HRM-Employee C" WHERE(Tribe = FIELD("Tribe Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Tribe Code")
        {
        }
    }

    fieldgroups
    {
    }
}

