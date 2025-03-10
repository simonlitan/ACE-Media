table 52179253 "HRM-Leave Planner Header"
{
    Caption = 'HRM-Leave Planner Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Period; Code[50])
        {
            Caption = 'Period';
            TableRelation = "HRM-Leave Periods".Year where(Closed = const(false));
            trigger OnValidate()
            begin
                Leaveperiods.Reset();
                Leaveperiods.SetRange(Year, Period);
                if Leaveperiods.Find('-') then begin
                    "Period Start Date" := Leaveperiods."Start Date";
                    "Period End Date" := Leaveperiods."End Date";
                end;
            end;

        }
        field(2; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            trigger OnValidate()
            begin
                Empc.Reset();
                Empc.SetRange("No.", "Employee No");
                if Empc.Find('-') then begin
                    "Employee Name" := Empc."First Name" + ' ' + empc."Middle Name" + ' ' + Empc."Last Name";
                    "Global Dimension 1 Code" := empc."Global Dimension 1 Code";
                    "Shortcut Dimension 3 Code" := empc."Shortcut Dimension 3 Code";

                end
            end;
        }
        field(3; "Employee Name"; Text[150])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(4; "Period Start Date"; Date)
        {
            Editable = false;
            Caption = 'Period Start Date';
        }
        field(5; "Period End Date"; Date)
        {
            Editable = false;
            Caption = 'Period End Date';
        }

        field(6; "Created By"; Code[50])
        {
            Editable = false;
            Caption = 'Created By';
        }
        field(7; "Created On"; date)
        {
            Editable = false;

        }
        field(8; "Global Dimension 1 Code"; Code[50])
        {
            Caption = 'Global Dimension 1 Code';
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(9; "Shortcut Dimension 3 Code"; Code[50])
        {

            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
        }
    }
    keys
    {
        key(PK; Period, "Employee No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created On" := Today;
        usersetup.get("Created By");
        if usersetup.Find('-') then begin
            "Employee No" := usersetup."Employee No.";
            Empc.Reset();
            Empc.SetRange("No.", "Employee No");
            if Empc.Find('-') then begin
                "Employee Name" := Empc."First Name" + ' ' + empc."Middle Name" + ' ' + Empc."Last Name";
                "Global Dimension 1 Code" := Empc."Global Dimension 1 Code";
                "Shortcut Dimension 3 Code" := Empc."Shortcut Dimension 3 Code";
            end
        end;
    end;

    var
        Leaveperiods: record "HRM-Leave Periods";
        Empc: Record "HRM-Employee C";
        usersetup: record "User Setup";
}
