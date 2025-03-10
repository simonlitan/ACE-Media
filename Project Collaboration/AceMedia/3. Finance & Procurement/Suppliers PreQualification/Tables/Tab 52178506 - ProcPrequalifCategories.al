table 52178527 "Proc-Prequalif. Categories"
{
    DrillDownPageID = "Proc-Prequalif. Categories";
    LookupPageID = "Proc-Prequalif. Categories";

    fields
    {
        field(1; "Category Code"; Code[100])
        {
            TableRelation = "Proc-Goods Clasiffication";
            trigger OnValidate()
            var
                prclass: Record "Proc-Goods Clasiffication";
            begin
                prclass.Reset();
                prclass.SetRange("Code", "Category Code");
                if prclass.Find('-') then
                    Description := prclass.Description;
            end;
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Preq Year"; code[200])
        {

        }
        field(4; "Preq. Suppliers"; Integer)
        {
            CalcFormula = Count("Proc-Preq. Suppliers/Category" WHERE("Preq. Year" = FIELD("Preq Year"), "Preq. Category" = field("Category Code")));
            FieldClass = FlowField;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Category Code", "Preq Year")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

