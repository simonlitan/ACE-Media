table 52178904 "ISO-Audit Items Table"
{
    Caption = 'iSO-Audit Items Table';
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "No."; Code[10])
        {
            // AutoIncrement = true;

        }
        field(2; "System Aspect"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "PRO/WI REF"; Code[25])
        {
            DataClassification = ToBeClassified;
            //  DecimalPlaces = 3;

        }
        field(4; "Results"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "Audit Criteria"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(6; Date; Date)
        {
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "No.", "System Aspect", "PRO/WI REF", "Results")
        {
        }
    }
}
