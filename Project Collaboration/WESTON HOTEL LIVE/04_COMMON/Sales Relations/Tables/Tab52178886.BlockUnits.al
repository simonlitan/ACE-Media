table 52178886 "Block Units"
{
    DrillDownPageId = "Block Units";
    LookupPageId = "Block Units";
    fields
    {
        field(1; "Unit Code"; Code[30])
        {

        }
        field(2; "Description"; Text[100])
        {

        }
        field(3; "Block Code"; Code[30])
        {

        }
        field(4; "Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(5; "Usage Category"; enum "Unit Usage")
        {

        }
        field(6; "Unit Type"; enum "Unit Type")
        {

        }
        field(7; "Rate Per Pax"; Decimal)
        {

        }
        field(8; "Maximum Pax"; Integer)
        {

        }
        field(10; "Blocked"; Boolean)
        {

        }


    }

    keys
    {
        key(pk; "Unit Code", "Block Code", "Dimension 1 Code")
        {

        }
    }
    fieldgroups
    {
        fieldgroup(drillDown; "Block Code", Description, "Dimension 1 Code", "Rate Per Pax", "Maximum Pax")
        {

        }
    }
}