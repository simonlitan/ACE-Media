tableextension 52178865 "Vendor Ext" extends Vendor
{
    fields
    {
        field(60000; Password; Text[50])
        {
            Caption = 'Password';
            DataClassification = ToBeClassified;
        }
        field(60001; "Changed Password"; Boolean)
        {
            Caption = 'Changed Password';
            DataClassification = ToBeClassified;
        }
    }
}