table 52179113 "HRM-Exit Interview Checklist"
{

    fields
    {
        field(1; "Exit Interview No"; Code[10])
        {
            TableRelation = "HRM-Employee Exit Interviews"."Exit Clearance No";
        }
        field(2; "Clearance Date"; Date)
        {
            Editable = false;
        }
        field(3; "CheckList Item"; Text[80])
        {
            TableRelation = "HRM-Lookup Values".Code WHERE(Type = CONST("Checklist Item"));
        }
        field(4; Cleared; Boolean)
        {

            trigger OnValidate()
            begin
                "Cleared By" := UserId;


                if Cleared then
                    "Clearance Date" := Today
                else
                    "Clearance Date" := 0D;
            end;
        }
        field(5; "Cleared By"; Code[20])
        {
        }
        field(6; "Line No"; Integer)
        {
            AutoIncrement = false;
        }
        field(7; "Employee No"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No.";
        }
    }

    keys
    {
        key(Key1; "Exit Interview No", "Line No")
        {
        }
    }

    fieldgroups
    {
    }
}

