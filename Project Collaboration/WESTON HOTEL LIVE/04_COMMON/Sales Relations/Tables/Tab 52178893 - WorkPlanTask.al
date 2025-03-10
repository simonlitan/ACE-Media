table 52178893 "WorkPlan Task"
{
    ;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Task ID"; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

        }
        field(2; "Task Description"; Text[250])
        {
            Caption = 'Objectives';
            DataClassification = ToBeClassified;
        }
        field(3; "Time"; DateTime)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(4; "ToDo ID"; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = "PA ToDo"."ToDo ID";
        }
        field(6; "Contact No"; Code[20])
        {
            TableRelation = Contact."No." where("No." = field("Contact No"));
            trigger OnValidate()
            var
                ContactP: Record Contact;
            begin
                ContactP.Reset();
                ContactP.SetRange("No.", "Contact No");
                if ContactP.Find('-') then
                    "Contact Name" := ContactP.Name;
            end;
        }
        field(7; "Contact Name"; Code[50])
        {

        }
        field(8; Venue; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Estimated Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Feedback; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Contact Person"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Contact Person Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Contact Person Email"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Task ID", "ToDo ID")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        setup: Record "Loyalty Setups";
        Series: Codeunit NoSeriesManagement;
    begin
        if "Task ID" = '' then begin
            setup.Get();
            "Task ID" := Series.GetNextNo(setup."Loyalty Customers", 0D, true)
        end;

    end;
}

