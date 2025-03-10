table 52178670 "FIN-Memo Refs"
{

    fields
    {
        field(1; Department; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            trigger OnValidate()
            var
                Dimval: Record "Dimension Value";
            begin
                Dimval.Reset();
                Dimval.SetRange(Code, Department);
                if Dimval.FindFirst() then
                    "Department Name" := Dimval.Name;
            end;
        }
        field(2; "Department Name"; Text[200])
        {
            Caption = 'Department Name';
            DataClassification = ToBeClassified;

        }
        field(3; "Department  Prefix"; Code[20])
        {
            Description = 'Stores the prefix of the code in the database';
        }
        field(4; "No. Series"; Code[20])
        {
            Description = 'Stores the numbering series for the code in the database';
            TableRelation = "No. Series".Code;
        }
        field(5; Year; Code[20])
        {
            Description = 'Stores the year in the database';
        }
        field(6; "Memo Prefix"; Code[20])
        {
        }

        field(7; "Modified Date"; Date)
        {
        }

    }

    keys
    {
        key(Key1; Department)
        {
        }
    }

    fieldgroups
    {
    }
}