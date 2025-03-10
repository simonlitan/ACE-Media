table 50222 "Strategic Objective Setup"
{
    Caption = 'Strategic Objective Setup';
    DataClassification = ToBeClassified;
    LookupPageId = "Strategic Obj Setup List";
    DrillDownPageId = "Strategic Obj Setup List";
    fields
    {
        field(1; "Strategic Pillar"; Code[20])
        {
            Caption = 'Strategic Pillar';
            DataClassification = ToBeClassified;
            TableRelation = KRA.code;
        }

        field(2; "Strategic Objective"; Text[1000])
        {
            Caption = 'Strategic Objective';
            DataClassification = ToBeClassified;
        }
        field(3; Strategy; Text[1000])
        {
            Caption = 'Strategy';
            DataClassification = ToBeClassified;
        }
        field(4; "Code"; Integer)
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK; "code")
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "Strategic Pillar", "Strategic Objective", Strategy)
        {

        }
    }
}
