table 52178957 "Mail Comment"
{
    Caption = 'Mail Comment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "PF No."; Code[30])
        {
            TableRelation = "HRM-Employee C";
            Caption = 'Staff No.';
            trigger OnValidate()
            var
                Employee: Record "HRM-Employee C";
            begin
                Employee.Reset();
                if Employee.Get("PF No.") then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    EMail := Employee."Company E-Mail";
                end
            end;
        }
        field(2; "Employee Name"; Text[100])
        {
            Editable = False;
        }
        field(4; Email; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Comment; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Folio No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Posted; Boolean)
        {
        }
    }
    keys
    {
        key(PK; "PF No.", "Folio No.")
        {
            Clustered = true;
        }
    }
}
