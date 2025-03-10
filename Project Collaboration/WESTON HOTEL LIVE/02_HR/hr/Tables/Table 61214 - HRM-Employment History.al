table 61214 "HRM-Employment History"
{

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            NotBlank = false;
            TableRelation = "HRM-Employee C"."No.";
        }
        field(2; From; Date)
        {
            NotBlank = false;
        }
        field(3; "To Date"; Date)
        {
            NotBlank = false;
        }
        field(4; "Company Name"; Text[150])
        {
            NotBlank = false;
        }
        field(5; "Postal Address"; Text[40])
        {
        }
        field(6; "Address 2"; Text[40])
        {
        }
        field(7; "Job Title"; Text[150])
        {
        }
        field(8; "Key Experience"; Text[150])
        {
        }
        field(9; "Salary On Leaving"; Decimal)
        {
        }
        field(10; "Reason For Leaving"; Text[150])
        {
        }
        field(16; Comment; Text[200])
        {
            Editable = true;
            FieldClass = Normal;
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Company Name")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record "HRM-Employee C";
        OK: Boolean;
}

