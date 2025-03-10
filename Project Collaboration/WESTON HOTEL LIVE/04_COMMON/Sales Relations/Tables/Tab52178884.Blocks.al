table 52178884 "Blocks"
{
    DrillDownPageId = Blocks;
    LookupPageId = Blocks;
    fields
    {
        field(1; "Block Code"; Code[30])
        {

        }
        field(2; "Description"; Text[100])
        {

        }
        field(3; "Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(4; "Blocked"; Boolean)
        {

        }
    }

    keys
    {
        key(pk; "Block Code", "Dimension 1 Code")
        {

        }
    }
}