table 52178513 "Opera Data Import"
{
    Caption = 'Opera Data Import';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(2; "Cost Center"; Code[20])
        {

        }
        field(3; date; Date)
        {

        }
        field(4; "Posting Description"; Text[500])
        {

        }
        field(5; "Food Sales"; Decimal)
        {

        }
        field(6; "Currency Code"; Code[20])
        {

        }
        field(7; Amount; Decimal)
        {

        }
        field(8; "Posting Naration"; Text[200])
        {

        }
        field(9; Posted; Boolean)
        {

        }
        field(10; "G/L Account"; Code[20])
        {

        }
        field(11; "Posted Date"; Date)
        {

        }
        field(13; "Posted by"; Code[20])
        {

        }
        field(14; "Global Dimension 1"; Code[20])
        {

        }
        field(15; "Global Dimension 2"; Code[20])
        {

        }
        field(12; "Navision Code"; Code[20])
        {

        }
        field(16; "Opera code"; Code[20])
        {

        }
    }
    keys
    {
        key(PK; "Line No", "Posting Description")
        {
            Clustered = true;
        }
    }
}
