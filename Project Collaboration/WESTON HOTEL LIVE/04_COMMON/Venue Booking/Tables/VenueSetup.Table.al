table 52178971 "Venue Setup"
{
    DrillDownPageID = "Venue Setup List";
    LookupPageID = "Venue Setup List";

    fields
    {
        field(1; "Venue Code"; Code[20])
        {
            TableRelation = "Fixed Asset"."No." WHERE("FA Subclass Code" = FILTER('BUILDING' | 'BUILDINGS' | 'BLOCKS' | 'BUILD'));
            trigger OnValidate()
            var
                FA: Record "Fixed Asset";
            begin
                if FA.Get("Venue Code") then begin
                    "Venue Description" := FA.Description;
                end;
            end;
        }
        field(2; "Venue Description"; Code[250])
        {
            CalcFormula = Lookup("Fixed Asset".Description WHERE("No." = FIELD("Venue Code")));
            FieldClass = FlowField;
        }
        field(3; Capacity; Integer)
        {
        }
        field(4; Status; Option)
        {
            OptionCaption = 'Vaccant,Occupied,Out of Order,Reserved';
            OptionMembers = Vaccant,Occupied,"Out of Order",Reserved;
        }
    }

    keys
    {
        key(Key1; "Venue Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

