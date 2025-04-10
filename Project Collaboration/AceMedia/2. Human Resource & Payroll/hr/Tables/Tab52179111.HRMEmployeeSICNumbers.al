table 52179111 "HRM-Employee SIC Numbers"
{

    fields
    {
        field(1; "Employee No."; Code[20])
        {

            trigger OnValidate()
            begin
                OK := Employee.Get("Employee No.");
                if OK then begin
                    //"Employee First Name":= Employee."Known As";
                    "Employee Last Name" := Employee."Last Name";
                end;
            end;
        }
        field(2; "Level 3 SIC Code"; Code[10])
        {
        }
        field(3; "Level 4 SIC Code"; Code[10])
        {
        }
        field(4; SubSection; Code[10])
        {
        }
        field(5; "Section Description"; Text[250])
        {
        }
        field(6; "Sub Section Description"; Text[250])
        {
        }
        field(7; "Employee First Name"; Text[250])
        {
        }
        field(8; "Employee Last Name"; Text[250])
        {
        }
        field(9; Section; Code[10])
        {
        }
        field(10; "Level 1 SIC Code"; Code[10])
        {
        }
        field(11; "Level 2 SIC Code"; Code[10])
        {
        }
        field(12; "Level 1 Description"; Text[250])
        {
        }
        field(13; "Level 2 Description"; Text[250])
        {
        }
        field(14; "Level 3 Description"; Text[250])
        {
        }
        field(15; "Level4 Description"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Level 3 SIC Code", "Level 4 SIC Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        OK := Employee.Get("Employee No.");
        if OK then begin
            //"Employee First Name":= Employee."Known As";
            "Employee Last Name" := Employee."Last Name";
        end;
    end;

    var
        Employee: Record "HRM-Employee C";
        OK: Boolean;
}

