table 52178908 "ISO-AuditReportTable"
{
    Caption = 'ISO-AuditReportTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contact No"; Code[30])
        {

        }
        field(2; "Name"; Text[250])
        {
        }
        field(3; "Responsibility"; Text[250])
        {

        }
    }
    keys
    {
        key(PK; "Contact No", Name, Responsibility)
        {
            Clustered = true;
        }
    }
}
