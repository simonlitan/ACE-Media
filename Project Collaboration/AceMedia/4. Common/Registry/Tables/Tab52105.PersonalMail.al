table 52178954 "Personal Mail"
{
    Caption = 'Personal Mail';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Mail ID"; Code[20])
        {
            Caption = 'Mail ID';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(5; "Subject"; Text[300])
        {
            Caption = 'Subject';
            DataClassification = ToBeClassified;
        }
        field(6; "Received by"; Code[20])
        {
            Caption = 'Received by';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Received From"; Option)
        {
            Caption = 'Received From';
            DataClassification = ToBeClassified;
            OptionMembers = ClientsPartners,DirectorsOffice;
            OptionCaption = 'Clients/Partners,Directors Office';
        }
        field(3; "Date Posted"; DateTime)
        {
            Caption = 'Date Posted';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; Sender; Text[250])
        {
            Caption = 'Sender';
            DataClassification = ToBeClassified;
        }

        field(8; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Official,Personal;
        }
        field(2; "Hole ID"; Code[20])
        {
            Caption = 'Hole ID';
            DataClassification = ToBeClassified;
        }
        field(9; "Collected?"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Date Collected"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Recepient"; Text[250])
        {
            Caption = 'Recepient';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Pigeon Hole".Owner where("Hole ID" = field("Hole ID")));
        }
        field(12; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Received,Marked,BroughtUp,Collected;
            OptionCaption = 'Open,Received,Marked,Brought Up,Collected';
        }
        field(13; "Ref No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Received Mail";
            Editable = false;
        }


    }
    keys
    {
        key(PK; "Mail ID", "Hole ID")
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
            RegistrySetup.TestField("Personal Mail");
            NoSeriesMgnt.InitSeries(RegistrySetup."Personal Mail", RegistrySetup."Personal Mail", WorkDate(), "Mail ID", RegistrySetup."Personal Mail");
            "Received by" := UserId;
            "Date Posted" := CurrentDateTime;
        end;
    end;
}
