table 52178953 "Pigeon Hole"
{
    Caption = 'Pegion Hole';
    DataClassification = ToBeClassified;
    LookupPageId = "Pigeon Holes";

    fields
    {
        field(1; "Hole ID"; Code[20])
        {
            Caption = 'Hole ID';
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C";
            trigger OnValidate()
            var
                Owners: Record "HRM-Employee C";
            begin
                Owners.Reset();
                Owners.SetRange("No.", "Hole ID");
                if Owners.Find('-') then
                    Owner := Owners."First Name" + ' ' + Owners."Middle Name" + ' ' + Owners."Last Name";
                "Date Created" := Today;
                "Created By" := UserId;
            end;
        }
        field(2; Owner; Text[250])
        {
            Caption = 'Owner';
            DataClassification = ToBeClassified;
        }
        field(3; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(5; "Modified by"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Date Modified"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Closed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Closed,Transfered;
            Editable = false;
        }
        field(9; Secretary; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HRM-Employee C";
            trigger OnValidate()
            var
                Sec: Record "HRM-Employee C";
            begin
                Sec.Reset();
                Sec.SetRange("No.", "Hole ID");
                if Sec.Find('-') then
                    "Secretary Name" := Sec."First Name" + ' ' + Sec."Middle Name" + ' ' + Sec."Last Name";
            end;
        }
        field(10; "Secretary Name"; Text[100])
        {
        }
        field(11; "Department Name"; Text[100])
        {
        }

    }
    keys
    {
        key(PK; "Hole ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Hole ID", Owner, Status)
        {

        }
    }
    trigger OnModify()
    var
    begin
        "Modified by" := UserId;
        "Date Modified" := CurrentDateTime;
        Modify();
    end;
}
