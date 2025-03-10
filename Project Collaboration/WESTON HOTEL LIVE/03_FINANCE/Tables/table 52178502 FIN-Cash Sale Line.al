table 52178502 "FIN-Cash Sale Line"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Code"; Code[20])
        {
            TableRelation = IF (Type = CONST("G/L Account")) "G/L Account"."No."
            ELSE
            IF (Type = CONST(Item)) Item."No.";
        }
        field(3; Description; Text[30])
        {
        }
        field(4; Quantity; Decimal)
        {
        }
        field(5; Units; Code[20])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(6; "Unit Price"; Decimal)
        {
        }
        field(7; "Total Amount"; Decimal)
        {
        }
        field(8; Location; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(9; Type; Option)
        {
            OptionMembers = "G/L Account",Item;
        }
        field(10; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(11; Date; Date)
        {
            CalcFormula = Lookup("FIN-Cash Sale Header".Date WHERE("Doc No" = FIELD(No)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Line No", No)
        {
            Clustered = true;
            SumIndexFields = "Total Amount";
        }
        key(Key2; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

