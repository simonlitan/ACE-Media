table 52179258 "HRM-Complaint Mgt Header"
{
    Caption = 'HRM-Complaint Mgt Header';
    DataClassification = ToBeClassified;
    DrillDownPageId = "HRM-Complaint List";

    fields
    {
        field(1; "No."; Code[50])
        {
            Editable = false;
            Caption = 'No.';
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; Description; Text[2048])
        {
            Caption = 'Description';
        }
        field(4; "Type of Complaint"; Option)
        {
            Caption = 'Type of Complaint';
            optionmembers = "Internal",External;


        }
        field(5; "Complainant No"; Code[50])
        {

            Caption = 'Complainant No';
            tablerelation = if ("Type of Complaint" = const("Internal")) "HRM-Employee C"."No." where(status = const(Active));
            trigger OnValidate()
            begin
                Empc.Reset();
                Empc.SetRange("No.", "Complainant No");
                if Empc.Find('-') then begin
                    "Complainant Name" := Empc."First Name" + ' ' + empc."Middle Name" + ' ' + Empc."Last Name";
                end;
            end;
        }
        field(6; "Complainant Name"; Text[250])
        {

            Caption = 'Complainant Name';

        }
        field(7; Telephone; Integer)
        {
            Caption = 'Telephone';
        }
        field(8; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(9; Status; Code[100])
        {
            Caption = 'Status';
        }
        field(10; "Created By"; Code[50])
        {
            Editable = false;
            Caption = 'Created By';
        }
        field(11; "No. Series"; Code[50])
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
    var
        Hrsetups: Record "HRM-Setup";
        Empc: Record "HRM-Employee C";
        Fieldeditable: Boolean;
        Fieldeditable1: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;



    trigger OnInsert()
    begin

        if "No." = '' then begin
            Hrsetups.reset();
            Hrsetups.Get();
            Hrsetups.TestField("Complaint Nos");
            NoSeriesMgt.InitSeries(Hrsetups."Leave Allowance No", "No. Series", 0D, "No.", "No. Series");
            Rec."Created By" := UserId;
            Date := Today;
            Validate("No.");


        end;
    end;

    trigger OnModify()
    begin
        if "Type of Complaint" = "Type of Complaint"::Internal then
            Fieldeditable := false
        else
            Fieldeditable := true;
        if "Type of Complaint" = "Type of Complaint"::External then Fieldeditable1 := false else Fieldeditable1 := true;
    end;




}
