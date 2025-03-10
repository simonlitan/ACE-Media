table 52178512 "Macros Cost Center"
{
    Caption = 'Macros Cost Center';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Opera Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Navision Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Opera Code")
        {
            Clustered = true;
        }
    }
}
