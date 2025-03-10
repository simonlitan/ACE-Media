table 52178902 "Cleaning Header"
{
    Caption = 'Cleaning Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[50])
        {
            Editable = false;
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(2; "Start Date"; Date)
        {

            Caption = 'Start Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Schedule Type" = "Schedule Type"::Weekly then begin
                    "End Date" := CalcDate('1W', "Start Date")
                end else
                    if "Schedule Type" = "Schedule Type"::Monthly
           then begin
                        "End Date" := CalcDate('1M', "Start Date")
                    end;
            end;
        }
        field(3; "Supervisor No"; Code[50])
        {
            Caption = 'Supervisor No';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active));
            trigger OnValidate()
            begin
                Hrempc.Reset();
                Hrempc.SetRange("No.", "Supervisor No");
                if Hrempc.Find('-') then
                    "Supervisor Name" := Hrempc."First Name" + '' + Hrempc."Middle Name" + '' + Hrempc."Last Name";
            end;
        }
        field(4; "Supervisor Name"; Text[150])
        {
            Caption = 'Supervisor Name';
            DataClassification = ToBeClassified;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Schedule Type"; Option)
        {
            Caption = 'Schedule Type';
            OptionMembers = " ",Weekly,Monthly;
            DataClassification = ToBeClassified;
        }
        field(7; "Created By"; Code[50])
        {
            Editable = false;
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(8; "Created On"; date)
        {
            Editable = false;
            Caption = 'Created On';
            DataClassification = ToBeClassified;
        }
        field(9; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Closed; Boolean)
        {

        }


    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    procedure OnClose()
    begin
        Cleaningheader.Reset();
        Cleaningheader.SetRange(Cleaningheader.No, rec.No);
        Cleaningheader.SetRange(Closed, false);
        if Cleaningheader.Find('-') then begin
            Cleaningheader.Closed := true;
            Cleaningheader.Modify();
            Message('Cleaning Schedule' + ' ' + Format(No) + ' ' + 'Successfully Closed');
        end else
            Error('Cleaning Schedule' + ' ' + Format(No) + ' ' + 'is already Closed!');
    end;

    trigger OnDelete()
    begin
        if Closed = true then Error('The Schedule is already closed');
    end;

    trigger OnModify()
    begin
        if Closed = true then Error('The Schedule is already closed');
    end;

    trigger OnInsert()

    begin
        if "Schedule Type" = "Schedule Type"::" " then Error('First Choose the schedule type');
        if "No" = '' then begin
            Hrsetup.Get();
            Hrsetup.TestField(Hrsetup."Cleaning Nos");
            NoSeriesMgt.InitSeries(Hrsetup."Cleaning Nos", xRec."No Series", 0D, "No", "No Series");
        end;
        "Created By" := USERID;
        "Created On" := Today;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Hrsetup: record "HRM-Setup";
        Hrempc: Record "HRM-Employee C";
        Cleaningheader: Record "Cleaning Header";
}
