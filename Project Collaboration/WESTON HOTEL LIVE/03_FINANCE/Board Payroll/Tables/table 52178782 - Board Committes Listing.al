table 52178782 "Board Committes Listing"
{
    DrillDownPageId = "Board Committes Listing";
    LookupPageId = "Board Committes Listing";
    fields
    {
        field(1; "No."; Code[30])
        {

        }
        field(2; "Commitee Code"; Code[50])
        {

        }
        field(3; "Committee Name"; Text[100])
        {

        }

    }
    keys
    {
        key(key1; "No.", "Commitee Code", "Committee Name")
        {

        }
    }
}