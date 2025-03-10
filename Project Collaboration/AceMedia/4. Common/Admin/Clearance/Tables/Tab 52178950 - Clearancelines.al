table 52178950 "Clearance lines"
{
    Caption = 'Clearance lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee No"; Code[50])
        {
            Editable = false;
            Caption = 'Employee No';
        }
        field(2; "Cleared By"; Code[50])
        {
            Caption = 'Cleared By';
        }
        field(3; "Clearer Name"; Text[150])
        {
            Editable = false;
            Caption = 'Clearer Name';
        }
        field(4; "Global Dimension 1 Code"; Code[50])
        {
            Editable = false;
            Caption = 'Global Dimension 1 Code';
            captionclass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                         Blocked = CONST(false));
        }
        field(5; "Global Dimension 2 Code"; Code[50])
        {
            Editable = false;
            Caption = 'Global Dimension 2 Code';
            captionclass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                         Blocked = CONST(false));
        }
        field(6; "Shortcut Dimension 3 Code"; Code[50])
        {
            Editable = false;
            Caption = 'Shortcut Dimension 3 Code';
            captionclass = '1,2,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));
        }
        field(7; Status; Option)
        {
            Editable = false;
            Caption = 'Status';
            OptionMembers = " ",Cleared,"Not Cleared";
        }
        field(8; Cleared; Boolean)
        {
            Caption = 'Cleared?';
            trigger OnValidate()
            begin
                if cleared = true then begin
                    MarkAsCleared();
                end;

            end;
        }
        field(9; "Date Cleared"; DateTime)
        {
            Editable = false;
            Caption = 'Date Cleared';
        }
        field(10; "Date Initiated"; DateTime)
        {
            Editable = false;
            Caption = 'Date Initiated';
        }
        field(11; Comments; Text[500])
        {
            Caption = 'Comments';
        }
        field(12; "Not Cleared"; Boolean)
        {
            Caption = 'Not Cleared?';
            trigger OnValidate()
            begin
                if "Not Cleared" = true then begin
                    MarkNotCleared();
                end;
            end;

        }
        field(13; Designation; Text[250])
        {
            Editable = false;
            Caption = 'Designation';
        }
    }
    keys
    {
        key(PK; "Employee No", "Cleared By")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin

    end;

    procedure MarkAsCleared()
    begin
        Clearancelines.Reset();
        Clearancelines.SetRange("Employee No", Clearancelines."Employee No");
        Clearancelines.SetFilter("Cleared By", '=%1', UserId);
        if Clearancelines.Find('-') then begin
            if (Clearancelines.Status = Clearancelines.Status::" ") or (Clearancelines.Status = Clearancelines.Status::"Not Cleared") then begin
                Clearancelines."Date Cleared" := CurrentDateTime;
                Clearancelines.Status := Clearancelines.Status::Cleared;
                Clearancelines.Modify();
            end;
        end else
            Error('%1 you are not obliged to clear on this line', UserId);
    end;



    procedure MarkNotCleared()
    begin


        if (Clearancelines.Status = Clearancelines.Status::" ") then begin
            if Clearancelines.Comments = '' then error('Comments cannot be empty');

            Clearancelines.Status := Clearancelines.Status::"Not Cleared";
            Clearancelines.Modify();
        end;//or (Clearancelines.Status = Clearancelines.Status::"Not Cleared") then

    end;



    var
        Clearancelines: Record "Clearance lines";
        Clearancesetup: Record "Clearance Template Setup";
}
