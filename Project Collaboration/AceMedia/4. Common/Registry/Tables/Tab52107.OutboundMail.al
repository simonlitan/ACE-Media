table 52178958 "Outbound Mail"
{
    Caption = 'Outbound Mail';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Mail ID"; Code[20])
        {
            Caption = 'Mail ID';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Mail Description"; Text[300])
        {
            Caption = 'Subject';
            DataClassification = ToBeClassified;
        }
        field(3; Destination; Text[250])
        {
            Caption = 'Destination';
            DataClassification = ToBeClassified;
        }
        field(4; From; Text[200])
        {
            Caption = 'Recieved From';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C";

            trigger OnValidate()
            var
                Officer: Record "HRM-Employee C";
            begin
                Officer.Reset();
                Officer.SetRange("No.", From);
                if Officer.Find('-') then begin
                    From := Officer."First Name" + ' ' + Officer."Middle Name" + ' ' + Officer."Last Name";
                    Department := Officer."Department Code";
                end;
            end;

        }
        field(9; Department; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Date Received"; DateTime)
        {
            Caption = 'Date Received';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Date Dispatched"; DateTime)
        {
            Caption = 'Date Dispatched';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(7; "Mode of Dispatch"; Option)
        {
            Caption = 'Mode of Dispatch';
            DataClassification = ToBeClassified;
            OptionMembers = ,Posta,"Courier Services",Email,Others;
        }
        field(8; "Weight "; Option)
        {
            Caption = 'Weight ';
            DataClassification = ToBeClassified;
            OptionMembers = ,LessThan200G,LessThan500G,MoreThan1KG;
            OptionCaption = ',Less Than 200G, Less Than 500G,More Than 1KG';
        }
        field(10; "Receiving Officer"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = Open,Correction,Dispatched,Complete;
        }
        field(12; "Dispatching Officer"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Mail ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        RegistrySetup: Record "Admin No Series";
        NoSeriesMgnt: Codeunit NoSeriesManagement;
    begin
        if "Mail ID" = '' then begin
            RegistrySetup.Get();
            RegistrySetup.TestField("Outbound Mail ID");
            NoSeriesMgnt.InitSeries(RegistrySetup."Outbound Mail ID", RegistrySetup."Outbound Mail ID", WorkDate(), "Mail ID", RegistrySetup."Outbound Mail ID");
            "Date Received" := CurrentDateTime;
            "Receiving Officer" := UserId;
        end;
    end;
}
