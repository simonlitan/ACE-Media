table 52178900 "Visitor Pass"
{
    Caption = 'Visiftor Pass';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Visitor ID"; Code[20])
        {
            Caption = 'Visitor ID';
            DataClassification = ToBeClassified;
        }
        field(2; Salutation; Option)
        {
            Caption = 'Salutation ';
            DataClassification = ToBeClassified;
            OptionCaption = ',MR,MRS,MISS,MS,DR.,CC,ASSCOC.PROF,PROF.';
            OptionMembers = "","MR.","MRS.","MISS.","MS.","DR.",CC,"ASSCOC.PROF","PROF.",PROF;
        }
        field(3; "Full Name"; Text[500])
        {
            Caption = 'Full Name';
            DataClassification = ToBeClassified;
        }
        field(4; From; Text[250])
        {
            Caption = 'From';
            DataClassification = ToBeClassified;
        }
        field(5; "Officer to visit"; Text[300])
        {
            Caption = 'Officer to visit';
            DataClassification = ToBeClassified;
        }
        field(6; "Job Title"; Text[250])
        {
            Caption = 'Job Title';
            DataClassification = ToBeClassified;
        }
        field(7; "Signed"; Boolean)
        {
            Caption = 'Signed by Offficer';
            DataClassification = ToBeClassified;
        }
        field(8; Comments; Text[500])
        {
            Caption = 'Comments';
            DataClassification = ToBeClassified;
        }
        field(9; "Date"; Date)
        {
            Caption = 'Date ';
            DataClassification = ToBeClassified;
        }
        field(10; "Time In"; DateTime)
        {
            Caption = 'Time In';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Time Out"; DateTime)
        {
            Caption = 'Time Out';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Officer ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C" where("Global Dimension 2 Code" = filter('CEO'));
        }
        field(13; "Visit Reason"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Official,Personal;
        }
        field(14; "Officer Department"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Officer Signature"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(18; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = Open,Waiting,Sent,Cancelled,Accepted,Signed,"Checked-Out";
        }
        field(19; "Signed by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Visitor ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "Visitor ID" = '' then begin
            // CRMSetup.Get();
            // CRMSetup.TestField("Visitor ID");
            // NoSeriesMgt.InitSeries(CRMSetup."Visitor ID", CRMSetup."Visitor ID", WorkDate(), "Visitor ID", CRMSetup."Visitor ID");
            Date := Today;
            "Time In" := CurrentDateTime;
        end;
    end;

    var
        // CRMSetup: Record "CRM-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
