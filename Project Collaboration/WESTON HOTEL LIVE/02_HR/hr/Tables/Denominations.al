table 50059 "Denominations"
{
    DrillDownPageID = "Denominations List";
    LookupPageID = "Denominations List";

    fields
    {
        field(1; Denomination; Code[50])
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
        key(Key1; Denomination)
        {
        }
    }

    fieldgroups
    {
    }
}

