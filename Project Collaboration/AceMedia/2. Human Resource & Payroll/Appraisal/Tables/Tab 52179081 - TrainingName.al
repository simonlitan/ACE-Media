table 52179081 "Training Name"
{
    Caption = 'Training Name';
    DataClassification = ToBeClassified;
    LookupPageId = "Training Name";
    DrillDownPageId = "Training Name";
    fields
    {

        field(2; Code; Code[30])
        {

        }
        field(3; "Training Name"; Text[250])
        {

            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; Code, "Training Name")
        {
            Clustered = true;
        }
    }
}

