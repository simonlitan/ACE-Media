table 52178951 "Departmental File"
{
    Caption = 'Departmental File';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Folio No."; Code[20])
        {
            Caption = 'Folio No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Subject"; Text[250])
        {
            Caption = 'Subject';
            DataClassification = ToBeClassified;
        }
        field(3; Confidential; Boolean)
        {
            Caption = 'Confidential';
            DataClassification = ToBeClassified;
        }
        field(4; Department; Code[100])
        {
            Caption = 'File No.';
            //DataClassification = ToBeClassified;
            TableRelation = "File Indexes"."File Index code";// where("Dimension type value" = filter(Posting));
            trigger OnValidate()
            var
                DPTN: Record "File Indexes";
            begin
                DPTN.Reset;
                DPTN.SetRange("File Index code", Department);
                IF DPTN.Find('-') then
                    "Department Name" := DPTN."File Name";
            end;
        }
        field(16; "Reference No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Department Name"; Text[100])
        {
            Caption = 'File Name';
        }
        field(5; "Has External Documents"; Boolean)
        {
            Caption = 'Has External Documents';
            DataClassification = ToBeClassified;
        }
        field(6; Sender; Text[300])
        {
            Caption = 'Sender';
            DataClassification = ToBeClassified;
        }
        field(7; "Received From"; Option)
        {
            Caption = 'Received From';
            DataClassification = ToBeClassified;
            OptionMembers = ClientsPartners,DirectorsOffice;
            OptionCaption = 'Clients/Partners,Directors Office';
        }
        field(8; "Receieved by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Received at"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Official,Personal;
        }
        field(12; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = Open,Received,Marked,BroughtUp,Collected,Forwarded,Returned,Assigned;
            OptionCaption = 'Open,Received,Marked,Brought Up,Collected,Forwarded,Returned,Assigned';
        }
        field(13; "pigeon Holes"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Pigeon Hole");
        }
        field(14; "Ref No."; Code[20])
        {
            DataClassification = ToBeClassified;
            //Caption='Recieved Mail';
            TableRelation = "Received Mail";
            Editable = false;
        }
        field(15; Comment; Text[250])
        {
        }
        field(51101; "Assign Staff"; Code[50])
        {
            TableRelation = "HRM-Employee C"."No.";
            trigger OnValidate()
            var
                HRMEmployeeD: Record "HRM-Employee C";

            begin
                HRMEmployeeD.Reset;
                HRMEmployeeD.SetRange("No.", "Assign Staff");
                IF HRMEmployeeD.Find('-') then
                    "Staff Name" := HRMEmployeeD."First Name" + ' ' + HRMEmployeeD."Middle Name" + ' ' + HRMEmployeeD."Last Name";
                "Staff Mail" := HRMEmployeeD."Company E-Mail";
            end;
        }
        field(51108; "Staff Name"; Text[250])
        {

        }
        field(51109; "Staff Mail"; Text[250])
        {

        }
        field(17; "Date Assigned"; Date)
        {
        }
    }
    keys
    {
        key(PK; "Folio No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        RegistrySetup: Record "Admin No Series";
        NoSeriesMgnt: Codeunit NoSeriesManagement;
    begin
        if "Folio No." = '' then begin
            RegistrySetup.Get();
            RegistrySetup.TestField("Folio No.");
            NoSeriesMgnt.InitSeries(RegistrySetup."Folio No.", RegistrySetup."Folio No.", WorkDate(), "Folio No.", RegistrySetup."Folio No.");
        end;
    end;

    Procedure Notemail()
    var
        deptfll: Record "Departmental File";
        //Committiee: Record "Committee Members Line";
        Email: Codeunit Email;
        Recipients: List of [text];
        EmailMessage: Codeunit "Email Message";
        Body: Text;
        Taskmessage: Label 'Greetings <b> %1 </b> <br> The mail with folio no. <b> %2 </b> has been Marked to you for your action <br> Best Regards.<br><> %3 </>';

    begin
        deptfll.Reset();
        deptfll.SetRange("Folio No.", Rec."Folio No.");
        //deptfll.SetRange(status, deptfll.status::Approved);
        if deptfll.Find('-') then begin
            repeat
                Recipients.Add(deptfll."Staff Mail");
            until deptfll.Next() = 0;
        end;
        Body := StrSubstNo(Taskmessage, deptfll."Staff Name", deptfll."Folio No.", UserId);
        EmailMessage.Create(Recipients, 'Noted Mail FYA', Body, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        Message('Email Sent to the Recipients');


    end;


}
