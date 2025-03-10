table 52178960 "Received Mail"
{
    Caption = 'Received Mail';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Mail ID"; Code[20])
        {
            Caption = 'Mail ID';
            DataClassification = ToBeClassified;
        }
        field(2; Sender; Text[300])
        {
            Caption = 'Sender';
            DataClassification = ToBeClassified;
        }
        field(3; "Received From"; Option)
        {
            Caption = 'Received From';
            DataClassification = ToBeClassified;
            OptionMembers = ClientsPartners,DirectorsOffice;
            OptionCaption = 'Clients/Partners,Directors Office';
        }
        field(4; "KEFRI's"; Boolean)
        {
            Caption = 'KEFRI''s';
            DataClassification = ToBeClassified;

        }
        field(5; "Send back to Sender"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Receieved by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Received at"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Official,Personal;
        }
        field(9; "Subject"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Pigeon Hole ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pigeon Hole"."Hole ID" where(Status = filter(Open));
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
            RegistrySetup.TestField("Mail ID");
            NoSeriesMgnt.InitSeries(RegistrySetup."Mail ID", RegistrySetup."Mail ID", WorkDate(), "Mail ID", RegistrySetup."Mail ID");
            "Receieved by" := UserId;
            "Received at" := CurrentDateTime;
        end;
    end;

}
