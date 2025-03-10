table 52178520 "Opera Data Storage"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Cost Center"; Code[20])
        {
        }
        field(3; "Posting Date"; Date)
        {
        }
        field(4; "Posting Description"; Code[100])
        {
        }
        field(5; "Food Sales"; Decimal)
        {
        }
        field(6; "Currency Code"; Code[10])
        {
        }
        field(7; Amount; Decimal)
        {
        }
        field(8; "Field 1 Buffer"; Decimal)
        {
        }
        field(9; "Field 2 Buffer"; Decimal)
        {
        }
        field(10; "Field 3 Buffer"; Decimal)
        {
        }
        field(11; "Field 4 Buffer"; Decimal)
        {
        }
        field(12; "Field 5 Buffer"; Decimal)
        {
        }
        field(13; "Field 6 Buffer"; Decimal)
        {
        }
        field(14; "Field 7 Buffer"; Decimal)
        {
        }
        field(15; "Field 8 Buffer"; Decimal)
        {
        }
        field(16; "Field 9 Buffer"; Decimal)
        {
        }
        field(17; "Field 10  Buffer"; Decimal)
        {
        }
        field(18; "Field 11 Buffer"; Decimal)
        {
        }
        field(19; "Field 12 Buffer"; Decimal)
        {
        }
        field(20; "Field 13 Buffer"; Decimal)
        {
        }
        field(21; "Field 14 Buffer"; Decimal)
        {
        }
        field(22; "Field 15 Buffer"; Decimal)
        {
        }
        field(23; "Field 16 Buffer"; Decimal)
        {
        }
        field(24; "Field 17 Buffer"; Decimal)
        {
        }
        field(25; "Field 18 Buffer"; Decimal)
        {
        }
        field(26; "Field 19 Buffer"; Decimal)
        {
        }
        field(27; "Field 20 Buffer"; Decimal)
        {
        }
        field(28; "Field 21  Buffer"; Decimal)
        {
        }
        field(29; "Field 22 Buffer"; Decimal)
        {
        }
        field(30; "Field 23 Buffer"; Decimal)
        {
        }
        field(31; "Field 24 Buffer"; Decimal)
        {
        }
        field(32; Posted; Boolean)
        {
        }
        field(33; "Date Posted"; Date)
        {
        }
        field(34; "G/L Account"; Code[20])
        {
        }
        field(36; "Posted By"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

