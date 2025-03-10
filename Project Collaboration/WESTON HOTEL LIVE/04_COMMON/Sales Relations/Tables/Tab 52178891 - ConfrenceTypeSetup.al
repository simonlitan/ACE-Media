table 52178891 "Confrence Type Setup"
{
    Caption = 'Confrence Type Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Confrence Type"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        // field(3; "Line Number"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
    }
    keys
    {
        key(PK; "Confrence Type", "Description")
        {
            Clustered = true;
        }
    }
}
