table 52179072 "HRM-Alternative Dispute R"
{
    LookupPageId = "Alternative Dispute List";
    DrillDownPageId = "Alternative Dispute List";
    Caption = 'Alternative Dispute Resolution';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Case No"; Code[50])
        {
            editable = false;
            Caption = 'Case No';
        }
        field(2; "Counsel Dealing No"; Code[50])
        {
            Caption = 'Counsel Dealing No';
            TableRelation = "HRM-Employee C"."No." where(Status = const(Active), "State Counsel" = const(True));
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Hrmemployee.Reset();
                Hrmemployee.SetRange("No.", "Counsel Dealing No");
                if Hrmemployee.Find('-') then begin
                    "Counsel Dealing Name" := Hrmemployee."First Name" + ' ' + Hrmemployee."Middle Name" + ' ' + Hrmemployee."Last Name";
                end;
            end;
        }
        field(3; "Counsel Dealing Name"; Text[250])
        {
            editable = false;
            Caption = 'Counsel Dealing Name';
        }
        field(4; "Investigating Officer No"; Code[50])
        {
            Caption = 'Investigating Officer No';
            tablerelation = "HRM-Employee C"."No." where(Status = const(active));
            trigger onvalidate()
            begin
                Hrmemployee.Reset();
                Hrmemployee.SetRange("No.", "Investigating Officer No");
                if Hrmemployee.Find('-') then
                    "Investigating Officer Name" := Hrmemployee."First Name" + ' ' + Hrmemployee."Middle Name" + ' ' + Hrmemployee."Last Name";
            end;
        }
        field(5; "Investigating Officer Name"; Text[250])
        {
            editable = false;
            Caption = 'Investigating Officer Name';
        }
        field(6; Status; Option)
        {
            editable = false;
            Caption = 'Status';
            OptionMembers = "Under Negotiation","Pending Approval",Approved;
        }
        field(7; "Status 2"; Option)
        {
            editable = false;
            Caption = 'Status 2';
            OptionMembers = " ",Successful,"Not Successful";
        }
        field(8; "User Id"; code[50])
        {
            editable = false;
        }
        field(9; Date; date)
        {
            editable = false;
        }
        field(10; "No Series"; code[50])
        {

        }
    }
    keys
    {
        key(PK; "Case No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Case No" = '' then begin
            CaseNoSeries.Reset();
            CaseNoSeries.Get();
            CaseNoSeries.TestField(CaseNoSeries."ADR Nos");
            NoSeriesMgt.InitSeries(CaseNoSeries."ADR Nos", "No Series", 0D, "Case No", "No Series");

        end;
        date := today;
        "User Id" := userid;
    end;

    procedure UpdateStatus()
    begin
        // if adr.status = status::approved then begin
        adr.Reset();
        adr.setrange(adr."Case No", "Case No");
        if adr.Find('-') then
            adr."Status 2" := "Status 2"::Successful;
        adr.Modify();
        //end;
    end;

    procedure UpdateStatus2()
    begin
        adr.Reset();
        adr.setrange(adr."Case No", "Case No");
        if adr.Find('-') then
            adr."Status 2" := "Status 2"::"Not Successful";
        adr.Modify();
    end;

    var
        RecRef: RecordRef;
        DocumentAttachmentDetails: Page "Document Attachment Details";
        DocAttach: codeunit "Documents";
        NewCaseCode: code[50];
        NewInvCode: code[50];
        CaseNoSeries: Record "HRM-Setup";
        //  CaseNoSeries: record "Case No Series";
        NoseriesMgt: Codeunit NoSeriesManagement;
        Adr: record "HRM-Alternative Dispute R";
        Hrmemployee: Record "HRM-Employee C";
    // Members: record "Setup Case Table";
}
