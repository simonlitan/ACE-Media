table 52178959 "File Indexes"
{
    Caption = 'File Indexes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "File Index code"; code[30])
        {
        }
        field(2; "File Name"; Text[100])
        {
        }
        field(3; "Dimension type value"; Option)
        {
            OptionCaption = 'Standard,Heading,Posting,Total,Begin-Total,End-Total';
            OptionMembers = Standard,Heading,Posting,Total,"Begin-Total","End-Tota";
        }
    }
    keys
    {
        key(PK; "File Index code", "File Name", "Dimension type value")
        {
            Clustered = true;
        }
    }
}
