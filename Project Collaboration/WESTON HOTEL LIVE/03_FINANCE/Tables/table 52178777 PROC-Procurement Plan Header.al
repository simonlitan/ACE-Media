table 52178777 "PROC-Procurement Plan Header"
{
    DrillDownPageID = "PROC-Procurement Plan list";
    LookupPageID = "PROC-Procurement Plan list";

    fields
    {
        field(1; "Budget Name"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(2; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(3; "Projects"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(4; "Procurement Plan Period"; Code[20])
        {
            TableRelation = "PROC-Procurement Plan Period".Code;
        }
        field(5; "Campus Code"; Code[20])
        {
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
    }

    keys
    {
        key(Key1; "Budget Name", "Department Code", "Campus Code", "Procurement Plan Period")
        {
            Clustered = true;
        }
        key(Key2; "Budget Name", "Department Code", Projects, "Procurement Plan Period")
        {
            // Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Dim: Record "Dimension Value";
        DptName: Text[50];
}

