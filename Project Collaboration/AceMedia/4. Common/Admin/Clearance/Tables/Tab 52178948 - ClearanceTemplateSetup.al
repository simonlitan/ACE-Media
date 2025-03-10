table 52178948 "Clearance Template Setup"
{
    Caption = 'Clearance Template Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User Name"; Code[50])
        {
            Caption = 'User Name';
            TableRelation = "User Setup"."User ID";
            trigger OnValidate()
            begin
                Usersetup.Reset();
                Usersetup.SetRange("User ID", "User Name");
                if Usersetup.Find('-') then begin
                    "Employee No" := Usersetup."Employee No.";
                    "E-Mail" := Usersetup."E-Mail";
                    Empc.Reset();
                    Empc.SetRange("No.", "Employee No");
                    if Empc.Find('-') then begin
                        "Employee Name" := Empc."First Name" + ' ' + Empc."Middle Name" + ' ' + Empc."Last Name";
                        "Global Dimension 1 Code" := Empc."Global Dimension 1 Code";
                        "Global Dimension 2 Code" := Empc."Global Dimension 2 Code";
                        "Shortcut Dimension 3 Code" := Empc."Shortcut Dimension 3 Code";
                        Designation := Empc."Job Title";
                    end;
                end;
                Active := true;
            end;
        }
        field(2; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
        }
        field(3; "Employee Name"; Text[200])
        {
            Caption = 'Employee Name';
        }
        field(4; "E-Mail"; Text[150])
        {
            Caption = 'E-Mail';
        }
        field(5; "Global Dimension 1 Code"; Code[50])
        {
            Caption = 'Global Dimension 1 Code';
            captionclass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                         Blocked = CONST(false));
        }
        field(6; "Global Dimension 2 Code"; Code[50])
        {
            Caption = 'Global Dimension 2 Code';
            captionclass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                         Blocked = CONST(false));
        }
        field(7; "Shortcut Dimension 3 Code"; Code[50])
        {
            Caption = 'Shortcut Dimension 3 Code';
            captionclass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));
        }
        field(8; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(9; Designation; Text[250])
        {

        }
    }
    keys
    {
        key(PK; "User Name")
        {
            Clustered = true;
        }
    }
    var
        Empc: Record "HRM-Employee C";
        Usersetup: Record "User Setup";
}
