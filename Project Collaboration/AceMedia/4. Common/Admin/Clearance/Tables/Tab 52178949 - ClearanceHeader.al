Table 52178949 "Clearance Header"
{
    Caption = 'Clearance Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            trigger OnValidate()
            begin
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
        }
        field(2; "Employee Name"; Text[200])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(3; "Date"; Date)
        {
            Editable = false;
            Caption = 'Date';
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
            captionclass = '1,1,2';
            Editable = false;
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                         Blocked = CONST(false));
        }
        field(6; "Shortcut Dimension 3 Code"; Code[50])
        {
            captionclass = '1,2,3';
            Editable = false;
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));
        }
        field(7; Reason; Text[2048])
        {
            Caption = 'Reason';
        }
        field(8; "Date of Leaving"; Date)
        {
            Caption = 'Date of Leaving';
        }
        field(9; Status; Option)
        {
            Editable = false;
            Caption = 'Status';
            OptionMembers = Open,"In Progress",Submitted,Cleared;
        }
        field(10; Submit; Boolean)
        {
            Editable = false;
            Caption = 'Submit';
        }
        field(11; "User Id"; Code[50])
        {
            Editable = false;
        }
        field(12; "Nature of Leaving"; Option)
        {

            OptionCaption = ' ,Retired,Resigned,Dismissed,Discharged,Deceased,Contract Expiry,Study Leave';
            OptionMembers = " ",Retired,Resigned,Dismissed,Disabled,Discharged,Deceased,"Study Leave","Contract Expiry";

        }
        field(13; Designation; Text[250])
        {

        }
    }
    keys
    {
        key(PK; "Employee No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "User Id" := UserId;
        Date := Today;
    end;

    procedure MarkAsInactive()
    begin
        Clearancheader.Reset();
        Clearancheader.SetRange("Employee No", rec."Employee No");
        Clearancheader.SetRange(Status, Clearancheader.Status::Submitted);
        if Clearancheader.Find('-') then begin
            Empc.Reset();
            Empc.SetRange("No.", Clearancheader."Employee No");
            if Empc.Find('-') then begin
                Empc.Status := Empc.Status::Inactive;
                Empc."Status 2" := Clearancheader."Nature of Leaving";
                Empc.Modify();
            end;
            Clearancheader.Status := Clearancheader.Status::Cleared;
            Clearancheader."Date of Leaving" := date;
            Clearancheader.Modify();
            Message('Marked as Cleared');
        end;
    end;

    procedure GetClearance()
    begin
        Clearancheader.Reset();
        Clearancheader.SetRange("Employee No", rec."Employee No");
        // Clearancheader.SetRange(Status, Clearancheader.Status::Open);
        if Clearancheader.Find('-') then begin
            Clearancesetup.Reset();
            Clearancesetup.SetRange(active, true);
            if Clearancesetup.find('-') then begin
                repeat
                    Clearancelines.Init();
                    Clearancelines."Employee No" := rec."Employee No";
                    Clearancelines."Cleared By" := Clearancesetup."User Name";
                    Clearancelines."Clearer Name" := Clearancesetup."Employee Name";
                    Clearancelines."Global Dimension 1 Code" := Clearancesetup."Global Dimension 1 Code";
                    Clearancelines."Global Dimension 2 Code" := Clearancesetup."Global Dimension 2 Code";
                    Clearancelines."Shortcut Dimension 3 Code" := Clearancesetup."Shortcut Dimension 3 Code";
                    Clearancelines.Designation := Clearancesetup.Designation;
                    Clearancelines."Date Initiated" := CurrentDateTime;
                    Clearancelines.Insert();
                until Clearancesetup.Next() = 0;
            end;



        end;
        Clearancheader.Status := Clearancheader.Status::"In Progress";
        Clearancheader.Modify();
        Message('Clearance Initiated');
    end;


    procedure SubmitToHr()
    begin
        Clearancheader.Reset();
        Clearancheader.SetRange("Employee No", rec."Employee No");
        Clearancheader.SetRange(Submit, false);
        if Clearancheader.Find('-') then begin
            Clearancelines.Reset();
            Clearancelines.SetRange("Employee No", Clearancheader."Employee No");
            Clearancelines.SetFilter(Status, '<>%1', Clearancelines.Status::Cleared);
            if Clearancelines.Count > 0 then begin
                Error('Make sure you are cleared fully before submitting the document')
            end else
                Clearancheader.Submit := true;
            Clearancheader.Status := Clearancheader.Status::Submitted;
            Clearancheader.Modify();
            Message('Document Submitted successfully');
        end;
    end;

    var
        Clearancelines: Record "Clearance lines";
        Clearancesetup: Record "Clearance Template Setup";
        Clearancheader: Record "Clearance Header";
        Empc: Record "HRM-Employee C";
}
