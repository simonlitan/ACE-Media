table 52178916 "Cm Visitors"
{
    Caption = 'Cm Visitors';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[50])
        {
            editable = false;
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "ID No"; Code[50])
        {
            Caption = 'ID/Passport No';
            DataClassification = ToBeClassified;
        }
        field(3; Name; Text[250])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(4; "E-Mail"; Text[100])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
        }
        field(5; "Phone No"; Integer)
        {
            Caption = 'Phone No';
            DataClassification = ToBeClassified;
        }
        field(6; "Purpose of Visit"; Text[1048])
        {
            Caption = 'Purpose of Visit';
            DataClassification = ToBeClassified;
        }
        field(7; Feedback; Text[1048])
        {
            Caption = 'Feedback';
            DataClassification = ToBeClassified;
        }
        field(8; "Time In"; Time)
        {
            editable = false;
            Caption = 'Time In';
            DataClassification = ToBeClassified;
        }
        field(9; "Time Out"; Time)
        {
            editable = false;
            Caption = 'Time Out';
            DataClassification = ToBeClassified;
        }
        field(10; "Date"; Date)
        {
            editable = false;
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(11; "Created By"; code[50])
        {
            editable = false;
        }
        field(12; "No Series"; code[10])
        {

        }
        field(13; Status; option)
        {
            editable = false;
            optionmembers = New,"Checked In","Checked Out";
        }
        field(14; Nationality; Text[50])
        {

        }
        field(15; Office; Text[100])
        {
            // CaptionClass = '1,2,3';
            //Caption = '';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                         Blocked = CONST(false));

        }
        field(16; "Officer to See"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            trigger OnValidate()
            begin
                Hrempc.Reset();
                Hrempc.SetRange("No.", "Officer to See");
                if Hrempc.Find('-') then begin
                    "Officer Name" := Hrempc."First Name" + ' ' + Hrempc."Middle Name" + '' + Hrempc."Last Name";
                end;
            end;

        }
        field(17; "Officer Name"; Text[250])
        {

        }
        field(18; "Appointment Date"; Date)
        {

        }
        field(19; "Badge No"; code[100])
        {

        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            Hrsetup.Get();
            Hrsetup.TestField(Hrsetup."Visitor Nos");
            NoSeriesMgt.InitSeries(Hrsetup."Visitor Nos", xRec."No Series", 0D, "No.", "No Series");
        end;
        "Created By" := UserId;
        "Date" := Today;
        "Time In" := Time;

    end;

    procedure CheckIn()
    begin
        TestField("Purpose of Visit");
        Cmvisitor.Reset();
        Cmvisitor.SetRange(Cmvisitor."No.", "No.");
        if Cmvisitor.Find('-') then begin
            if Cmvisitor.Status = Cmvisitor.Status::New then begin
                Cmvisitor.Status := Cmvisitor.Status::"Checked In";
                Cmvisitor.Modify();
                Message('%1 Successfully registered', Name);
            end else
                Error('The selected visitor is already %1', Status);
        end;
    end;

    procedure CheckOut()
    begin
        TestField(Feedback);
        Cmvisitor.Reset();
        Cmvisitor.SetRange(Cmvisitor."No.", "No.");
        if Cmvisitor.Find('-') then begin
            if Cmvisitor.Status = Cmvisitor.Status::"Checked In" then begin
                Cmvisitor.Status := Cmvisitor.Status::"Checked Out";
                Cmvisitor."Time Out" := Time;
                Cmvisitor.Modify();
                Message('%1 Successfully checked out', Name);
            end else
                Error('The selected visitor is  %1', Status);
        end;
    end;

    var
        Hrsetup: Record "HRM-Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;
        Cmvisitor: record "Cm Visitors";
        Hrempc: Record "HRM-Employee C";
        Fieldvisible: Boolean;
        Fieldvisible1: Boolean;
        feedbackeditable: Boolean;
        Allfieldseditable: Boolean;
}
