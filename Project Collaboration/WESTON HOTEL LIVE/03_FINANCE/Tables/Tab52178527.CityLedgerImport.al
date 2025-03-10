table 52178527 "City Ledger Import"
{

    fields
    {
        field(9; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(10; "Customer No."; Code[20])
        {
        }
        field(11; Date; Date)
        {
        }
        field(12; Amount; Decimal)
        {
        }
        field(13; "Invoice No."; Code[30])
        {
        }
        field(14; "Posting description"; Text[50])
        {
        }
        field(15; "Field 1"; Text[30])
        {
        }
        field(16; "Field 2"; Text[30])
        {
        }
        field(17; "Field 3"; Text[30])
        {
        }
        field(18; "Field 4"; Text[30])
        {
        }
        field(19; "Field 5"; Text[30])
        {
        }
        field(20; "Field 6"; Text[30])
        {
        }
        field(21; "Field 7"; Text[30])
        {
        }
        field(22; "Field 8"; Text[30])
        {
        }
        field(23; "Field 9"; Text[30])
        {
        }
        field(24; "Field 10"; Text[30])
        {
        }
        field(25; "Field 11"; Text[30])
        {
        }
        field(26; "Field 12"; Text[30])
        {
        }
        field(27; "Field 13"; Text[30])
        {
        }
        field(28; "Field 14"; Text[30])
        {
        }
        field(29; "Field 15"; Text[30])
        {
        }
        field(30; "Field 16"; Text[30])
        {
        }
        field(31; "Field 17"; Text[30])
        {
        }
        field(32; "Field 18"; Text[30])
        {
        }
        field(33; "Field 19"; Text[30])
        {
        }
        field(34; "Currency Code"; Code[20])
        {
        }
        field(35; "Field 20"; Text[30])
        {
        }
        field(36; "Field 22"; Text[30])
        {
        }
        field(37; "Field 23"; Text[30])
        {
        }
        field(38; "Field 24"; Text[30])
        {
        }
        field(39; "Field 25"; Text[30])
        {
        }
        field(40; "Field 26"; Text[30])
        {
        }
        field(41; "Field 27"; Text[30])
        {
        }
        field(42; "Field 28"; Text[30])
        {
        }
        field(43; "Field 29"; Text[30])
        {
        }
        field(44; "Field 30"; Text[30])
        {
        }
        field(45; "Field 31"; Text[30])
        {
        }
        field(46; "Field 32"; Text[30])
        {
        }
        field(47; "Amount USD"; Decimal)
        {
        }
        field(48; "Names 1"; Text[100])
        {
        }
        field(49; "Names 2"; Text[100])
        {
        }
        field(50; Posted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

