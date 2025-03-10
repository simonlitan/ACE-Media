table 50060 "ACA-Religions"
{
    DrillDownPageID = "Religions List";
    LookupPageID = "Religions List";

    fields
    {
        field(1; Religion; Code[50])
        {
            NotBlank = false;
            Editable = true;
        }
        field(2; Remarks; Text[250])
        {
            Caption = 'Description';
            Editable = true;
        }

    }

    keys
    {
        key(Key1; Religion)
        {
        }
    }

    fieldgroups
    {
    }
}

